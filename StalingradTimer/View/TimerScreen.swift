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
                VStack {
                    TimerValueText(timerText: secondsToMinutesAndSeconds(seconds: timerManager.timeleft), textSize: 120, fontName: "HelveticaNeue-Light", trainMode: "Тренировка", trimTo: (20 - CGFloat(timerManager.timeleft)) / 20) 
                    Spacer()
                    HStack {
                        StartPauseButton(action: { withAnimation(.easeIn) { timerManager.startTimer() } }, buttonText: "START")
                        Spacer()
                        
                        RoundButtonForTimer(action: { withAnimation(.linear(duration: 0.5)) { timerManager.resetTimer()}  }, buttonColor: .red, imageName: "gobackward")
                        
                        
                    }
                }
            }
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
        }
    }
}
struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
        TimerScreen()
    }
}
