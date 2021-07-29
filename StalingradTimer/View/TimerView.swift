//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//


//MARK: - TODO
/*
 _________________________________________________________________________
 - Добавить Алерт в ресет баттн
 _________________________________________________________________________
 {
 -добавить Link с переходом на сайт
 -добавить Link с переходом в инстаграм
 -добавить кнопку поделиться
 -добавить номер телефона
 }
 _________________________________________________________________________
 - добавить настройку таймера в Настройках
 {
 -функция прибавления времени
 -выбор шага прибавления времени
 -выбор звуковых сигналов
 }
 ___
 ______________________________________________________________________
 - Звуковые сигналы
 {
 -осталось 10 секунд
 -3 секунды до начала раунда
 -выбор отдельных звуков под каждый trainMode
 -
 }
 
 _________________________________________________________________________
 - доработать страницу Настройки
 
 _________________________________________________________________________
 - Back button в настройках и настрйке таймера
 
 _________________________________________________________________________
 
 _________________________________________________________________________
 */

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject private var timerManager: TimerManager
    
    private let bigLogo = "StalingradLogo"
    
    @State private var bigLogoAnimate = true
    @State private var totalOpacityAn: Double = 0
    
//    @State private var showAddingTimeMenu = false
    
    var body: some View {
        ZStack {
        NavigationView {
            
        ZStack {
            VStack {
                //MARK: - "NavigationBar"
                    HStack {
                        //MARK: - Settings Button
                        SettingsButton(timerManager: timerManager)
                            .disabled(timerManager.trainMode != .initial)
                        
                        Spacer()
                        
                        //MARK: - Timer settings Button
                        TimerSettingsButton(timerManager: timerManager)
                            .disabled(timerManager.trainMode != .initial)
                    }
                // MARK: - Time + trainig mode
                ZStack {
                    
                    CircleProgressBar(trimTo: CGFloat(timerManager.circleProgressBarController()))
                    
                    if timerManager.trainMode != .initial {
                        TimerValueText(timerValue: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
                                       trainMode: timerManager.getTrainModeName()
                        )
                        .onTapGesture {
                            if timerManager.trainMode == .work {
                                timerManager.showTimeChangerMenu.toggle()
                            }
                            
                        }
                        // MARK: - TimeChangerMenu
                        if timerManager.showTimeChangerMenu && timerManager.trainMode == .work {
                            TimeChangerMenu()
                        }
                       
                    }
                    // MARK: - Stalingrad Logo
                    
                    if timerManager.trainMode == .initial {
                        StalingradLogo()
                            .animation(nil)
                            .scaleEffect(bigLogoAnimate ? 1 : 0.8)
                            //                            .opacity(bigLogoAnimate ? 1 : 0.8)
                            .animation(.easeOut(duration: 0.5), value: bigLogoAnimate)
                            .onAppear() {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    bigLogoAnimate = true
                                }
                            }
                    }
                }
                
                Spacer()
                    .frame(height: 16)
                
                //MARK: - Rounds and cycles
                timerManager.trainMode != .initial
                    ?
                    RoundsTotaltimeCycles(timerManager: timerManager)
                    .opacity(totalOpacityAn)
                    .onAppear() {
                        withAnimation(.default) {
                            totalOpacityAn = 1
                        }
                    }
                    .onDisappear() {
                            totalOpacityAn = 0
                    }
                    .offset(y: 10.0)
                    :
                    nil
                    

                //TODO: - add color with 2 schemes (for light and dark mode)
                
                Spacer()
                
                //MARK: - Start button
                    timerManager.startButtonOn ? StartPauseButton(action: { timerManager.startTimer(); timerManager.startButtonOn = false; bigLogoAnimate = false },
                                                                  buttonText: "СТАРТ") :
                        StartPauseButton(action: { timerManager.pauseTimer(); timerManager.startButtonOn = true},
                                                                 buttonText: "ПАУЗА")
            }
            
            //MARK: - Reset button
            VStack {
                Spacer()
                HStack {
                    ResetButton(action:  { timerManager.resetTimer(); timerManager.showTimeChangerMenu = false })
                        .disabled(timerManager.trainMode == .initial)
                        .opacity(timerManager.trainMode == .initial ? 0.3 : 1)
                        .animation(.easeOut(duration: 0.5))
//                        .animation(.easeInOut(duration: 0))
                    Spacer()
                }
            }
//            if timerManager.showTimeChangePicker {
//                TimePickerForm(seconds: Float(timerManager.timeChangeMenuStep), minuteSelection: 0, secondSelection: (Int(timerManager.timeChangeMenuStep) % 3600) % 60, timePickerText: "Выберите шаг")
//                    .edgesIgnoringSafeArea(.all)
//            }
        } // ZStack
        .padding()
        .navigationBarHidden(true)
        } // NavigationView
            if timerManager.showTimeChangePicker {
                TimePickerForm(seconds: Float(timerManager.timeChangeMenuStep), minuteSelection: 0, secondSelection: (Int(timerManager.timeChangeMenuStep) % 3600) % 60, timePickerText: "Выберите шаг")
                    .edgesIgnoringSafeArea(.all)
            }
        }// main ZStack
        
        .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
        .onDisappear { UIApplication.shared.isIdleTimerDisabled = false }
         // NavigationView
        
        
        
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
            TimerView()
                .environmentObject(TimerManager())
    }
}





