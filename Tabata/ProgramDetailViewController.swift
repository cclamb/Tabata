//
//  DetailViewController.swift
//  mdtest
//
//  Created by Lamb, Christopher Charles on 3/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class ProgramDetailViewController: UIViewController,
    UIPickerViewDelegate,
    UIPickerViewDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var testPicker: UIPickerView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            let program = (detail as! StructContainer<GeneralProgram>).contained
            
            if let myLabel = nameLabel {
                myLabel.text = program.name
            }

            if let myLabel = descriptionLabel {
                myLabel.text = program.description
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
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int {
            if component == 0 {
                return 60
            } else {
                return 60
            }
    }
    
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString?{
            return NSAttributedString(
                string: String(row + 1),
                attributes: [
                    NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,
                    NSForegroundColorAttributeName:UIColor.whiteColor()
                ]
            )
    }

}

