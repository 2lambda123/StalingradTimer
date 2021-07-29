//
//  StalingradTimerApp.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

@main
struct StalingradTimerApp: App {
    
    var body: some Scene {
        
        WindowGroup {
//            NavigationView{
                TimerView()
                    .environmentObject(TimerManager())
                    
//                    .navigationBarHidden(true)
//            }
        }
    }
}
