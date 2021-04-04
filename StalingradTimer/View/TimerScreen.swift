//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
    
    @ObservedObject private var timerManager = TimerManager()
    
    private let bigLogo = "StalingradLogo"
//    @State private var bigLogoScaleEffect:CGFloat = 0.5
    @State private var bigLogoAnimate = true
    
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
                    // Time + trainMode
                    CircleProgressBar(trimTo: (20 - CGFloat(timerManager.currentTime)) / 20)
                    if timerManager.trainMode != .initial {
                        TimerValueText(
                            timerText: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
//                            trainName: timerManager.trainModeDescribtion.rawValue
                            trainName: timerManager.getTrainModeName()
                        )
                            .animation(.none)
                            //TODO: - if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                        .onTapGesture {
                                timerManager.trimController()
                            }
                    }
                    // MARK: - Stalingrad Logo
                    if timerManager.trainMode == .initial {
                        Image(bigLogo)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
                            .offset(y: 40)
                            .scaleEffect(bigLogoAnimate ? 1 : 0.9)
                            .padding()
                            .onAppear() {
                                bigLogoAnimate = true
                            }
                    }
                }
                .animation(.default)
                .padding(.bottom)
                
                //                Spacer()
                
                //MARK: - Rounds and cycles
                if timerManager.trainMode != .initial {
                    HStack {
                        // Rounds
                        VStack {
                            Text("\(timerManager.rounds)")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                                //                            .fontWeight(.regular)
                                +
                                Text("/\(timerManager.usersRounds)")
                                .font(.custom("HelveticaNeue-Thin", size: 28))
                                .fontWeight(.ultraLight)
                            
                            Text("РАУНДЫ")
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                        
                        // Total time
                        VStack {
                            Text("\(secondsToMinutesAndSeconds(seconds: timerManager.totalTime) )")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                            //                            .fontWeight(.regular)
                            Text("ОСТАЛОСЬ")
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                        
                        // Cycles
                        VStack {
                            Text(timerManager.usersCycles == 1 ? "" : "\(timerManager.cycles)")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                                //                            .fontWeight(.regular)
                                +
                                Text(timerManager.usersCycles == 1 ? "" : "/\(timerManager.usersCycles)")
                                
                                .font(.custom("HelveticaNeue-Thin", size: 28))
                                .fontWeight(.ultraLight)
                            Text(timerManager.usersCycles == 1 ? "" : "ЦИКЛЫ")
                                
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        .frame(maxWidth: .infinity)
                    }
//                    .animation(.default)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .padding(.bottom)
                }
                //TODO: - add color with 2 schemes (for light and dark mode)
                
                Spacer()
                
                //MARK: - Start button
                HStack {
                    timerManager.startButtonOn ? StartPauseButton(action: { timerManager.startTimer(); timerManager.startButtonOn = false; bigLogoAnimate = false } , buttonText: "СТАРТ") :
                        StartPauseButton(action: {timerManager.pauseTimer(); timerManager.startButtonOn = true } , buttonText: "ПАУЗА")
                }
            }
            
            //MARK: - Reset button
            VStack {
                Spacer()
                
                HStack {
                    ResetButton(action:  { timerManager.resetTimer(); withAnimation(.easeInOut) { bigLogoAnimate = true } }, buttonColor: .red, imageName: "gobackward")
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

