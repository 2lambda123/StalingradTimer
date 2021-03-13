//
//  TimerManager.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import Foundation
import Combine

class TimerManager: ObservableObject {
    var timer = Timer()
    @Published var timeleft:Float = 20 // seconds
    @Published var trainMode: TrainMode = .initial
    
    func startTimer() {
        trainMode = .work
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            self.timeleft -= 0.1
            if self.timeleft <= 0 {
                timer.invalidate()
                
            }
        })
    }
    func pauseTimer() {
        trainMode = .paused
        timer.invalidate()
    }
    func resetTimer() {
        trainMode = .initial
        timeleft = 20
        timer.invalidate()
    }
    func plusTime() {
        timeleft += 1
    }
}
