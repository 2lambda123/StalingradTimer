//
//  TimerManager.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import Foundation
import Combine


class TimerManager: ObservableObject {
    
    var timer: Timer?
    var workTime:Float
    @Published var timeleft:Float = 0 // seconds
    @Published var trainMode: TrainMode = .initial
    @Published var userTimeSet: Float = 20
    @Published var trimTo: Float = 1
    
    internal init(workTime: Float) {
        self.workTime = workTime
    }
    
    func startTimer() {
        print("start timer")
        timeleft = workTime
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
        timer?.invalidate()
    }
    func resetTimer() {
        print("reset timer")
        trainMode = .initial
        timeleft = 20
        timer?.invalidate()
        timer = nil
    }
    
    func plusTime() {
        print("plus timer")
        timeleft += 1
    }
    
    func trimToStart() {
        trimTo = (userTimeSet - timeleft) / userTimeSet
        
    }
}
