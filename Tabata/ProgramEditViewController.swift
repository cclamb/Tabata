//
//  ProgramEditViewController.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 5/7/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class ProgramEditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let source = ["1", "2", "3", "4", "5", "\u{221e}"]
    let source1 = ["6", "7", "8"]
    let source2 = ["9", "10", "11"]

    @IBOutlet weak var roundsPicker: UIPickerView!
    @IBOutlet weak var workSetPicker: UIPickerView!
    @IBOutlet weak var restSetPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roundsPicker?.dataSource = self
        roundsPicker?.delegate = self
        restSetPicker?.dataSource = self
        restSetPicker?.delegate = self
        workSetPicker?.dataSource = self
        workSetPicker?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return source.count
        case 1: return source1.count
        case 2: return source2.count
        default: return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return source[row]
        case 1: return source1[row]
        case 2: return source2[row]
        default: return ""
        }
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
