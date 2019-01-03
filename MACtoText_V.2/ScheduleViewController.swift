//
//  ScheduleViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 8/2/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var scheduleBoard: UICollectionView!
    
    @IBOutlet weak var itemsCollection: UICollectionView!
    
    @IBOutlet weak var scheduleBoard2: UICollectionView!
    @IBOutlet weak var scheduleBoard3: UICollectionView!
    @IBOutlet weak var scheduleBoard4: UICollectionView!
    
    
    
    var items = ["1"]    //test array
    
    var schedule:[String] = ["1"]
    var schedule2:[String] = []
    var schedule3:[String] = []
    var schedule4:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initizlize delegate
        scheduleBoard.delegate = self
        scheduleBoard.dataSource = self
        scheduleBoard.dragDelegate = self
        scheduleBoard.dropDelegate = self
        
        scheduleBoard2.delegate = self
        scheduleBoard2.dataSource = self
        scheduleBoard2.dragDelegate = self
        scheduleBoard2.dropDelegate = self
        
        scheduleBoard3.delegate = self
        scheduleBoard3.dataSource = self
        scheduleBoard3.dragDelegate = self
        scheduleBoard3.dropDelegate = self
        
        scheduleBoard4.delegate = self
        scheduleBoard4.dataSource = self
        scheduleBoard4.dragDelegate = self
        scheduleBoard4.dropDelegate = self
        
        itemsCollection.delegate = self
        itemsCollection.dataSource = self
        itemsCollection.dragDelegate = self
        itemsCollection.dropDelegate = self
        
        //enable drag and drop on iPhone
        scheduleBoard.dragInteractionEnabled = true
        scheduleBoard2.dragInteractionEnabled = true
        scheduleBoard3.dragInteractionEnabled = true
        scheduleBoard4.dragInteractionEnabled = true
        itemsCollection.dragInteractionEnabled = true
        
        //re-order speed
        scheduleBoard.reorderingCadence = .fast
        scheduleBoard2.reorderingCadence = .fast
        scheduleBoard3.reorderingCadence = .fast
        scheduleBoard4.reorderingCadence = .fast
        itemsCollection.reorderingCadence = .fast
        
        
        
        itemsCollection.layer.cornerRadius = 25
        
        
        
    }//end of viewDidLoad
    

    
    
    
    
    
    

}//end of class

extension ScheduleViewController: UICollectionViewDataSource {            //extension of CollectionFormViewController //conform to the data source protocol
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.scheduleBoard {
            
           
            
            
            let selectedCell = collectionView.cellForItem(at: indexPath)
            
            let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "details")
            
            // set the presentation style
            popController.modalPresentationStyle = .overCurrentContext
            
            // set up the popover presentation controller
            popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
            popController.popoverPresentationController?.delegate = scheduleBoard.self as? UIPopoverPresentationControllerDelegate
            popController.popoverPresentationController?.sourceView = selectedCell // button
            popController.popoverPresentationController?.sourceRect = (selectedCell?.bounds)!
            
            //this is the index number of the cell pressed
            let title = String(indexPath.row)
            
            //add the navigation bar with the title being the index number of the cell that passe in the information
            //let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: popController.view.frame.width, height: 100))
            //popController.view.addSubview(navBar)
            //let navItem = UINavigationItem(title: title)
            //navBar.setItems([navItem], animated: true)
            
            UserDefaults.standard.set(title, forKey:"index")    //save the indexPath
            
            // present the popover
            self.present(popController, animated: true, completion: nil)
            
        }
            
            
        else if collectionView == self.scheduleBoard2 {
            
            
            
        }
            
        else if collectionView == self.scheduleBoard3 {
            
            
            
        }
            
        else if collectionView == self.scheduleBoard4 {
            
           
            
        }
        
        else if collectionView == self.itemsCollection {
            
            
            
        }
        
    }//end func
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.scheduleBoard {
            
            return schedule.count      //this has to count the number of items in the array
            
        }
        
        else if collectionView == self.itemsCollection {
            
            return items.count
            
        }
        
        else if collectionView == self.scheduleBoard2 {
            
            return schedule2.count
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            return schedule3.count
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            return schedule4.count
            
        }
        
        
        
        return 0  //if no collection views
        
    }//end of numberofItems
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {     //define the number of sections for the cells
        
        
        if collectionView == self.scheduleBoard {
            
            
            return 1            //only want one section
        }
        
        else if collectionView == self.scheduleBoard2 {
            
            return 1
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            return 1
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            return 1
            
        }
        
        else if collectionView == self.itemsCollection {
            
            
            return 1
            
        }
        
        return 0
        
    }//end of numberofSection
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if collectionView == self.scheduleBoard {
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell", for: indexPath) as! itemCell         //cast as the file we made to customize the images
            
            return cellA
            
        }
            
        else if collectionView == self.scheduleBoard2 {
            
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell2", for: indexPath) as! itemCell         //cast as the file we made to customize the images
            
            return cellB
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell3", for: indexPath) as! itemCell         //cast as the file we made to customize the images
            
            return cellC
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            let cellD = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell4", for: indexPath) as! itemCell         //cast as the file we made to customize the images
            
            return cellD
            
        }
        
        else { //use for item collection
            
            let cellE = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell         //cast as the file we made to customize the images
            
            return cellE
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
}//end of extension






