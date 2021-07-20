//
//  StalingradLogo.swift
//  StalingradTimer
//
//  Created by mac on 20.07.2021.
//

import SwiftUI

struct StalingradLogo: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        Image("StalingradLogo")
            .resizable()
            .scaledToFill()
            .frame(maxWidth:  UIScreen.main.bounds.width - 64, maxHeight: UIScreen.main.bounds.width - 64)
            .offset(y: 40)
            .padding()
    }
}

struct StalingradLogo_Previews: PreviewProvider {
    static var previews: some View {
        StalingradLogo()
    }
}
