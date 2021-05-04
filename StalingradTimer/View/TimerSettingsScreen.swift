//
//  TimerSettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 21.04.2021.
//

import SwiftUI

struct TimerSettingsScreen: View {
    
    @State private var preparePickerShow = false
    @State private var workPickerShow = false
    @State private var restPickerShow = false
    @State private var roundsPickerShow = false
    @State private var cyclesPickerShow = false
    @State private var cycleRestPickerShow = false
    
    @State private var enableDarkMode = true
    
    @State private var currentDate = Date()
    
    var body: some View {
        ZStack {
            
            NavigationView {
                Form {
                    
                    Section(header: Text("")){
                        HStack {
                            Text("Подготовка")
                            Spacer()
                            Button(action: { preparePickerShow = true }) {
                                Text("00:15")
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(5)
                            }
                            //                    TimePickerForm(OKAction: {}, cancelAction: {})
                        }
                        
                        
                    }
                    Section(header: Text("")){
                        DatePicker("Тренировка", selection: $currentDate, displayedComponents: .hourAndMinute)
                        //                        .datePickerStyle(FieldDatePickerStyle())
                        DatePicker("Отдых", selection: $currentDate, displayedComponents: .hourAndMinute)
                        
                    }
                    Section(header: Text("")){
                        DatePicker("Раунды", selection: $currentDate, displayedComponents: .hourAndMinute)
                        DatePicker("Циклы", selection: $currentDate, displayedComponents: .hourAndMinute)
                        DatePicker("Востановление", selection: $currentDate, displayedComponents: .hourAndMinute)
                        
                    }
                } .navigationBarTitle(Text("Установка таймера"), displayMode: .inline)
            }
        if preparePickerShow {
                TimePickerForm(OKAction: {preparePickerShow = false}, cancelAction: {preparePickerShow = false})
            }
        } //ZStack
    }
}

struct TimerSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TimerSettingsScreen()
    }
}
