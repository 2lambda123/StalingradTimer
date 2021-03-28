//
//  StartPauseButton.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

struct StartPauseButton: View {
    
    var action: () -> Void
    var buttonText: String
    var textColor =  #colorLiteral(red: 0.9254901961, green: 0.03137254902, blue: 0.1019607843, alpha: 1)
    var body: some View {
        
        Button(action: action) {
            Text(buttonText)
                .font(Font.system(size: 34, weight: .semibold, design: .default))
                .foregroundColor(Color(textColor))
                .padding()
        }
      
        .frame(width: 156, height: 80)
        .background(Color.white)
        //            .cornerRadius(.infinity)
        .cornerRadius(15)
        .shadowForView()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.red, lineWidth: 2))
    }
}


struct StartPauseButton_Previews: PreviewProvider {
    static var previews: some View {
        StartPauseButton(action: {}, buttonText: "asd")
    }
}
