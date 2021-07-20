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
    @Published var usersPrepareTime: Float = 1
    @Published var usersWorkTime: Float = 10
    @Published var usersRestTime: Float = 3
    @Published var usersRounds = 2
    @Published var usersCycles = 2
    @Published var usersCyclesRest: Float = 20
    
    @Published var showTimePicker = false
    @Published var showValuePicker = false
    
    @Published var showSettingsScreen = false
    
    @Published var showTimeChangerMenu = false
    @Published var showTimeChangePicker = false
    @Published var timeChangeMenuStep: Float = 1
    
    @Published var currentTime: Float = 0 // seconds
    @Published var totalTime: Float = 0
    
    @Published var trainMode: TrainMode = .initial
    
    @Published var settingsMode: SettingsMode = .prepare
    
    
    @Published var startButtonOn = true
    
        
    var prepareTime: Float = 0
    var workTime: Float = 0
    var restTime: Float = 0
    var rounds = 0
    var cycles = 0
    
  

    
    func startTimer() {
        print(#function)
       
        if trainMode == .initial {
            setTimerValues()
            totalTime = (((usersWorkTime + usersRestTime) * Float(usersRounds)) * Float(usersCycles)) - restTime
//            totalTime = (((workTime) * Float(rounds)) * Float(cycles))

//            totalTime = 86400 - maximum (24 h)
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
//        if currentTime == 0 && cycles == 0 {
//            resetTimer()
//        }
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
        
        //prepare
        if currentTime < 0 && trainMode == .prepare {
            totalTime += 1
            trainMode = .work
            currentTime = workTime
        }
        
        //work
        if currentTime < 0 && trainMode == .work {
            
            if rounds == 1 && cycles == 1 {
                rounds -= 1
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
            setTimerValues()
            rounds = usersRounds
        }
    
        if cycles == 0 {
            resetTimer()
        }
        print("currentTime: \(currentTime) trainMode: \(trainMode)  rounds left: \(rounds) cycles left: \(cycles)")
//        print("rounds left: \(rounds) cycles left: \(cycles)")
    }
  
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
    
    func pauseTimer() {
        print(#function)
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
  //MARK: - addTime
    func addTime() {
        if trainMode == .work && currentTime < workTime {
            if timeChangeMenuStep + currentTime > workTime {
                totalTime += (workTime - currentTime)
                currentTime = workTime
            } else {
                currentTime += timeChangeMenuStep
                totalTime += timeChangeMenuStep
                
            }
        }
    }
    //MARK: - subtractTime
    func subtractTime() {
        if trainMode == .work && currentTime <= workTime && currentTime > 0 {
            if currentTime - timeChangeMenuStep < 0 {
                totalTime -= currentTime
                currentTime = 0
            } else {
          currentTime -= timeChangeMenuStep
            totalTime -= timeChangeMenuStep
            }
        }
    }
    
    func circleProgressBarController() -> Float {
        var progressValue: Float = 0
//        CircleProgressBar(trimTo: (10 - CGFloat(timerManager.currentTime)) / 10)
        switch trainMode {
        case .initial : progressValue = 1
        case .prepare : progressValue = (usersPrepareTime - currentTime) / usersPrepareTime
        case .work : progressValue = (usersWorkTime - currentTime) / usersWorkTime
        case .rest : progressValue = (usersRestTime - currentTime) / usersRestTime
        case .cycleRest : progressValue = 0
        }

        return progressValue
    }
    
    private func setTimerValues() {
//        print("rounds left: \(rounds)")
//        print("cycles left: \(cycles)")
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



