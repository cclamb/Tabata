//
//  TimerViewController.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/2/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timerManager = TimerManager()
    
    var currentTimer: Timer<String,TimerEvent>?

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        debugPrint("stopButtonPressed:sender")
        if let myCurrentTimer = currentTimer {
            myCurrentTimer.stop()
        }
    }
    
    @IBAction func startButtonPressed(sender: UIButton) {
        debugPrint("startButtonPressed:sender")
        currentTimer = timerManager.createTimer(1.0)
        currentTimer!.start()
        currentTimer!.addObserver("vc_1", observer: self.notify)
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
    
    private func notify(event: TimerEvent) {
        debugPrint(event)
        timeLabel!.text = String(event.secondsElapsed)
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
