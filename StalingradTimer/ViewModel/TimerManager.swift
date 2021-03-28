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
   // totalTime = ((prepareTime + workTime + restTime) * rounds) * cycles
    var prepareTime: Float = 0
    var workTime: Float
    var restTime: Float = 0
    var rounds = 1
    var cycles = 1
    
    @Published var currentTime: Float = 0 // seconds
    
    @Published var trainMode: TrainMode = .initial
    @Published var trainModeDescribtion: TrainModeDescribtion = .initialText
    
    internal init(workTime: Float) {
        self.workTime = workTime
    }
    
    func startTimer() {
        print(#function)
        if trainMode == .initial {
            currentTime = workTime
        }
        trainMode = .work
        print("trainMome: \(trainMode)")
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.currentTime -= 1
            if self.currentTime < 0 {
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
        currentTime = 0
        timer?.invalidate()
        timer = nil
    }
    
    func plusTime() {
        print(#function)
        currentTime += 1
    }
    
    func round() {
        if rounds != 0 {
            if prepareTime != 0 {
                trainModeDescribtion = .prepareText
                currentTime = prepareTime
            }
            if prepareTime == 0 {
                trainModeDescribtion = .workText
                currentTime = workTime
            }
            if workTime == 0 {
                trainModeDescribtion = .restText
                currentTime = restTime
                if currentTime == 0 {
                    rounds -= 1
                }
            }
        } else {
            resetTimer()
        }
    }
    
}

