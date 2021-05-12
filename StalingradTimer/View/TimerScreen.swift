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
 - доработать страницу Настройки
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
 - сделать выбор времени через .sheet
 
 _________________________________________________________________________
 - уменьшить иконки
 */

import SwiftUI

struct TimerScreen: View {
    
    @EnvironmentObject private var timerManager: TimerManager
    

    
    private let bigLogo = "StalingradLogo"
    @State private var bigLogoAnimate = true
    @State private var totalOpacityAn: Double = 0
    
    var body: some View {
        
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
                        TimerValueText( timerValue: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
                                        trainMode: timerManager.getTrainModeName()
                        )
                        .onTapGesture {
                            timerManager.addTime()
                        }
                    }
                    // MARK: - Stalingrad Logo
                    
                    if timerManager.trainMode == .initial {
                        StalingradLogo()
                            .animation(nil)
                            .scaleEffect(bigLogoAnimate ? 1 : 0.8)
                            .opacity(bigLogoAnimate ? 1 : 0.8)
                            .animation(.default, value: bigLogoAnimate)
                            .onAppear() {
                                withAnimation(.default) {
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
                    ResetButton(action:  { timerManager.resetTimer(); withAnimation(.default) { bigLogoAnimate = true } })
                        .disabled(timerManager.trainMode == .initial)
                        .opacity(timerManager.trainMode == .initial ? 0.3 : 1)
                        .animation(.default)
//                        .animation(.easeInOut(duration: 0))
                    Spacer()
                }
            }
        } //Main ZStack
        .padding()
        .navigationBarHidden(true)
        }
         // NavigationView
        
        
        
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
            TimerScreen()
                .environmentObject(TimerManager())
    }
}

struct StalingradLogo: View {
    @ObservedObject var timerManager = TimerManager()
//    @Binding var bigLogoAnimate: Bool
    
    var body: some View {
        Image("StalingradLogo")
            .resizable()
            .scaledToFill()
            .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
            .offset(y: 40)
            .padding()
    }
}

struct RoundsTotaltimeCycles: View {
    @ObservedObject var timerManager: TimerManager
    var body: some View {
        VStack {
            HStack {
                // Rounds
                VStack {
                    // userRounds - ruonds. if == 0 {"1"}
                    Text("\(timerManager.usersRounds - timerManager.rounds + 1)")
                        .font(.custom("HelveticaNeue-Thin", size: 38))
                        //                            .fontWeight(.regular)
                        +
                        Text("/\(timerManager.usersRounds)")
                        .font(.custom("HelveticaNeue-Thin", size: 28))
                        .fontWeight(.ultraLight)
                }
                .frame(maxWidth: .infinity)
                
                // Total time
                VStack {
                    Text("\(secondsToMinutesAndSeconds(seconds: timerManager.totalTime) )")
                        .font(.custom("HelveticaNeue-Thin", size: 38))
                        .minimumScaleFactor(0.5)
                        .scaledToFit()
//                        .animation(.none)
                        
                    
                }
                .frame(maxWidth: .infinity)
                
                // Cycles
                VStack {
                    Text(timerManager.usersCycles == 1 ? "" : "\(timerManager.usersCycles - timerManager.cycles + 1)")
                        .font(.custom("HelveticaNeue-Thin", size: 38))
                        //                            .fontWeight(.regular)
                        +
                        Text(timerManager.usersCycles == 0 ? "" : "/\(timerManager.usersCycles)")
                        
                        .font(.custom("HelveticaNeue-Thin", size: 28))
                        .fontWeight(.ultraLight)
                }
                .frame(maxWidth: .infinity)
            }

            
            .foregroundColor(.black)
//            .background(Color.white)
            
            HStack {
                Text("РАУНДЫ")
                    .font(.custom("HelveticaNeue-Thin", size: 16))
                    .italic()
                    .fontWeight(.ultraLight)
                    .frame(maxWidth: .infinity)
                Text("ОСТАЛОСЬ")
                    .italic()
                    .font(.custom("HelveticaNeue-Thin", size: 16))
                    .fontWeight(.ultraLight)
                    .frame(maxWidth: .infinity)
                Text(timerManager.usersCycles == 0 ? "" : "ЦИКЛЫ")
                    .italic()
                    .font(.custom("HelveticaNeue-Thin", size: 16))
                    .fontWeight(.ultraLight)
                    .frame(maxWidth: .infinity)
            }
        }
//                    .opacity(timerManager.trainMode != .initial ? 1 : 0)
//                    .animation(.easeIn(duration: 0.5))
        .transition(.scale)
    }
}

struct SettingsButton: View {
    @ObservedObject var timerManager: TimerManager
    var body: some View {
        NavigationLink(destination: SettingsScreen()) {
            Image(systemName: "gearshape")
                .font(.system(size: 35, weight: .light))
                .foregroundColor(.black)
                .animation(nil)
                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
                .animation(.default)
        }
    }
}

struct TimerSettingsButton: View {
    @ObservedObject var timerManager: TimerManager
    var body: some View {
        NavigationLink(destination: TimerSettingsScreen()) {
            Image(systemName: "stopwatch")
                .font(.system(size: 35, weight: .light))
                .foregroundColor(.black)
                .animation(nil)
                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
                .animation(.default)
        }
    }
}
