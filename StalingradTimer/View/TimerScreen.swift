//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
 
    @ObservedObject private var timerManager = TimerManager(workTime: 20)
    
    var body: some View {
        
        ZStack {
            
            VStack {
                VStack {
                    HStack {
//                        ZStack {
//                            Circle()
//                                .foregroundColor(Color.white)
//                                .frame(width: 35, height: 35)
//                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 4, y: 8)
//
//                            Image(systemName: "gearshape")
//                                .font(.system(size: 35, weight: .light))
//                                .foregroundColor(.black)
////                                .shadowForView()
////                            Image(systemName: "gearshape.fill")
////                                .font(.system(size: 32, weight: .light))
////                                .foregroundColor(.white)
//////                                .offset(x: -0.1, y: -0.1)
////                                .shadow(color: .green, radius: 5, x: 2, y: 4)
//
//                        }
                        Image(systemName: "gearshape")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
//                            .background(Color.green)
//                            .shadow(color: Color.red, radius: 2, x: 4, y: 8)

                        
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
                            .shadowForView()
                    }
                }
                // MARK: - Time + trainig mode
                ZStack {
                    TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.timeleft),
                        trainMode: "Тренировка",
                        trimTo: (20 - CGFloat(timerManager.timeleft)) / 20)
                        
                        // if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                        .onTapGesture {
                            timerManager.timeleft += 1
                        }
                }
                .padding(.bottom)
                
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
                .padding(.bottom)
                
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