extension ScheduleViewController: UICollectionViewDelegateFlowLayout {        //conform to the delegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.scheduleBoard {
        
        let columnsNumber:CGFloat = 2
        let width = collectionView.frame.size.width/2
        let xInsets:CGFloat = 10
        let cellSpace: CGFloat = 5
        
        
        return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
            
        }
            
        else if collectionView == self.scheduleBoard2 {
            
            let columnsNumber:CGFloat = 2
            let width = collectionView.frame.size.width/2
            let xInsets:CGFloat = 10
            let cellSpace: CGFloat = 5
            
            
            return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
            
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            let columnsNumber:CGFloat = 2
            let width = collectionView.frame.size.width/2
            let xInsets:CGFloat = 10
            let cellSpace: CGFloat = 5
            
            
            return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
            
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            let columnsNumber:CGFloat = 2
            let width = collectionView.frame.size.width/2
            let xInsets:CGFloat = 10
            let cellSpace: CGFloat = 5
            
            
            return CGSize(width: (width/columnsNumber)-(xInsets + cellSpace), height:(width / columnsNumber)-(xInsets + cellSpace))
            
            
        }
        
        else {  //use for item collection
            
            let columnsNumber:CGFloat = 2
            let width = collectionView.frame.size.width/2
            let xInsets:CGFloat = 10
            let cellSpace: CGFloat = 5
            
            
            return CGSize(width: 50, height:50)
            
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
       
        
        if collectionView == self.itemsCollection {
        
            let cellWidth : CGFloat = 50
        
            let numberOfCells = floor(self.view.frame.size.width / cellWidth)
            let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
        
                return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            
        }
        
        else {
            let cellWidth : CGFloat = 165.0
            
            let numberOfCells = floor(self.view.frame.size.width / cellWidth)
            let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
            
            return UIEdgeInsets(top: 15, left: edgeInsets, bottom: 0, right: edgeInsets)
            
        }
       
    }
    
}//end of extension

