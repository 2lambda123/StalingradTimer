//
//  TimerValueText.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct TimerValueText: View {
    
    var timerValue: String
    var trainMode: String
    
    var body: some View {
        VStack {
            ZStack {
                
                Text(timerValue)
                    .font(.custom("HelveticaNeue", fixedSize: 140))
                    .modifier(ShadowForViews())
                    .foregroundColor(Color.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                Text(trainMode)
                    .italic()
                    .font(.custom("HelveticaNeue-Thin", size: 35))
                    .offset(x: 0, y: -((UIScreen.main.bounds.width) / 4))
            }
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



