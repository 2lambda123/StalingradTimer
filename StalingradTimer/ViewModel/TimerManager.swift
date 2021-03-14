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
    @Published var userTimeSet: Float = 20
    @Published var trimTo: Float = 1
    
    func startTimer() {
        print("end timer")
        trainMode = .work
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.timeleft -= 1
            if self.timeleft < 0 {
                self.trainMode = .initial
                timer.invalidate()
                self.resetTimer()
            }
            
        })
    }
    func pauseTimer() {
        print("pause timer")
        trainMode = .paused
        timer.invalidate()
    }
    func resetTimer() {
        print("reset timer")
        trainMode = .initial
        timeleft = 20
        timer.invalidate()
    }
    
    func plusTime() {
        print("plus timer")
        timeleft += 1
    }
    
    func trimToStart() {
        trimTo = (userTimeSet - timeleft) / userTimeSet
        
    }
}
