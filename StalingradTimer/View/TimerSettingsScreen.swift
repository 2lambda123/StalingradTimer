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
                
                Section {
                    HStack {
                        Text("Подготовка")
                            .font(.custom("HelveticaNeue", fixedSize: 19))
                            .italic()
                        Spacer()
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true }; timerManager.settingsMode = .prepare }) {
                            Text("\(secondsToMinutesAndSeconds(seconds: timerManager.usersPrepareTime))")
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.gray.opacity(0.07))
                                .cornerRadius(5)
                        }
                    }
                }
                Section {
                    HStack {
                        Text("Тренировка")
                            .font(.custom("HelveticaNeue", fixedSize: 19))
                            .italic()

                        Spacer()
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true }; timerManager.settingsMode = .work }) {
                            Text("\(secondsToMinutesAndSeconds(seconds: timerManager.usersWorkTime))")
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.gray.opacity(0.07))
                                .cornerRadius(5)
                        }
                    }
                    HStack {
                        Text("Отдых")
                            .font(.custom("HelveticaNeue", fixedSize: 19))
                            .italic()

                        Spacer()
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true }; timerManager.settingsMode = .rest }) {
                            Text("\(secondsToMinutesAndSeconds(seconds: timerManager.usersRestTime))")
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.gray.opacity(0.07))
                                .cornerRadius(5)
                        }
                    }
                    HStack {
                        Text("Раунды")
                            .font(.custom("HelveticaNeue", fixedSize: 19))
                            .italic()

                        Spacer()
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true }; timerManager.settingsMode = .work }) {
                            Text("\(timerManager.usersRounds)")
                                .foregroundColor(.black)
//                                .padding(5)
//                                .background(Color.gray.opacity(0.07))
//                                .cornerRadius(5)
                        }
                    }
                }
                Section {
                   
                    HStack {
                        Text("Циклы")
                            .italic()

                        Spacer()
                        
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true }; timerManager.settingsMode = .rest }) {
                            Text("\(timerManager.usersCycles)")
                                .foregroundColor(.black)
//                                .padding(5)
//                                .background(Color.gray.opacity(0.07))
//                                .cornerRadius(5)
                        }
                    }
                    HStack {
                        Text("Восстановление")
                            .italic()
                        
                        Spacer()
                        
                        Button(action: { withAnimation(.default){ timerManager.showTimePicker = true }; timerManager.settingsMode = .cycleRest }) {
                            Text("\(secondsToMinutesAndSeconds(seconds: timerManager.usersCyclesRest))")
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.gray.opacity(0.07))
                                .cornerRadius(5)
                        }
                    }

                }
                
            }
            .font(.custom("HelveticaNeue", fixedSize: 19))
            if timerManager.showTimePicker && timerManager.settingsMode == .prepare {
                TimePickerForm(seconds: timerManager.usersPrepareTime, minuteSelection: (Int(timerManager.usersPrepareTime) % 3600) / 60 , secondSelection: (Int(timerManager.usersPrepareTime) % 3600) % 60, timePickerText: "Подготовка" )
            }
            if timerManager.showTimePicker && timerManager.settingsMode == .work {
                TimePickerForm(seconds: timerManager.usersWorkTime, minuteSelection: (Int(timerManager.usersWorkTime) % 3600) / 60 , secondSelection: (Int(timerManager.usersWorkTime) % 3600) % 60, timePickerText: "Тренеровка" )
            }
            if timerManager.showTimePicker && timerManager.settingsMode == .rest {
                TimePickerForm(seconds: timerManager.usersRestTime, minuteSelection: (Int(timerManager.usersRestTime) % 3600) / 60 , secondSelection: (Int(timerManager.usersRestTime) % 3600) % 60, timePickerText: "Отдых" )
            }
            if timerManager.showTimePicker && timerManager.settingsMode == .cycleRest {
                TimePickerForm(seconds: timerManager.usersCyclesRest, minuteSelection: (Int(timerManager.usersCyclesRest) % 3600) / 60 , secondSelection: (Int(timerManager.usersCyclesRest) % 3600) % 60, timePickerText: "Восстановление" )
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
                .foregroundColor(.black)
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

