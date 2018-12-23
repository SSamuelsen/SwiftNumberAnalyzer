//
//  CollectionFormViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/18/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit
import CoreData

class CollectionFormViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!        //outlet for our collectionView
    
    var controller: NSFetchedResultsController<Forms>!
    
    private let refresh = UIRefreshControl()            //used for pull down refresh in collection view
    
    //var formArray:[String] = []  //just the test array for the collection view
    
    var isClicked: Bool!
    var currentForm: form!          //instance of form struct
    
    
    
    var formArray:[form] = []       //stores the forms in array of form
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate     //reference appDelegate to work with CoreData
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //loadData()
        attemptFetch()
        
        if #available(iOS 10.0, *) {                //add the fresh capabilities to collection view
            collectionView.refreshControl = refresh
        } else {
            collectionView.addSubview(refresh)
        }
        
        refresh.addTarget(self, action: #selector(CollectionFormViewController.refreshPull), for: .valueChanged)
        
        refresh.tintColor = UIColor.blue            //set color of loading wheel
        refresh.attributedTitle = NSAttributedString(string: "Loading forms...")
        
        
        
        
    }//end of view did load
    

    override func viewDidAppear(_ animated: Bool) {
       
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
//        UIView.animate(withDuration: 0.5, animations: {
//
//            let w = UIScreen.main.bounds.width
//            let h = UIScreen.main.bounds.height
//
//            let label = UILabel(frame: CGRect(x: w / 2, y: h / 2, width: 120, height: 30))
//
//            label.text = String(indexPath.item)     //get the cell position number
//
//            label.center = CGPoint(x: w / 2, y: h / 2)
//            label.textAlignment = .center
//            label.textColor = UIColor.white
//            self.view?.addSubview(label)
//
//
//            })

        if let objects = controller.fetchedObjects, objects.count > 0 {     //loop through all forms and get the index array
            
            let item = objects[indexPath.item]
            performSegue(withIdentifier: "formDetails", sender: item)
            
        }
        
        
        
        
    }//end of func
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {         //send the selected form over to the next view controllers (formDetailsVC)
        
        if segue.identifier == "formDetails" {
            if let destination = segue.destination as? formDetailViewController {
                if let item = sender as? Forms {    //cast it as the name of the Core Data Entity
                    destination.formToView  = item      //set the object of type form 
                }
            }
        }
        
    }
    
    
    
    
    
    //all the core data functions
    func attemptFetch() {
        
        let fetchRequest: NSFetchRequest<Forms> = Forms.fetchRequest()
        let dataSort = NSSortDescriptor(key: "pcName", ascending: true)
        fetchRequest.sortDescriptors = [dataSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        }
        catch {
            let error = error as NSError
            print(error)
        }
        
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        //collectionView.reloadData()
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any,
                    at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        
        case .insert:
            if let indexPath = newIndexPath {
                collectionView.insertItems(at: [indexPath])
            }
        
        case .delete:
            if let indexPath = indexPath {
                collectionView.deleteItems(at: [indexPath])
            }
        
        case .update:
            if let indexPath = indexPath {
                let cell = collectionView.cellForItem(at: indexPath) as! formCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
                //revisit
                
            }
            
        case .move:
            if let indexPath = indexPath {
                collectionView.deleteItems(at: [indexPath])
            }
            if let indexPath = newIndexPath {
                collectionView.deleteItems(at: [indexPath])
            }
        
            
        
        }
        
        
    }
    
    
    func deleteAllData(entity: String)          //this function deletes all the core data
    {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: entity))
        do {
            try managedContext.execute(DelAllReqVar)
            //self.quoteTableView.reloadData()
        }
        catch {
            print(error)
        }
        
        
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        deleteAllData(entity: "Forms")
        
    }
    
    
    
    
    
    @objc func refreshPull() {                //used to refresh collection view data
        
        self.collectionView.reloadData()
        refresh.endRefreshing()
        
    }
    
    
    
    
    
    
    

}//end of class


extension CollectionFormViewController: UICollectionViewDataSource {            //extension of CollectionFormViewController //conform to the data source protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //loadData()
        
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        //return formArray.count      //number of forms saved
        
        return 0        //if there is nothing saved yet
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        
        return 0
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "formCell", for: indexPath) as! formCell         //cast as the file we made to customize the images
        
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        //loadData()
        
        //let label = formArray[indexPath.item]
        //currentForm = formArray[indexPath.item]     //set current form equal to the one in the array for each cell
        
        
        //cell.formLabel.text = currentForm.pcName.text         //set the cell equal to the item in the array
        
        return cell
        
        
        
        
    }
    
    
    func configureCell(cell: formCell, indexPath: NSIndexPath) {
        
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(forms: item)
        
    }
    
    
    
}//end of extension






extension CollectionFormViewController: UICollectionViewDelegateFlowLayout {        //conform to the delegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            
        let columnsNumber:CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets:CGFloat = 10
        let cellSpace: CGFloat = 5
        
            
        return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
    }
    
}//end of extension




