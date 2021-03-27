//
//  RoundButtonForTimer.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct ResetButton: View {
    var action: () -> Void
    var buttonColor: Color
    var imageName: String
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
            
                
            
            
            
    }
}

struct RoundButtonForTimer_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton(action: {}, buttonColor: .red, imageName: "gobackward")
    }
}
