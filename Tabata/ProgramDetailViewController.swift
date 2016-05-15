//
//  DetailViewController.swift
//  mdtest
//
//  Created by Lamb, Christopher Charles on 3/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit
import Timer
import Utilities

class ProgramDetailViewController: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var runButton: UIButton!
    
    @IBAction func runButtonPressed(sender: UIButton) {
        debugPrint("run button pressed...")
        if let detail = detailItem {
            program = (detail as! StructContainer<GeneralProgram>).contained
            DataManager.instance.selectedProgram = program
        }
        tabBarController?.selectedIndex = 0
    }
    
    var program: GeneralProgram? {
        didSet {
            if let myProgram = program {
                values[0] = Double(myProgram.program.count)
                
                if myProgram.program.count >= 3 {
                    values[1] = myProgram.program[0].interval / 100
                    values[2] = myProgram.program[1].interval / 100
                }
            }
        }
    }
    var values = [Double](count: 3, repeatedValue: 0)
    
    let fieldTitles = [
        "Rounds",
        "Work Set Duration",
        "Rest Set Duration"
    ]
    
    let suffix = [
        "rounds",
        "seconds",
        "seconds"
    ]
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            program = (detail as! StructContainer<GeneralProgram>).contained
            
            if let myLabel = nameLabel {
                myLabel.text = program!.name
            }

            if let myLabel = descriptionLabel {
                myLabel.text = program!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController!.navigationBar.barStyle = .BlackTranslucent
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:-
    // MARK: Table Data Source Methods
    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
        ) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (cell == nil) {
                cell = UITableViewCell(
                    style: UITableViewCellStyle.Value1,
                    reuseIdentifier: "cell")
            }
            
            let idx = indexPath.row
            cell?.textLabel?.text = "\(     fieldTitles[idx])"
            cell?.detailTextLabel?.text = "\(Int(values[idx])) \(suffix[idx])"
            
            
            cell?.backgroundColor = UIColor.blackColor()
            cell?.textLabel?.textColor = UIColor.whiteColor()
            cell?.detailTextLabel?.textColor = UIColor.grayColor()
            cell?.detailTextLabel?.font = UIFont.systemFontOfSize(11)
            
            return cell!
    }

    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int
        ) -> Int {
            return 3
    }
    
    @IBAction func cancelToProgramDetailViewController(segue:UIStoryboardSegue) {
        debugPrint("Cancel...")
    }
    
    @IBAction func saveProgramDetail(segue:UIStoryboardSegue) {
        debugPrint("save...")
    }

}

