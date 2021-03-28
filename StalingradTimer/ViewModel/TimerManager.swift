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
        print(#function)
        timeleft = workTime
        trainMode = .work
        print("trainMome: \(trainMode)")
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.timeleft -= 1
            if self.timeleft < 0 {
//                self.trainMode = .initial
                self.resetTimer()
            }
        })
    }
    
    func pauseTimer() {
        print(#function)
        trainMode = .paused
        print("trainMome: \(trainMode)")
        timer?.invalidate()
    }
   
    func resetTimer() {
        print(#function)
        trainMode = .initial
        print("trainMome: \(trainMode)")
        timeleft = 0
        timer?.invalidate()
        timer = nil
    }
    
    func plusTime() {
        print(#function)
        timeleft += 1
    }
    
    func trimToStart() {
        trimTo = (userTimeSet - timeleft) / userTimeSet
        
    }
}
