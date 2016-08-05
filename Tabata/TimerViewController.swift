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
    
    let AnimationDuration = 0.15
    
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
    @IBOutlet weak var timeLabel: UILabel!
    //@IBOutlet weak var millisecondLabel: UILabel!
    @IBOutlet weak var programNameLabel: UILabel!
    @IBOutlet weak var intervalNameLabel: UILabel!
   
    let timerManager = SimpleTimerManager()
    
    var currentTimer: SimpleTimer?
    var isRunning = false
    
    // MARK:-
    // MARK: Overriden controller methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 5
        stopButton.layer.cornerRadius = 5
        resetButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(animated: Bool) {
        if let myProgram = DataManager.instance.selectedProgram {
            program = myProgram
        }
        let startingInterval = program.program[0].interval
        updateLabels(program)
        updateTimeLabels(startingInterval)
    }
    
    private func updateLabels(program: TimerProgram<GeneralInterval>) {
        programNameLabel.text = program.name
        intervalNameLabel.text = program.program[0].description
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
        if isRunning == false {
            programNameLabel.text = program.name
            UIView.animateWithDuration(AnimationDuration) {
                self.startButton.backgroundColor = UIColor.greenColor()
                self.startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.stopButton.backgroundColor = UIColor.redColor()
                self.stopButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.resetButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.resetButton.backgroundColor = UIColor.blueColor()
            }
            if let myTimer = currentTimer {
                myTimer.stop()
            } else {
                currentTimer = timerManager.createTimer(program)
                currentTimer?.addObserver("currentTimer", observer: self.notify)
            }
            currentTimer!.start()
            isRunning = true
        }
    }
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        if isRunning == true {
            UIView.animateWithDuration(AnimationDuration) {
                self.startButton.backgroundColor = self.ironColor
                self.startButton.setTitleColor(self.tintColor, forState: .Normal)
                self.stopButton.backgroundColor = self.ironColor
                self.stopButton.setTitleColor(self.tintColor, forState: .Normal)
            }
            currentTimer?.stop()
            isRunning = false
        }
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        UIView.animateWithDuration(AnimationDuration) {
            self.startButton.backgroundColor = self.ironColor
            self.startButton.setTitleColor(self.tintColor, forState: .Normal)
            self.stopButton.backgroundColor = self.ironColor
            self.stopButton.setTitleColor(self.tintColor, forState: .Normal)
            self.resetButton.setTitleColor(self.tintColor, forState: .Normal)
            self.resetButton.backgroundColor = self.ironColor
        }
        currentTimer!.stop()
        currentTimer = timerManager.createTimer(program)
        currentTimer?.addObserver("currentTimer", observer: self.notify)
        updateTimeLabels(program.program[0].interval)
        intervalNameLabel.text = program.program[0].description
        isRunning = false
    }
    
    // MARK:-
    // MARK: Observer callback support
    private func notify<S: Event, I: Interval where S.IntervalType == I>(event: S) {

        intervalNameLabel.text = event.program.program[event.programIndex].description
        updateTimeLabels(event.intervalsRemaining)
        
//        if let myCurrentInterval = event.currentInterval {
//            messageLabel.text = myCurrentInterval.description
//        }
    }
    
    private func updateTimeLabels(interval: NSTimeInterval) {
        
        let format = {(value: Int) in
            return value < 10
                ? String(format: "0%d", value)
                : String(format: "%d", value)
        }
        
        let intervals = interval
        let rawSeconds = Int(intervals) / 100
        let minutes = rawSeconds / 60
        let seconds = rawSeconds - minutes * 60
        //let milliSeconds = Int(intervals) - rawSeconds * 100
        //let formattedMillis = format(milliSeconds)
        let formattedMinutes = format(minutes)
        let formattedSeconds = format(seconds)
        let time = "\(formattedMinutes):\(formattedSeconds)"
        //let millisecondTime = "\(formattedMillis)"
        //debugPrint(" \(time):\(millisecondTime) ")
        debugPrint("\(interval)")
        timeLabel!.text = time
        //millisecondLabel.text = millisecondTime
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
