//
//  TimerValueText.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct TimerValueText: View {
    
//    @ObservedObject private var timerManager = TimerManager(userWorkTimeSet: 20)
    
    var timerValue: String
    var trainMode: String
//    var trimTo: CGFloat
    
    var body: some View {
        VStack {
            ZStack {
                    
                        Text(timerValue)
                            .font(.custom("HelveticaNeue", fixedSize: 140))
                            .modifier(ShadowForViews())
                            .foregroundColor(Color.black)
                            .lineLimit(1)
//                            .shadowForView()
                            .minimumScaleFactor(0.1)
                        Text(trainMode)
                            .italic()
                            .font(.custom("HelveticaNeue-Thin", size: 35))
                            // GurmukhiMN, EuphemiaUCAS, HelveticaNeue-Medium, HelveticaNeue-Thin
                            .offset(x: 0, y: -((UIScreen.main.bounds.width) / 4))
            }
            
//            .frame(maxWidth:  UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.width - 32)
            
        }
        .padding()
        .padding()
        
    }
}

struct TimerValueText_Previews: PreviewProvider {
    static var previews: some View {
        TimerValueText(timerValue: "59:11", trainMode: "Тренировка")
            .padding()
    }
}

    

