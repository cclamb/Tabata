//
//  MasterViewController.swift
//  mdtest
//
//  Created by Lamb, Christopher Charles on 3/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class ProgramMasterViewController: UITableViewController {

    var detailViewController: ProgramDetailViewController? = nil

    var programs = [
        ProgramFactory.Tabata,
        ProgramFactory.HIIT,
        ProgramFactory.Boxing
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        navigationItem.rightBarButtonItem = addButton
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            detailViewController =
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
        clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        debugPrint(">> insertNewObject:sender")
        //objects.insert(NSDate(), atIndex: 0)
        programs.insert(ProgramFactory.EmptyProgram, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
    }

    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        debugPrint(">> prepareForSeque:seque:sender")
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let program = programs[indexPath.row]
                
                let controller =
                    (segue.destinationViewController as! UINavigationController)
                        .topViewController as! ProgramDetailViewController
                
                controller.detailItem = StructContainer(contained: program)
                
                controller.navigationItem.leftBarButtonItem =
                    splitViewController?.displayModeButtonItem()
                
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint(">> tableView:tableView:numberOfRowsInSection")
        return programs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        debugPrint(">> tableView:tableView:cellForRowAtIndexPath")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blackColor()

        let program = programs[indexPath.row]
        
        cell.textLabel!.text = program.name
        cell.detailTextLabel!.text = program.description
        
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
            //objects.removeAtIndex(indexPath.row)
            programs.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        debugPrint("\(indexPath.row)")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        debugPrint(programs[indexPath.row])
    }

}

