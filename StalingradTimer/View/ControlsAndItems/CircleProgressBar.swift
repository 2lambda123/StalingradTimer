//
//  CircleProgressBar.swift
//  StalingradTimer
//
//  Created by mac on 27.03.2021.
//

import SwiftUI

struct CircleProgressBar: View {
    var trimTo: CGFloat
    var body: some View {
        ZStack {
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
//                .animation(.easeOut) // if step 1
                //                    .animation(.easeIn(duration: 0.3))
                //                    .animation(.default) // if step 0.1
                .shadowForView()
            
//            Image("322")
//                .resizable()
//                .scaledToFill()
//                .rotationEffect(.init(degrees: 90))
////                .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
//                .offset(x: -40)
//                .padding()
        }
        .rotationEffect(.init(degrees: -90))
        .frame(maxWidth:  UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.width - 32)

        
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(trimTo: 1)
    }
}
