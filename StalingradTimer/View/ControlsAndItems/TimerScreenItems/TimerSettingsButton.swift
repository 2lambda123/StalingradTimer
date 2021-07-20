//
//  TimerSettingsButton.swift
//  StalingradTimer
//
//  Created by mac on 20.07.2021.
//

import SwiftUI

struct TimerSettingsButton: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        NavigationLink(destination: TimerSettingsScreen()) {
            Image(systemName: "stopwatch")
                .font(.system(size: 35, weight: .light))
                .foregroundColor(.black)
                .animation(nil)
                .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
                .animation(.default)
        }
    }
}

struct TimerSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerSettingsButton()
    }
}
