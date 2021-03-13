//
//  TimerValueText.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct TimerValueText: View {
    
    var timerText: String
    var textSize: CGFloat
    var fontName: String
    var timerValue: Int
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        VStack {
            ZStack {
                Group{
                    Text(secondsToMinutesAndSeconds(seconds: timerManager.timeleft))
                        .font(.custom(fontName, fixedSize: textSize))
                        .modifier(ShadowForViews())
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    
                    Text("Тренировка")
                        .font(.custom("HelveticaNeue-Thin", size: 35))
                        // GurmukhiMN, EuphemiaUCAS, HelveticaNeue-Medium, HelveticaNeue-Thin
                        .shadowForView()
                        .offset(x: 0, y: -((UIScreen.main.bounds.width) / 4))
                        .minimumScaleFactor(0.1)
                }
                
                .rotationEffect(.init(degrees: 90))
                
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.gray.opacity(0.1),
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .square))
                Circle()
//                    .trim(from: 0, to: CGFloat(timerManager.timeleft) / 20   )
                    .trim(from: 0, to: 18 / 20   )
                    .stroke(Color.red,
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .butt))
                    .animation(.default)
            }
            .frame(height: UIScreen.main.bounds.width - 32)
            
            .rotationEffect(.init(degrees: -90))
            Spacer()
            //Start and reset buttons
            HStack {
                StartPauseButton(action: {timerManager.startTimer() }, buttonText: "START")
                Spacer()
                RoundButtonForTimer(action: { timerManager.resetTimer()  }, buttonColor: .red, imageName: "gobackward")
                    .animation(.default)
            }
            
        }
        
    }
}

struct TimerValueText_Previews: PreviewProvider {
    static var previews: some View {
        TimerValueText(timerText: "59:11", textSize: 120, fontName: "HelveticaNeue-Light", timerValue: Int(0.5))
            .padding()
    }
}
