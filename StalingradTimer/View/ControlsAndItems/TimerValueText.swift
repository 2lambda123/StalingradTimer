//
//  TimerValueText.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct TimerValueText: View {
    
    var timerText: String
    var trainMode: String
//    var timerValue: Int
//    @State var userTimeSet: CGFloat = 20
//    var trimFrom: CGFloat
    var trimTo: CGFloat
    
    
   
    
    
    var body: some View {
        VStack {
            ZStack {
                
                Group{
                    Text(timerText)
                        .font(.custom("HelveticaNeue-Light", fixedSize: 110))
                        .modifier(ShadowForViews())
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
//                        .shadowForView()
                    Text(trainMode)
                        .font(.custom("HelveticaNeue-Thin", size: 35))
                        // GurmukhiMN, EuphemiaUCAS, HelveticaNeue-Medium, HelveticaNeue-Thin
                        .shadowForView()
                        .offset(x: 0, y: -((UIScreen.main.bounds.width) / 4))
//                        .minimumScaleFactor(0.1)
                }
                
                .rotationEffect(.init(degrees: 90))
            
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.gray.opacity(0.1),
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .square))
                
                Circle()
                    .trim(from: 0, to: trimTo)
                    .stroke(Color.red,
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .butt))
                    .animation(.easeIn) // if step 1
//                    .animation(.easeIn(duration: 0.3))
//                    .animation(.default) // if step 0.1
                    .shadowForView()
            }
            .frame(maxWidth:  UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.width - 32)
            
//            .scaledToFit()
            .rotationEffect(.init(degrees: -90))
            
        }
        
    }
}

struct TimerValueText_Previews: PreviewProvider {
    static var previews: some View {
        TimerValueText(timerText: "59:11", trainMode: "Тренировка", trimTo: 1)
            .padding()
    }
}

    

