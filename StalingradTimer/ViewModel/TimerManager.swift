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
    @Published var timeleft = 675 // seconds
    @Published var trainMode: TrainMode = .initial
    
    func startTimer() {
        trainMode = .work
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.timeleft -= 1
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
        timeleft = 3614
        timer.invalidate()
    }
    func plusTime() {
        timeleft += 1
    }
}
