//
//  TimerViewController.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/2/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit
import Timer

class TimerViewController: UIViewController {
    
    var program = TimerProgram(
        name: "Test Program",
        description: "Some test program",
        program: [
            WorkInterval(description: "work", seconds: 20),
            RestInterval(description: "rest", seconds: 10),
            WorkInterval(description: "work", seconds: 20),
            RestInterval(description: "rest", seconds: 10),
            WorkInterval(description: "work", seconds: 20),
            RestInterval(description: "rest", seconds: 10),
            WorkInterval(description: "work", seconds: 20),
            RestInterval(description: "rest", seconds: 10),
            WorkInterval(description: "work", seconds: 20),
            RestInterval(description: "rest", seconds: 10),
            WorkInterval(description: "work", seconds: 20),
            RestInterval(description: "rest", seconds: 10)
        ]
    )
    
    let ironColor = UIColor(
        red: 76/255.0,
        green: 76/255.0,
        blue: 76/255.0,
        alpha: 1.0
    )
    
    let tintColor = UIColor(
        red: 57/255.0,
        green: 255/255.0,
        blue: 20/255.0,
        alpha: 1.0
    )
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
   
    //var timerManager = TimerManager()
    
    var currentTimer: Timer<String,TimerEvent<GeneralInterval>>?
    
    // MARK:-
    // MARK: Overriden controller methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 5
        stopButton.layer.cornerRadius = 5
        resetButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK:-
    // MARK: View action handlers
    @IBAction func startButtonPressed(sender: UIButton) {
        UIView.animateWithDuration(0.15) {
            self.startButton.backgroundColor = UIColor.greenColor()
            self.startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.stopButton.backgroundColor = UIColor.redColor()
            self.stopButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
    }
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        UIView.animateWithDuration(0.15) {
            self.startButton.backgroundColor = self.ironColor
            self.startButton.setTitleColor(self.tintColor, forState: .Normal)
            self.stopButton.backgroundColor = self.ironColor
            self.stopButton.setTitleColor(self.tintColor, forState: .Normal)
        }
    }
    // MARK:-
    // MARK: Observer callback support
    private func notify<S: Event, I: Interval where S.IntervalType == I>(event: S) {
        
        let format = {(value: Int) in
            return value < 10
                ? String(format: "0%d", value)
                : String(format: "%d", value)
        }

        
        let intervals = event.intervalsElapsed
        let minutes = 0
        let seconds = Int(intervals) / 100
        let milliSeconds = Int(intervals) - seconds * 100
        let formattedMillis = format(milliSeconds)
        let formattedMinutes = format(minutes)
        let formattedSeconds = format(seconds)
        let time = " \(formattedMinutes):\(formattedSeconds) "
        let millisecondTime = " \(formattedMillis) "
        debugPrint(" \(time):\(millisecondTime) ")
//        timeLabel!.text = time
//        millisecondLabel.text = millisecondTime
//        if let myCurrentInterval = event.currentInterval {
//            messageLabel.text = myCurrentInterval.description
//        }
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
