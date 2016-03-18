//
//  DetailViewController.swift
//  mdtest
//
//  Created by Lamb, Christopher Charles on 3/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class ProgramDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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

}

