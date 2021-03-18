//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
    
    
    
    @ObservedObject private var timerManager = TimerManager()
    var body: some View {
        
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "gearshape")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
                    }
                }
                // MARK: - Time + trainig mode
                ZStack {
                    TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.timeleft), textSize: 120, fontName: "HelveticaNeue-Light", trainMode: "Тренировка", trimTo: (20 - CGFloat(timerManager.timeleft)) / 20)
                        // if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                        .onTapGesture {
                            timerManager.timeleft += 1
                        }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            RoundButtonForTimer(action: { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()}  }, buttonColor: .red, imageName: "gobackward")
                        }
                    }
                }
                
                
                //MARK: - Reset button
//                HStack {
//                    Spacer()
//                    RoundButtonForTimer(action: { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()}  }, buttonColor: .red, imageName: "gobackward")
//                }
                        
                        //                           Spacer()
                 
                
                //MARK: - Rounds and cycles
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
//                .padding(.bottom)
                
                                Spacer()
                
                
                //MARK: - Start button
                HStack {
                    //                        StartPauseButton(action: { withAnimation(.easeIn) { timerManager.startTimer() } }, buttonText: "START")
                    if timerManager.trainMode == .initial {
                        StartPauseButton(action: {timerManager.startTimer()} , buttonText: "СТАРТ")
                    }
                    if timerManager.trainMode == .work {
                        StartPauseButton(action: {timerManager.pauseTimer()}, buttonText: "ПАУЗА")
                    }
                    if timerManager.trainMode == .paused {
                        StartPauseButton(action: {timerManager.startTimer()}, buttonText: "СТАРТ")
                    }
                }
//                .padding(.top)
            }
            
            
            //MARK: - Reset button (test)
            //            VStack {
            //                HStack {
            //                    Spacer()
            //                    RoundButtonForTimer(action: { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()}  }, buttonColor: .red, imageName: "gobackward")
            //                }
            //                Spacer()
            //            }
        } //Main ZStack
        .padding()
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            
            TabView {
                TimerScreen()
//            }.navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

