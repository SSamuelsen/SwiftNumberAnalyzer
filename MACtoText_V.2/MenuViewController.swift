//
//  MenuViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/16/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var macAnalyzeButtonOutlet: Button!
    @IBOutlet weak var computerFormButtonOutlet: Button!
    @IBOutlet weak var viewFormsButtonOutlet: Button!
    
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    private let refresh = UIRefreshControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initialize the delegates
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        //add refresh functionality
        if #available(iOS 10.0, *) {                //add the fresh capabilities to collection view
            menuCollectionView.refreshControl = refresh
        } else {
            menuCollectionView.addSubview(refresh)
        }
        
        refresh.addTarget(self, action: #selector(MenuViewController.refreshPull), for: .valueChanged)
        
        refresh.tintColor = UIColor.blue            //set color of loading wheel
        refresh.attributedTitle = NSAttributedString(string: "Loading forms...")
        
        
    }
    

    
    @IBAction func macAnalyzeButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "NumBar", sender: self)            //go to the number analyzer
        
        
        
    }
    
    
    
    @IBAction func computerFormButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "compForm", sender: self)      //go to the form creator
        
    }
    
    
    @IBAction func viewFormsButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "viewForms", sender: self)
        
    }
    
    
    
    @IBAction func scheduleButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "schedule", sender: self)
        
    }
    
    
    
    
    
    
    
    
    @objc func refreshPull() {                //used to refresh collection view data
        
        self.menuCollectionView.reloadData()
        refresh.endRefreshing()
        
    }
    
    
    
    
    
    

}//end of class







extension MenuViewController: UICollectionViewDataSource {            //extension of CollectionFormViewController //conform to the data source protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 20        //number of cells 
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! menuCell         //cast as the file we made to customize the images
        
        return cell
        
        
        
        
    }
    
    
    
    
    
    
}//end of extension






extension MenuViewController: UICollectionViewDelegateFlowLayout {        //conform to the delegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let columnsNumber:CGFloat = 2
        let width = menuCollectionView.frame.size.width
        let xInsets:CGFloat = 10
        let cellSpace: CGFloat = 5
        
        
        return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
    }
    
}//end of extension
