//
//  SettingsButton.swift
//  StalingradTimer
//
//  Created by mac on 20.07.2021.
//

import SwiftUI

struct SettingsButton: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        Button(action: { timerManager.showTimeChangePicker.toggle() }) {
            Image(systemName: "gearshape")
                .font(.system(size: 35, weight: .light))
                .foregroundColor(.black)
                .animation(nil)
                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
                .animation(.easeOut(duration: 0.5))
        }
        .sheet(isPresented: $timerManager.showSettingsScreen) {
            SettingsScreen()
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
