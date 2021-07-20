//
//  RoundButtonForTimer.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct ResetButton: View {
    @ObservedObject var timerManager = TimerManager()
    var action: () -> Void
    var buttonColor = Color.red
    var imageName = "gobackward"
    var body: some View {
        
        Button(action: action) {
            ZStack {
                
                Circle()
                    .foregroundColor(.white)
                    .shadowForView()
                    .overlay(
                        Circle()
                            .stroke(buttonColor, lineWidth: 1))
                    .frame(width: 50, height: 50)
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 23, height: 23)
                    .foregroundColor(buttonColor)
                    .padding()
            }
            
        }
        .animation(nil)
        .animation(.default)
    }
}

struct RoundButtonForTimer_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton(action: {}, buttonColor: .red, imageName: "gobackward")
    }
}
