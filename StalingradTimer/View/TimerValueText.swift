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
    
    var body: some View {
        
        Text(timerText)
            .font(.custom(fontName, fixedSize: textSize))
            .modifier(ShadowForViews())
            .foregroundColor(Color.black)
            .lineLimit(1)
            .minimumScaleFactor(0)
    }
}

struct TimerValueText_Previews: PreviewProvider {
    static var previews: some View {
        TimerValueText(timerText: "59:11", textSize: 90, fontName: "HelveticaNeue")
    }
}
