//
//  TimerViewController.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/2/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var program = TimerProgram(
        name: "Test Program",
        description: "Some test program", 
        program: [
        WorkInterval(interval: 20 * 100, description: "work"),
        RestInterval(interval: 10 * 100, description: "rest"),
        WorkInterval(interval: 20 * 100, description: "work"),
        RestInterval(interval: 10 * 100, description: "rest"),
        WorkInterval(interval: 20 * 100, description: "work"),
        RestInterval(interval: 10 * 100, description: "rest"),
        WorkInterval(interval: 20 * 100, description: "work"),
        RestInterval(interval: 10 * 100, description: "rest"),
        WorkInterval(interval: 20 * 100, description: "work"),
        RestInterval(interval: 10 * 100, description: "rest"),
        WorkInterval(interval: 20 * 100, description: "work"),
        RestInterval(interval: 10 * 100, description: "rest"),
    ])
    
   
    var timerManager = TimerManager()
    
    var currentTimer: Timer<String,TimerEvent<GeneralInterval>,GeneralInterval>?
    
//    @IBOutlet weak var millisecondLabel: UILabel!
//    
//    @IBOutlet weak var nameLabel: UILabel!
//    
//    @IBOutlet weak var timeLabel: UILabel!
//    
//    @IBOutlet weak var stopButton: UIButton!
//    
//    @IBOutlet weak var startButton: UIButton!
//    
//    @IBOutlet weak var restartButton: UIButton!
//    
//    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        debugPrint("stopButtonPressed:sender")
        if let myCurrentTimer = currentTimer {
            myCurrentTimer.stop()
        }
    }
    
    @IBAction func startButtonPressed(sender: UIButton) {
        debugPrint("startButtonPressed:sender")
//        if let myCurrentTimer = currentTimer {
//            timerManager.deleteTimer(myCurrentTimer)
//        }
//        nameLabel.text = program.name
//        currentTimer = timerManager.createTimer(program)
//        currentTimer!.start()
//        currentTimer!.addObserver("vc_1", observer: self.notify)
    }
    
    @IBAction func restartButtonPressed(sender: UIButton) {
        debugPrint("restartButtonPressed:sender")
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        debugPrint("resetButtonPressed:sender")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
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
