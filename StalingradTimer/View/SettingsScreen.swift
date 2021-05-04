//
//  SettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 20.04.2021.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var showButton = false
    
    @State private var alertShown = false
    
    //    @State private var steps = Array(1...30)
    @State private var steps = Array(arrayLiteral: 1,3,5,10,15,20,30)
    @State private var stepSelected = 1
    @State private var stepEnable = false
    
    @State private var themeSelection = 0
    //    init() {
    //
    //              UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    //              UINavigationBar.appearance().shadowImage = UIImage()
    //              UINavigationBar.appearance().isTranslucent = true
    //              UINavigationBar.appearance().tintColor = .clear
    //              UINavigationBar.appearance().backgroundColor = .clear
    //         }
    
    var body: some View {
        ZStack {
            NavigationView {
                
                Form {
                    Section(header: Text("")){
                        HStack {
                            Image("logoSettingsSmall")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text("STALINGRAD таймер")
                                    .font(.custom("HelveticaNeue", fixedSize: 20))
                                    .modifier(ShadowForViews())
                                    .foregroundColor(Color.black)
                                
                                Text("1.0.0")
                                    .font(.custom("HelveticaNeue", fixedSize: 15))
                                    .modifier(ShadowForViews())
                                    .foregroundColor(Color.black)
                                    .opacity(0.7)
                            }
                        }
                        .frame(height: 80)
                    }
                    
                    Section(header: Text("Основные"), footer: Text("asdsadasdadasd")){
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "sun.min.fill")
                                Text("Тема приложения")
                            }
                            Picker("Тема приложения", selection: $themeSelection) {
                                Text("Light").tag(0)
                                Text("Dark").tag(1)
                                Text("Automatic").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        
                    }
                    
                    Section(header: Text("Таймер")){
                        VStack {
                            Toggle(isOn: $stepEnable ) {
                                Text("Добавить время")
                            }
                        }
                    }

                    Section(header: Text("Таймер")){
                        VStack {
                            HStack{
                                Text("Добавить время")
                                Spacer()
                                Button(action: { showButton = true}) {
                                    Text("00:15")
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }
//                        Picker("Выберите шаг", selection: $stepSelected) {
//                            ForEach(0..<steps.count) {
//                                Text("\(steps[$0]) сек")
//                            }
//                        }
//                        .pickerStyle(InlinePickerStyle())
                    } // Form
                .navigationBarTitle(Text("Настройки"), displayMode: .inline)
                } // navigationView
            if showButton {
//                StartPauseButton(action: {}, buttonText: "TEST")
//                GeometryReader { _ in
                    
                TimePickerForm(OKAction: {print("checkmark")}, cancelAction: {print("xmark button pressed")})
//
            }
        }//ZStack
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            
    }
}

