//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
    
    @ObservedObject private var timerManager = TimerManager()
    
    @State private var showSettings = false
    @State private var showTimerSettings = false
    
    private let bigLogo = "StalingradLogo"
    @State private var bigLogoAnimate = true
    @State private var totalOpacityAn: Double = 0
    
    var body: some View {
        
        NavigationView {
        ZStack {
            VStack {
                //MARK: - "NavigationBar"
//                VStack {
                    HStack {
                        //MARK: - Settings Button
                        SettingsButton(timerManager: timerManager)
//                        Button(action: {showSettings.toggle()}) {
//                            Image(systemName: "gearshape")
//                                .font(.system(size: 35, weight: .light))
//                                .foregroundColor(.black)
//                                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
//                                .animation(.default)
//
//                        }
//                        .disabled(timerManager.trainMode != .initial)
//                        .sheet(isPresented: $showSettings) {
//                            SettingsScreen()
//                        }
                        
                        Spacer()
                        
                        Button(action: {showTimerSettings.toggle()}) {
                            Image(systemName: "stopwatch")
                                .font(.system(size: 35, weight: .light))
                                .foregroundColor(.black)
                                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
//                                .rotationEffect(.init(degrees: showSettings ? 0 : 90))
                                .animation(.default)
                        }
                        .disabled(timerManager.trainMode != .initial)
                        .sheet(isPresented: $showTimerSettings) {
                            TimerSettingsScreen()
                        }
                    }
//                }
                // MARK: - Time + trainig mode
                ZStack {
                    
                    CircleProgressBar(trimTo: CGFloat(timerManager.circleProgressBarController()))
//                        .animation(.easeOut(duration: 0.5))
                    
                    if timerManager.trainMode != .initial {
                        TimerValueText(
                            timerText: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
                            trainName: timerManager.getTrainModeName()
                        )
                        .animation(.default)
                        .onTapGesture {
                            timerManager.addTime()
                        }
                    }
                    // MARK: - Stalingrad Logo
                    
                    if timerManager.trainMode == .initial {
                            StalingradLogo()
//                            .scaleEffect(bigLogoAnimate ? 1 : 0.8)
//                            .opacity(bigLogoAnimate ? 1 : 0.1)
//                            .animation(.default)
                    }
                }
                
                Spacer()
                    .frame(height: 16)
                
                //MARK: - Rounds and cycles
                timerManager.trainMode != .initial ?
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
                    : nil

                //TODO: - add color with 2 schemes (for light and dark mode)
                
                Spacer()
                
                //MARK: - Start button
//                 TODO: - сделать кнопку ccaletofit, что добавить padding  к totaltime
                    timerManager.startButtonOn ? StartPauseButton(action: {
                                                                    timerManager.startTimer();
                                                                    timerManager.startButtonOn = false;
                                                                     bigLogoAnimate = false },
                                                                  buttonText: "СТАРТ") :
                                                StartPauseButton(action: {
                                                                    timerManager.pauseTimer();
                                                                    timerManager.startButtonOn = true },
                                                                 buttonText: "ПАУЗА")
            }
            
            //MARK: - Reset button
            VStack {
                Spacer()
                
                HStack {
                    ResetButton(action:  {
                                    timerManager.resetTimer();
                                    withAnimation(.default) { bigLogoAnimate = true } },
                                buttonColor: .red,
                                imageName: "gobackward")
                        .disabled(timerManager.trainMode == .initial)
                        .opacity(timerManager.trainMode == .initial ? 0.5 : 1)
                        .animation(.default)
                    Spacer()
                }
            }
        }
        .onAppear() {
            
        }//Main ZStack
        .padding()
//        .padding(.bottom)
//        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        }
        
        
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
            TimerScreen()
    }
}

struct StalingradLogo: View {
    @ObservedObject var timerManager = TimerManager()
//    @Binding var bigLogoAnimate: Bool
    
    var body: some View {
        Image("StalingradLogo")
//        Image(systemName: "questionmark.circle")
            .resizable()
            .scaledToFill()
            .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
            .offset(y: 40)
//            .scaleEffect(bigLogoAnimate ? 1 : 0.8)
//            .opacity(bigLogoAnimate ? 1 : 0.1)
//            .animation(.default)
            .padding()
        
//            .onAppear() {
//                bigLogoAnimate = true
//            }
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
                    .fontWeight(.ultraLight)
                    .frame(maxWidth: .infinity)
                Text("ОСТАЛОСЬ")
                    .font(.custom("HelveticaNeue-Thin", size: 16))
                    .fontWeight(.ultraLight)
                    .frame(maxWidth: .infinity)
                Text(timerManager.usersCycles == 0 ? "" : "ЦИКЛЫ")
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
    var buttonOpacity: Double = 0.5
    @ObservedObject var timerManager: TimerManager
    var body: some View {
        NavigationLink(destination: SettingsScreen()) {
            Image(systemName: "gearshape")
                .font(.system(size: 35, weight: .light))
                .foregroundColor(.black)
                .opacity(timerManager.trainMode != .initial ? buttonOpacity : 1)
                .animation(.default, value: buttonOpacity)
        }
    }
}
