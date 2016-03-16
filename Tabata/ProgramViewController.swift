//
//  ProgramViewController.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/2/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var tableView: UITableView = UITableView()
    let animals = ["Dogs","Cats","Mice"]
    let messages = [
        "Will slobber on you",
        "Will sleep on you",
        "Will provide food for cat"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        
        tableView.backgroundColor = UIColor.blackColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(self.tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
        
    }
    
    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
        ) -> UITableViewCell {
            
            let cell:UITableViewCell = UITableViewCell(
                style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: "cell"
            )
            
            cell.backgroundColor = UIColor.blackColor()
            cell.layer.borderColor = UIColor.grayColor().CGColor
            cell.accessoryType = .DetailDisclosureButton
            
            cell.textLabel!.text = animals[indexPath.row]
            cell.detailTextLabel!.text = messages[indexPath.row]
            cell.textLabel!.textColor = UIColor.whiteColor()
            cell.detailTextLabel!.textColor = UIColor.grayColor()
            
            return cell;
    }
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        debugPrint("...accessory button pressed...")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(animals[indexPath.row])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
