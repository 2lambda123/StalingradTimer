//
//  TimeChangerMenu.swift
//  StalingradTimer
//
//  Created by mac on 20.07.2021.
//

import SwiftUI

struct TimeChangerMenu: View {
    
    @EnvironmentObject private var timerManager: TimerManager
    
    var body: some View {
        HStack {
            Button(action: { timerManager.subtractTime() }){
                Image(systemName: "minus")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 60)
            }
            Button(action: { timerManager.showTimeChangePicker.toggle() }) {
                Text("\(Int(timerManager.timeChangeMenuStep)) сек.")
                    .font(.custom("HelveticaNeue-Thin", size: 35))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(height: 60)
            }
            
            
            Button(action: { timerManager.addTime() }) {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 60)
            }
        }
        
        .offset(x: 0, y: ((UIScreen.main.bounds.width) / 4))
    }
}

struct TimeChangerMenu_Previews: PreviewProvider {
    static var previews: some View {
        TimeChangerMenu()
    }
}
