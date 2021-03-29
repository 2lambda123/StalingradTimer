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
    @Published var prepareTime: Float = 0
    @Published var workTime: Float
    @Published var restTime: Float = 0
    @Published var rounds = 1
    @Published var cycles = 1
    
    @Published var currentTime: Float = 0 // seconds
    
    @Published var trainMode: TrainMode = .initial
    @Published var trainModeDescribtion: TrainModeDescribtion = .initialText
    
//    @Published var animateLogo = false
    
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
        trainModeDescribtion = .pausedText
        print("trainMome: \(trainMode)")
        timer?.invalidate()
    }
    
    func resetTimer() {
        print(#function)
        
        trainMode = .initial
        trainModeDescribtion = .initialText
        print("trainMome: \(trainMode)")
        
        currentTime = 0
        
        timer?.invalidate()
        timer = nil
        
//        animateLogo.toggle()
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
                
            }
        } else {
            resetTimer()
        }
    }
    
}

