//
//  TestUIPage.swift
//  StalingradTimer
//
//  Created by mac on 18.03.2021.
//

import SwiftUI

struct TestUIPage: View {

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
                if timerManager.trainMode != .work {
                    HStack {
                        //Rounds
                        VStack {
                            Text("1")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                                //                            .fontWeight(.regular)
                                +
                                Text("/2")
                                .font(.custom("HelveticaNeue-Thin", size: 28))
                                .fontWeight(.ultraLight)
                            
                            Text("РАУНДЫ")
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
//                        Spacer()
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
                        
                        //Cycles
                        VStack {
                            Text(timerManager.usersCycles == 1 ? "12" : "\(timerManager.cycles)")
                                .font(.custom("HelveticaNeue-Thin", size: 38))
                                //                            .fontWeight(.regular)
                                +
                                Text("/12")
                                //timerManager.usersCycles == 1 ? "" : "
                                .font(.custom("HelveticaNeue-Thin", size: 28))
                                .fontWeight(.ultraLight)
                            Text("ЦИКЛЫ")
                                //timerManager.usersCycles == 1 ? "" :
                                .font(.custom("HelveticaNeue-Thin", size: 16))
                                .fontWeight(.ultraLight)
                        }
                        .frame(maxWidth: .infinity)

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
    
struct TestUIPage_Previews: PreviewProvider {
    static var previews: some View {
        TestUIPage()
            
    }
}

//background-color: #6a93cb;
//background-image: linear-gradient(315deg, #6a93cb 0%, #a4bfef 74%);
