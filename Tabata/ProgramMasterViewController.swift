//
//  MasterViewController.swift
//  mdtest
//
//  Created by Lamb, Christopher Charles on 3/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class ProgramMasterViewController: UITableViewController {
    
    let animals = ["Dogs","Cats","Mice"]
    let messages = [
        "Will slobber on you",
        "Will sleep on you",
        "Will provide food for cat"
    ]

    var detailViewController: ProgramDetailViewController? = nil
    var objects = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController =
                (controllers[controllers.count-1] as! UINavigationController)
                    .topViewController as? ProgramDetailViewController
        }
        
        navigationController!.navigationBar.barStyle = .BlackTranslucent
        
        tableView.backgroundColor = UIColor.blackColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        debugPrint(">> insertNewObject:sender")
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        debugPrint(">> prepareForSeque:seque:sender")
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ProgramDetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        debugPrint(">> numberOfSectionsInTableView:tableView (\(tableView))")
//        return 1
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint(">> tableView:tableView:numberOfRowsInSection")
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        debugPrint(">> tableView:tableView:cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blackColor()

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        cell.detailTextLabel!.text = "subtitle"
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.detailTextLabel!.textColor = UIColor.grayColor()
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        debugPrint(">> tableView:tableView:canEditRowAtIndexPath")
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        debugPrint(">> tableView:tableView:commitEditingStyle:forRowAtIndexPath")
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return animals.count
    //
    //    }
    
    //    override func tableView(
    //        tableView: UITableView,
    //        cellForRowAtIndexPath indexPath: NSIndexPath
    //        ) -> UITableViewCell {
    //
    //            let cell:UITableViewCell = UITableViewCell(
    //                style: UITableViewCellStyle.Subtitle,
    //                reuseIdentifier: "cell"
    //            )
    //
    //            cell.backgroundColor = UIColor.blackColor()
    //            //cell.layer.borderWidth = 1
    //            cell.layer.borderColor = UIColor.grayColor().CGColor
    //            cell.accessoryType = .DetailDisclosureButton
    //            cell.tintColor = UIColor(red: 57/255, green: 255/255, blue: 20/255, alpha: 1)
    //
    //            cell.textLabel!.text = animals[indexPath.row]
    //            cell.detailTextLabel!.text = messages[indexPath.row]
    //            cell.textLabel!.textColor = UIColor.whiteColor()
    //            cell.detailTextLabel!.textColor = UIColor.grayColor()
    //
    //            return cell;
    //    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        debugPrint("\(indexPath.row)")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        debugPrint(objects[indexPath.row])
    }

}

