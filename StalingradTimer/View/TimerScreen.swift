//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
    
  
    
    @ObservedObject var timerManager = TimerManager()
    var body: some View {
        NavigationView {
            ZStack {
                // Timer
                VStack {
                    TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.timeleft), textSize: 120, fontName: "HelveticaNeue-Light", trainMode: "Тренировка", trimTo: (20 - CGFloat(timerManager.timeleft)) / 20)
                        // if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                        .onTapGesture {
                            timerManager.timeleft += 1
                        }
                    
                        // Rounds and cycles left
                    
                    Spacer()
                    // Start button
                    HStack {
//                        StartPauseButton(action: { withAnimation(.easeIn) { timerManager.startTimer() } }, buttonText: "START")
                        if timerManager.trainMode == .initial {
                            StartPauseButton(action: {timerManager.startTimer()} , buttonText: "START")
                        }
                        if timerManager.trainMode == .work {
                            StartPauseButton(action: {timerManager.pauseTimer()}, buttonText: "PAUSE")
                        }
                        if timerManager.trainMode == .paused {
                            StartPauseButton(action: {timerManager.startTimer()}, buttonText: "START")
                        }
                    }
                }
                // ruonds aon cycles
                VStack {
                    HStack {
                            ZStack {
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(Color.red.opacity(0.05),
                                            style: StrokeStyle(
                                                lineWidth: 10,
                                                lineCap: .square))
                                    .frame(width: 100)
                                VStack {
                                    Text("00")
                                        .font(.custom("HelveticaNeue-Light", size: 40))
                                    Text("Раунды")
                                        .font(.custom("HelveticaNeue-Light", size: 15))
                                }
                                .minimumScaleFactor(0.1)
                                
                            }
                        
                        Spacer()
                        ZStack {
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(Color.red.opacity(0.05),
                                        style: StrokeStyle(
                                            lineWidth: 10,
                                            lineCap: .square))
                                .frame(width: 100)
                            VStack {
                                Text("0")
                                    .font(.custom("HelveticaNeue-Light", size: 40))
                                Text("Циклы")
                                    .font(.custom("HelveticaNeue-Light", size: 15))
                            }
                            .minimumScaleFactor(0.1)
                            
                        }
                    }
                    
                }
                .offset(y: 140)
                
                //reset button
                VStack {
                    HStack {
                        Spacer()
                        RoundButtonForTimer(action: { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()}  }, buttonColor: .red, imageName: "gobackward")
                    }
                    Spacer()
                }
            } //Main ZStack
            .padding()
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(secondsToMinutesAndSeconds(seconds: timerManager.timeleft))
                            .font(Font.custom("ArialMT", size: 30))
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Spacer()
                        NavigationLink(destination: Text("Second View")) {
                            ZStack {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                            //
                        }
                        
                        
                    }
                }
            }
        } // NavigationView
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            
            TimerScreen()
        }
    }
}

