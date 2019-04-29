//
//  ViewController.swift
//  French Pressed
//
//  Created by Jason Holt on 4/29/19.
//  Copyright © 2019 Jason Holt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var timer : Timer?
    private var time = 180
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Sets timer instance and starts the timer
    func startTimer()
    {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
            // Updates the time variable
            updateTime(t: -1)
        }
    }
    
    // Stops the timer
    func stopTimer()
    {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }

    // Button calls the startTimer() function
    @IBAction func startTimerButton(_ sender: Any) {
        startTimer()
    }
    
    // if the time is not equal to zero, you can add ten seconds to the clock
    @IBAction func addTenSecondsTimer(_ sender: Any) {
        if time > 0
        {
            updateTime(t: 10)
        }
    }
    
    // if the time is not equal to zero, you can remove one second from the clock
    @IBAction func removeOneSecondTimer(_ sender: Any) {
        if time > 0
        {
            updateTime(t: -1)
        }
    }
    
    // Pauses the timer without reseting the clock
    @IBAction func pauseTimerButton(_ sender: Any) {
        stopTimer()
    }
    
    // Stops the timer and resets the clock
    @IBAction func stopTimerButton(_ sender: Any) {
        stopTimer()
        resetTimer()
    }
    
    // Processes the timer
    @objc func processTimer() {
        
        if time > 0
        {
            updateTime(t: -1)
        } else {
            stopTimer()
            time = 0
            updateDisplay(l: String(time))
        }
    }
    
    // Updates the time variable
    func updateTime(t: Int)
    {
        time += t
        updateDisplay(l: String(time))
    }
    
    // Resets the time variable and display
    func resetTimer() {
        time = 180
        updateDisplay(l: String(time))
    }
    
    // updates the time label in the UI
    func updateDisplay(l: String) {
        timerLabel.text = l
    }
}

