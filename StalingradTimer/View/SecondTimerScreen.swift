//
//  SecondTimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 16.03.2021.
//

import SwiftUI

struct SecondTimerScreen: View {
    @ObservedObject private var timerManager = TimerManager()
    var body: some View {
        ZStack {
           
            //MARK: - Reset button
            VStack {
                
                
                HStack {
                    Spacer()
                    RoundButtonForTimer(action:
                                            { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()} }  , buttonColor: .red, imageName: "gobackward")
                }
                Spacer()
                
            }
            VStack {
                HStack {
                    
                }
                .padding(.bottom)
                //MARK: - Time and training mode
                VStack {
                    Text("Тренировка")
                        .font(.custom("HelveticaNeue-Thin", size: 35))
                        // GurmukhiMN, EuphemiaUCAS, HelveticaNeue-Medium, HelveticaNeue-Thin
                        .shadowForView()
                        .minimumScaleFactor(0.1)
                    Text(secondsToMinutesAndSeconds(seconds: timerManager.timeleft))
                        .font(.custom("HelveticaNeue-Light", fixedSize: 140))
                        //                    .fontWeight(.black)
                        .modifier(ShadowForViews())
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    //                        .scaledToFit()
                    
                }
                
//                Spacer()
                .padding(.bottom)
                //MARK: - Rounds and cycles
                HStack {
                    VStack {
                        Text("1/12")
                            .font(.custom("HelveticaNeue-Thin", size: 35))
                        
                        Text("РАУНДЫ")
                            .font(.custom("HelveticaNeue", size: 18))
                            .opacity(0.5)
                    }
                    Spacer()
                    VStack {
                        Text("12:57")
                            .font(.custom("HelveticaNeue-Thin", size: 35))
                        Text("ОСТАЛОСЬ")
                            .font(.custom("HelveticaNeue", size: 18))
                            .opacity(0.5)
                    }
                    Spacer()
                    VStack {
                        Text("1/12")
                            .font(.custom("HelveticaNeue-Thin", size: 35))
                        Text("ЦИКЛЫ")
                            .font(.custom("HelveticaNeue", size: 18))
                            .opacity(0.5)
                        
                    }
                }
                .minimumScaleFactor(0.1)
                
                Spacer()
                Spacer()
                //MARK: - Start button
                Group {
                    if timerManager.trainMode == .initial {
                        TrimStartButton(trimTo: (20 - CGFloat(timerManager.timeleft)) / 20, action: { timerManager.startTimer() }, buttonImage: "play.fill")
                    }
                    if timerManager.trainMode == .work {
                        TrimStartButton(trimTo: (20 - CGFloat(timerManager.timeleft)) / 20, action: { timerManager.pauseTimer() }, buttonImage: "pause.fill")
                    }
                    if timerManager.trainMode == .paused {
                        TrimStartButton(trimTo: (20 - CGFloat(timerManager.timeleft)) / 20, action: { timerManager.startTimer() }, buttonImage: "play.fill")
                    }
                }
//                .animation(.default)
                //            Spacer()
            }
        }.padding()
    }
}

struct SecondTimerScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabView {
                SecondTimerScreen()
                
            }.navigationBarTitleDisplayMode(.inline)
            
        }
          
        
    }
}
