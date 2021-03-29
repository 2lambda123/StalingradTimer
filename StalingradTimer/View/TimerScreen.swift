//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
    
    @ObservedObject private var timerManager = TimerManager(workTime: 20)
    @State private var animateLogo = false
    @State private var logoScaleEffect: CGFloat = 1
    var body: some View {
        
        ZStack {
            VStack {
                //MARK: - "NavigationBar"
                VStack {
                    HStack {
                        Image(systemName: "gearshape")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "stopwatch")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
                            .shadowForView()
                    }
                }
                // MARK: - Time + trainig mode
                ZStack {
                    CircleProgressBar(trimTo: (20 - CGFloat(timerManager.currentTime)) / 20)
                    if timerManager.trainMode != .initial {
                        TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
                                       trainName: "Тренеровка")
                            //TODO: - if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                            .onTapGesture {
                                timerManager.currentTime += 1
                            }
                    }
                    if timerManager.trainMode == .initial {
                        Image("StalingradLogo")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
                            .offset(y: 40)
                            .padding()
                            
                            .scaleEffect(animateLogo ? 1 : 0)
                            .animation(.default, value: animateLogo)
                            .onAppear() {
                                animateLogo = true
                            }
                    }
                    
                    
                }
                .padding(.bottom)
                .animation(.easeOut)
                
                //                Spacer()
                
                //MARK: - Rounds and cycles
                if timerManager.trainMode != .initial {
                    HStack {
                        VStack {
                            Text("9")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                                //                            .fontWeight(.regular)
                                +
                                Text("/12")
                                .font(.custom("HelveticaNeue-Thin", size: 28))
                                .fontWeight(.ultraLight)
                            
                            Text("РАУНДЫ")
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("12:57")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                            //                            .fontWeight(.regular)
                            Text("ОСТАЛОСЬ")
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("1")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                                //                            .fontWeight(.regular)
                                +
                                Text("/12")
                                .font(.custom("HelveticaNeue-Thin", size: 28))
                                .fontWeight(.ultraLight)
                            Text("ЦИКЛЫ")
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                    }
                    .animation(.default)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .padding(.bottom)
                }
                //TODO: - add color with 2 schemes (for light and dark mode)
                
                Spacer()
                
                //MARK: - Start button
                HStack {
                    
                    if timerManager.trainMode == .initial {
                        StartPauseButton(action: {timerManager.startTimer(); animateLogo = false } , buttonText: "СТАРТ")
                    }
                    if timerManager.trainMode == .work {
                        StartPauseButton(action: {timerManager.pauseTimer()}, buttonText: "ПАУЗА")
                    }
                    if timerManager.trainMode == .paused {
                        StartPauseButton(action: {timerManager.startTimer()}, buttonText: "СТАРТ")
                    }
                }
//                .animation(.linear)
                //                .padding(.bottom)
            }
            
            //MARK: - Reset button
            VStack {
                
                Spacer()
                
                HStack {
                    ResetButton(action:  { timerManager.resetTimer()  }, buttonColor: .red, imageName: "gobackward")
                    Spacer()
                    
                }
            }
        } //Main ZStack
        .padding()
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            TimerScreen()
        }
        
    }
}

