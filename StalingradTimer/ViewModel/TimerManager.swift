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
    @Published var usersPrepareTime: Float = 10
    @Published var usersWorkTime: Float = 20
    @Published var usersRestTime: Float = 5
    @Published var usersRounds = 2
    @Published var usersCycles = 1
    
    @Published var currentTime: Float = 0 // seconds
    @Published var totalTime: Float = 0
    
    @Published var trainMode: TrainMode = .initial
    
    @Published var startButtonOn = true
    
        
    var prepareTime: Float = 0
    var workTime: Float = 0
    var restTime: Float = 0
    var rounds = 0
    var cycles = 0
    
    func getTrainModeName() -> String {
        var describtion: String = ""
        switch trainMode {
        case .initial : describtion = ""
        case .prepare : describtion = "Подготовка"
        case .work : describtion = "Тренировка"
        case .rest : describtion = "Отдых"
        case .cycleRest : describtion = "Восстановление"
            
        }
        return describtion
    }
//    case initialText = ""
//    case prepareText = "Подготовка"
//    case workText = "Тренировка"
//    case restText = "Отдых"
    
    func startTimer() {
        print(#function)
        
        if trainMode == .initial {
            setTimerValues()
            totalTime = (((usersWorkTime + usersRestTime) * Float(usersRounds)) * Float(usersCycles)) - restTime
            rounds = usersRounds
            cycles = usersCycles

            if usersWorkTime == 0 {
                return
                // сделать аллерт
            }
            if prepareTime > 0 {
                trainMode = .prepare
                currentTime = prepareTime
                totalTime += prepareTime
            } else {
                trainMode = .work
                currentTime = workTime
                
            }
        }

        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimerValue),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimerValue() {
//        print(#function)
        
        totalTime -= 1
        
        currentTime -= 1
        
        if currentTime < 0 && trainMode == .prepare {
            totalTime += 1
            trainMode = .work
            currentTime = workTime
        }
        if currentTime < 0 && trainMode == .work {
            if rounds == 1 && cycles > 0 {
                restTime = 0
                resetTimer()
            } else {
            totalTime += 1
            trainMode = .rest
            currentTime = restTime
            }
        }
            if currentTime < 0 && trainMode == .rest {
                rounds -= 1
                setTimerValues()
                totalTime += 1
                currentTime = workTime
                trainMode = .work
            }
        
        if rounds == 0 {
            cycles -= 1
            
        }
    
        if cycles == 0 {
            resetTimer()
        }
        print("currentTime: \(currentTime) trainMode: \(trainMode)")
    }
  
    func pauseTimer() {
        print(#function)
//        trainMode = .paused
        print("trainMome: \(trainMode)")
        timer?.invalidate()
    }
    
    func resetTimer() {
        print(#function)
        
        trainMode = .initial
        currentTime = 0
        
        timer?.invalidate()
        timer = nil
        
        startButtonOn = true
        
    }
  
    
    
    func trimController() {
        if trainMode == .work {
          currentTime += 1
            totalTime += 1
        }
     
    }
    
    private func setTimerValues() {
        prepareTime = usersPrepareTime
        workTime = usersWorkTime
        restTime = usersRestTime
        
        
    }
    
    private func prepare() {
        if prepareTime != 0 {
            trainMode = .prepare
            currentTime = prepareTime
            print("prepareTime: \(prepareTime)")
        }
    }
    
    private func work() {
        if currentTime < 0 {
            trainMode = .work
            currentTime = workTime
            print("workTime: \(workTime)")
        }
    }
    
    private  func rest() {
        if workTime < 0 {
            trainMode = .rest
            restTime -= 1
            print("restTime: \(restTime)")
        }
    }
    private func updateRound() {
        if workTime + restTime == 0 {
            rounds -= 1
            print("rounds: \(rounds)")
            workTime = usersWorkTime
            restTime = usersRestTime
        }
    }
    
    private func updateCycle() {
        if rounds == 0 && cycles > 0 {
            cycles -= 1
            rounds = usersRounds
            // добавить отдых между циклами
        }
    }
}



