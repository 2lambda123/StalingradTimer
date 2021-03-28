//
//  TimerValueText.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct TimerValueText: View {
    
//    @ObservedObject private var timerManager = TimerManager(userWorkTimeSet: 20)
    
    var timerText: String
    var trainName: String
//    var trimTo: CGFloat
    
    var body: some View {
        VStack {
            ZStack {
                    Group{
                        Text(timerText)
                            .font(.custom("HelveticaNeue-Light", fixedSize: 110))
                            .modifier(ShadowForViews())
                            .foregroundColor(Color.black)
                            .lineLimit(1)
//                            .shadowForView()
                        Text(trainName)
                            .font(.custom("HelveticaNeue-Thin", size: 35))
                            // GurmukhiMN, EuphemiaUCAS, HelveticaNeue-Medium, HelveticaNeue-Thin
                            .shadowForView()
                            .offset(x: 0, y: -((UIScreen.main.bounds.width) / 4))
                    }
                    .rotationEffect(.init(degrees: 90))
               
            }
            .frame(maxWidth:  UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.width - 32)
            .rotationEffect(.init(degrees: -90))
            
        }
        
    }
}

struct TimerValueText_Previews: PreviewProvider {
    static var previews: some View {
        TimerValueText(timerText: "59:11", trainName: "Тренировка")
            .padding()
    }
}

    

