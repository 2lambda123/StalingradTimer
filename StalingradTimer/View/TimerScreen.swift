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
    @State private var bigLogoScaleEffect:CGFloat = 1
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
                    CircleProgressBar(trimTo: CGFloat(timerManager.circleProgressBarController()))
                        .animation(.easeOut(duration: 0.5))
                    
                    if timerManager.trainMode != .initial {
                        TimerValueText(
                            timerText: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
                            trainName: timerManager.getTrainModeName()
                        )
                        .animation(.none)
                        //TODO: - if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                        .onTapGesture {
                            timerManager.addTime()
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
                    VStack {
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
                            }
                            .frame(maxWidth: .infinity)
                            
                            // Total time
                            VStack {
                                Text("\(secondsToMinutesAndSeconds(seconds: timerManager.totalTime) )")
                                    .font(.custom("HelveticaNeue-Thin", size: 38))
                                    .scaledToFit()
                                    .minimumScaleFactor(0.1)
                            }
                            .frame(maxWidth: .infinity)
                            
                            // Cycles
                            VStack {
                                Text(timerManager.usersCycles == 0 ? "" : "\(timerManager.cycles)")
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
                        .background(Color.white)
                        
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
                    
                    
                }
                //TODO: - add color with 2 schemes (for light and dark mode)
                
                Spacer()
                
                //MARK: - Start button
                HStack {
                    timerManager.startButtonOn ?
                        StartPauseButton(action: {
                                            timerManager.startTimer();
                                            timerManager.startButtonOn = false;
                                            bigLogoAnimate = false},
                                         buttonText: "СТАРТ") :
                        StartPauseButton(action: {
                                            timerManager.pauseTimer();
                                            timerManager.startButtonOn = true },
                                         buttonText: "ПАУЗА")
                }
                .padding(.top)
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