//setting up the drag and drop features
extension ScheduleViewController: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        
        
        
        if collectionView == self.scheduleBoard {
        
            let item = self.schedule[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)         //accepts object, must cast the string to be an object (string is just a value type)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
        
        }
            
        else if collectionView == self.scheduleBoard2 {
            
            let item = self.schedule2[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)         //accepts object, must cast the string to be an object (string is just a value type)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            let item = self.schedule3[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)         //accepts object, must cast the string to be an object (string is just a value type)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            let item = self.schedule4[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)         //accepts object, must cast the string to be an object (string is just a value type)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        else {       //use for item collection
            
            let item = self.items[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)         //accepts object, must cast the string to be an object (string is just a value type)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        
        
        
    }//end func
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        
        if collectionView == self.scheduleBoard {
        
            let item = self.schedule[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
        
        }
            
        else if collectionView == self.scheduleBoard2 {
            
            let item = self.schedule2[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            let item = self.schedule3[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            let item = self.schedule4[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        else {      //else for items
            
            let item = self.items[indexPath.row]
            let itemProvider = NSItemProvider(object: item as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = item
            return [dragItem]
            
        }
        
        
    }//end func
    
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal
    {
        
        
        if collectionView == self.scheduleBoard {
        
            if session.localDragSession != nil
            {
                if collectionView.hasActiveDrag
                {
                    return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                }
                else
                {
                    return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
                }
            }
            else
            {
                return UICollectionViewDropProposal(operation: .forbidden)
            }
            
        }//end if
            
        else if collectionView == self.scheduleBoard2 {
            
            if session.localDragSession != nil
            {
                if collectionView.hasActiveDrag
                {
                    return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                }
                else
                {
                    return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
                }
            }
            else
            {
                return UICollectionViewDropProposal(operation: .forbidden)
            }
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            if session.localDragSession != nil
            {
                if collectionView.hasActiveDrag
                {
                    return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                }
                else
                {
                    return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
                }
            }
            else
            {
                return UICollectionViewDropProposal(operation: .forbidden)
            }
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            if session.localDragSession != nil
            {
                if collectionView.hasActiveDrag
                {
                    return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                }
                else
                {
                    return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
                }
            }
            else
            {
                return UICollectionViewDropProposal(operation: .forbidden)
            }
            
        }
        
        else  {
            if session.localDragSession != nil
            {
                if collectionView.hasActiveDrag
                {
                    return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                }
                else
                {
                    return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
                }
            }
            else
            {
                return UICollectionViewDropProposal(operation: .forbidden)
            }
        }//end if
        
        
    }//end func
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        if collectionView == self.scheduleBoard {
        
        
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath
        {
            destinationIndexPath = indexPath
        }
        else
        {
            // Get last index path of collection view.
            let section = collectionView.numberOfSections - 1
            let row = collectionView.numberOfItems(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        switch coordinator.proposal.operation
        {
        case .move:
            let items = coordinator.items
            if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
            {
                var dIndexPath = destinationIndexPath
                if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
                {
                    dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
                }
                
//                else {
//                    dIndexPath.row = collectionView.numberOfItems(inSection: 0)
//                }
                
                collectionView.performBatchUpdates({
                    self.schedule.remove(at: sourceIndexPath.row)       //remove the object from the array
                    self.schedule.insert(item.dragItem.localObject as! String, at: dIndexPath.row)  //add new object to the array
                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [dIndexPath])
                })
                coordinator.drop(item.dragItem, toItemAt: dIndexPath)
            }
            break
            
        case .copy:
            collectionView.performBatchUpdates({
                var indexPaths = [IndexPath]()
                for (index, item) in coordinator.items.enumerated()
                {
                    //Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
                    let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                    self.schedule.insert(item.dragItem.localObject as! String, at: indexPath.row)
                    indexPaths.append(indexPath)
                }
                collectionView.insertItems(at: indexPaths)
            })
            break
            
        default:
            return
        }
        
        }//end if
        
        else if collectionView == self.scheduleBoard2 {
            
            let destinationIndexPath: IndexPath
            if let indexPath = coordinator.destinationIndexPath
            {
                destinationIndexPath = indexPath
            }
            else
            {
                // Get last index path of collection view.
                let section = collectionView.numberOfSections - 1
                let row = collectionView.numberOfItems(inSection: section)
                destinationIndexPath = IndexPath(row: row, section: section)
            }
            
            switch coordinator.proposal.operation
            {
            case .move:
                let items = coordinator.items
                if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
                {
                    var dIndexPath = destinationIndexPath
                    if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
                    {
                        dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
                    }
                    
                    //                else {
                    //                    dIndexPath.row = collectionView.numberOfItems(inSection: 0)
                    //                }
                    
                    collectionView.performBatchUpdates({
                        self.schedule2.remove(at: sourceIndexPath.row)       //remove the object from the array
                        //self.schedule2.insert(item.dragItem.localObject as! String, at: dIndexPath.row)  //add new object to the array
                        collectionView.deleteItems(at: [sourceIndexPath])
                        //collectionView.insertItems(at: [dIndexPath])
                    })
                    
                    coordinator.drop(item.dragItem, toItemAt: dIndexPath)
                    
                    
                }
                break
                
            case .copy:
                collectionView.performBatchUpdates({
                    var indexPaths = [IndexPath]()
                    for (index, item) in coordinator.items.enumerated()
                    {
                        //Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
                        let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                        self.schedule2.insert(item.dragItem.localObject as! String, at: indexPath.row)
                        indexPaths.append(indexPath)
                    }
                    collectionView.insertItems(at: indexPaths)
                })
                break
                
            default:
                return
            }
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            let destinationIndexPath: IndexPath
            if let indexPath = coordinator.destinationIndexPath
            {
                destinationIndexPath = indexPath
            }
            else
            {
                // Get last index path of collection view.
                let section = collectionView.numberOfSections - 1
                let row = collectionView.numberOfItems(inSection: section)
                destinationIndexPath = IndexPath(row: row, section: section)
            }
            
            switch coordinator.proposal.operation
            {
            case .move:
                let items = coordinator.items
                if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
                {
                    var dIndexPath = destinationIndexPath
                    if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
                    {
                        dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
                    }
                    
                    //                else {
                    //                    dIndexPath.row = collectionView.numberOfItems(inSection: 0)
                    //                }
                    
                    collectionView.performBatchUpdates({
                        self.schedule3.remove(at: sourceIndexPath.row)       //remove the object from the array
                        self.schedule3.insert(item.dragItem.localObject as! String, at: dIndexPath.row)  //add new object to the array
                        collectionView.deleteItems(at: [sourceIndexPath])
                        collectionView.insertItems(at: [dIndexPath])
                    })
                    coordinator.drop(item.dragItem, toItemAt: dIndexPath)
                }
                break
                
            case .copy:
                collectionView.performBatchUpdates({
                    var indexPaths = [IndexPath]()
                    for (index, item) in coordinator.items.enumerated()
                    {
                        //Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
                        let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                        self.schedule3.insert(item.dragItem.localObject as! String, at: indexPath.row)
                        indexPaths.append(indexPath)
                    }
                    collectionView.insertItems(at: indexPaths)
                })
                break
                
            default:
                return
            }
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            let destinationIndexPath: IndexPath
            if let indexPath = coordinator.destinationIndexPath
            {
                destinationIndexPath = indexPath
            }
            else
            {
                // Get last index path of collection view.
                let section = collectionView.numberOfSections - 1
                let row = collectionView.numberOfItems(inSection: section)
                destinationIndexPath = IndexPath(row: row, section: section)
            }
            
            switch coordinator.proposal.operation
            {
            case .move:
                let items = coordinator.items
                if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
                {
                    var dIndexPath = destinationIndexPath
                    if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
                    {
                        dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
                    }
                    
                    //                else {
                    //                    dIndexPath.row = collectionView.numberOfItems(inSection: 0)
                    //                }
                    
                    collectionView.performBatchUpdates({
                        self.schedule4.remove(at: sourceIndexPath.row)       //remove the object from the array
                        self.schedule4.insert(item.dragItem.localObject as! String, at: dIndexPath.row)  //add new object to the array
                        collectionView.deleteItems(at: [sourceIndexPath])
                        collectionView.insertItems(at: [dIndexPath])
                    })
                    coordinator.drop(item.dragItem, toItemAt: dIndexPath)
                }
                break
                
            case .copy:
                collectionView.performBatchUpdates({
                    var indexPaths = [IndexPath]()
                    for (index, item) in coordinator.items.enumerated()
                    {
                        //Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
                        let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                        self.schedule4.insert(item.dragItem.localObject as! String, at: indexPath.row)
                        indexPaths.append(indexPath)
                    }
                    collectionView.insertItems(at: indexPaths)
                })
                break
                
            default:
                return
            }
        }
            
        else {          //else if item collection
            let destinationIndexPath: IndexPath
            if let indexPath = coordinator.destinationIndexPath
            {
                destinationIndexPath = indexPath
            }
            else
            {
                // Get last index path of collection view.
                let section = collectionView.numberOfSections - 1
                let row = collectionView.numberOfItems(inSection: section)
                destinationIndexPath = IndexPath(row: row, section: section)
            }
            
            switch coordinator.proposal.operation
            {
            case .move:
                let items = coordinator.items
                if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
                {
                    var dIndexPath = destinationIndexPath
                    if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
                    {
                        dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
                    }
                    
//                    else {
//                        dIndexPath.row = collectionView.numberOfItems(inSection: 0)
//                    }
                    
                    collectionView.performBatchUpdates({
                        self.items.remove(at: sourceIndexPath.row)
                        self.items.insert(item.dragItem.localObject as! String, at: dIndexPath.row)
                        collectionView.deleteItems(at: [sourceIndexPath])
                        collectionView.insertItems(at: [dIndexPath])
                    })
                    coordinator.drop(item.dragItem, toItemAt: dIndexPath)
                }
                break
                
            case .copy:
                collectionView.performBatchUpdates({
                    var indexPaths = [IndexPath]()
                    for (index, item) in coordinator.items.enumerated()
                    {
                        //Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
                        let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                        self.items.insert(item.dragItem.localObject as! String, at: indexPath.row)
                        indexPaths.append(indexPath)
                    }
                    collectionView.insertItems(at: indexPaths)
                })
                break
                
            default:
                return
            }
        }
        
        
        return
        
    }//end of func
    
    
    //use to customize the drag preview
    func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters?
    {
        
        let previewParameters = UIDragPreviewParameters()
        previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
        
        
        if collectionView == self.scheduleBoard {
        
            let previewParameters = UIDragPreviewParameters()
            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
            return previewParameters
            
        }
            
        else if collectionView == self.scheduleBoard2 {
            
            let previewParameters = UIDragPreviewParameters()
            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
            return previewParameters
            
        }
        
        else if collectionView == self.scheduleBoard3 {
            
            let previewParameters = UIDragPreviewParameters()
            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
            return previewParameters
            
        }
        
        else if collectionView == self.scheduleBoard4 {
            
            let previewParameters = UIDragPreviewParameters()
            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
            return previewParameters
            
        }
            
        else  { //use for item collection 
            
            let previewParameters = UIDragPreviewParameters()
            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
            return previewParameters
            
        }
        
        
        
    }
    
    
    
}//end of extension

