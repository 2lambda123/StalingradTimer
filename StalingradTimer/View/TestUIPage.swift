//
//  TestUIPage.swift
//  StalingradTimer
//
//  Created by mac on 18.03.2021.
//

import SwiftUI

struct TestUIPage: View {

    @ObservedObject private var timerManager = TimerManager()
    
    @State private var showSettings = false
    
    private let bigLogo = "StalingradLogo"
    @State private var bigLogoAnimate = true
    @State private var totalOpacityAn: Double = 0
    
    var body: some View {
        
        ZStack {
            VStack {
                //MARK: - "NavigationBar"
                VStack {
                    HStack {
                        Button(action: {showSettings.toggle()}) {
                            Image(systemName: "gearshape")
                                .font(.system(size: 35, weight: .light))
                                .foregroundColor(.black)
                                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
                                .animation(.default)
                        }
                        .disabled(timerManager.trainMode != .initial)
                        .sheet(isPresented: $showSettings) {
                            SettingsScreen()
                        }
                        
                        
                        Spacer()
                        
                        Image(systemName: "stopwatch")
                            .font(.system(size: 35, weight: .light))
                            .foregroundColor(.black)
                            .shadowForView()
                    }
                }
                // MARK: - Time + trainig mode
                ZStack {
                    
                    CircleProgressBar(trimTo: CGFloat(timerManager.circleProgressBarController()))
                        .animation(.easeOut(duration: 0.5))
                    
                    if timerManager.trainMode != .initial {
                        TimerValueText(
                            timerText: secondsToMinutesAndSeconds(seconds: timerManager.currentTime),
                            trainName: timerManager.getTrainModeName()
                        )
                        .animation(.none)
                        .onTapGesture {
                            timerManager.addTime()
                        }
                    }
                    // MARK: - Stalingrad Logo
                    
                    if timerManager.trainMode == .initial {
                            StalingradLogoTest(bigLogoAnimate: $bigLogoAnimate)
                               
                    }
                }
                
                Spacer().frame(height: 16)
                
                //MARK: - Rounds and cycles
                timerManager.trainMode != .initial ?
                    RoundsTotaltimeCyclesTest(timerManager: timerManager)
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
                // TODO: - сделать кнопку ccaletofit, что добавить padding  к totaltime
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
                    Spacer()
                }
            }
        } //Main ZStack
        .padding()
    }
}
struct TestUIPage_Previews: PreviewProvider {
    static var previews: some View {
        TestUIPage()
            
    }
}

//background-color: #6a93cb;
//background-image: linear-gradient(315deg, #6a93cb 0%, #a4bfef 74%);

 struct StalingradLogoTest: View {
    
    @Binding var bigLogoAnimate: Bool
    
    var body: some View {
        Image("StalingradLogo")
            .resizable()
            .scaledToFill()
            .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
            .offset(y: 40)
            .scaleEffect(bigLogoAnimate ? 1 : 0.8)
            .opacity(bigLogoAnimate ? 1 : 0)
            .animation(.default)
            .padding()
            .onAppear() {
                bigLogoAnimate = true
            }
    }
}

 struct RoundsTotaltimeCyclesTest: View {
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
//        .transition(.scale)
    }
}
