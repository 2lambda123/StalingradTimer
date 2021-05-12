//
//  TimerSettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 21.04.2021.
//

import SwiftUI

struct TimerSettingsScreen: View {
    
    @State private var testValue = 0
    
    @EnvironmentObject private var timerManager: TimerManager
    
    @Environment(\.presentationMode) var timerSettingsPresentation
    
    
    
    @State private var preparePickerShow = false
    @State private var prepareTimeFromPicker = 0
    
    @State private var workPickerShow = false
    @State private var restPickerShow = false
    @State private var roundsPickerShow = false
    @State private var cyclesPickerShow = false
    @State private var cycleRestPickerShow = false
    
    @State private var enableDarkMode = true
    
    @State private var currentDate = Date()
    
    
    var body: some View {
        ZStack {
            Form {
                
                Section(header: Text("")){
                    HStack {
                        Text("Подготовка")
                       
                        Spacer()
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true } }) {
                            Text("\(secondsToMinutesAndSeconds(seconds: timerManager.usersPrepareTime))")
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.gray.opacity(0.07))
                                .cornerRadius(5)
                        }
                    }
                }
            }
            
            if timerManager.showTimePicker {
                TimePickerForm(seconds: Int(timerManager.usersPrepareTime), minuteSelection: (Int(timerManager.usersPrepareTime) % 3600) / 60 , secondSelection: (Int(timerManager.usersPrepareTime) % 3600) % 60 )
            }
        } //ZStack
        .navigationBarTitle(Text("Настройка таймера"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { timerSettingsPresentation.wrappedValue.dismiss() }) {
            if timerManager.showTimePicker == false {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                    Text("   ")
                }
                .foregroundColor(.red)
                .font(.custom("HelveticaNeue", size: 15))
            }
        })
    }
}

struct TimerSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerSettingsScreen().environmentObject(TimerManager())
        }
    }
}
//Float(secondSelection + (minuteSelection * 60))
