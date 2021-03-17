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
            
            // MARK: - Time + trainig mode
            VStack {
                ZStack {
                    Group {
                        TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.timeleft), textSize: 120, fontName: "HelveticaNeue-Light", trainMode: "Тренировка", trimTo: (20 - CGFloat(timerManager.timeleft)) / 20)
                            // if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                            .onTapGesture {
                                timerManager.timeleft += 1
                            }
                    }
                    //MARK: - Reset button
                    HStack {
                        Spacer()
                        VStack {
                            RoundButtonForTimer(action: { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()}  }, buttonColor: .red, imageName: "gobackward")
                            Spacer()
                        }
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
                
//                Spacer()
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
                        StartPauseButton(action: {timerManager.startTimer()}, buttonText: "START")
                    }
                }.padding(.top)
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
        
        //            .navigationBarTitleDisplayMode(.inline)
        //            .toolbar {
        //                ToolbarItem(placement: .navigationBarLeading) {
        //                }
        //            }
        //            .toolbar {
        //                ToolbarItem(placement: .principal) {
        //                    VStack {
        //                        Text(secondsToMinutesAndSeconds(seconds: timerManager.timeleft))
        //                            .font(Font.custom("ArialMT", size: 30))
        //                        Spacer()
        //                    }
        //                }
        //            }
        //            .toolbar {
        //                ToolbarItem(placement: .navigationBarTrailing) {
        //                    HStack {
        //                        Spacer()
        //                        NavigationLink(destination: Text("Second View")) {
        //                            ZStack {
        //                                Image(systemName: "slider.horizontal.3")
        //                                    .foregroundColor(.black)
        //                                    .font(.title)
        //                            }
        //                            //
        //                        }
        //
        //
        //                    }
        //                }
        //            } //toolBars
        // NavigationView
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            TabView {
                TimerScreen()
            }.navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

