//
//  TimerSettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 21.04.2021.
//

import SwiftUI

struct TimerSettingsScreen: View {
    
    @Environment(\.presentationMode) var timerSettingsPresentation
    
    @State private var showTimePickerForm = false
    
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
            Form {
                
                Section(header: Text("")){
                    HStack {
                        Text("Подготовка")
                        Spacer()
                        Button(action: { withAnimation(.default){ showTimePickerForm = true } }) {
                            Text("00:15")
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(5)
                        }
                    }
                }
            }
            
        if showTimePickerForm {
            TimePickerForm(OKAction: { showTimePickerForm = false }, cancelAction: {showTimePickerForm = false}, secondSelection: 0)
            }
        } //ZStack
        .navigationBarTitle(Text("Настройка таймера"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { timerSettingsPresentation.wrappedValue.dismiss() }) {
            if showTimePickerForm == false {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Назад")
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
        TimerSettingsScreen()
        }
    }
}
