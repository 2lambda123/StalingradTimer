//
//  RoundButtonForTimer.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct RoundButtonForTimer: View {
    var action: () -> Void
    var buttonColor: Color
    var imageName: String
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(buttonColor)
                .padding()
        }
        .frame(height: 80)
        .background(
            Circle()
                .foregroundColor(.white)
            
        )
        .overlay(
            Circle()
                .stroke(Color.red, lineWidth: 1))
        .shadowForView()
    }
}

struct RoundButtonForTimer_Previews: PreviewProvider {
    static var previews: some View {
        RoundButtonForTimer(action: {}, buttonColor: .red, imageName: "gobackward")
    }
}
