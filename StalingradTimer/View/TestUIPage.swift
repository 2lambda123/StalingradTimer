//
//  TestUIPage.swift
//  StalingradTimer
//
//  Created by mac on 18.03.2021.
//

import SwiftUI

struct TestUIPage: View {
    @ObservedObject private var timerManager = TimerManager(workTime: 20)
    
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
                            .shadowForView()
                    }
                }
                // MARK: - Time, Training mode
                ZStack {
                    TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.timeleft),
                        trainName: "Тренировка")
                        
                        // if isOn Нажмите на время, чтобы прибавить его. + сделать выбор шага
                        .onTapGesture {
                            timerManager.timeleft += 1
                        }
                }
                .padding(.bottom)
                
                //MARK: - Rounds, Timeleft, Cycles
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
struct TestUIPage_Previews: PreviewProvider {
    static var previews: some View {
        TestUIPage()
            
    }
}

//background-color: #6a93cb;
//background-image: linear-gradient(315deg, #6a93cb 0%, #a4bfef 74%);
