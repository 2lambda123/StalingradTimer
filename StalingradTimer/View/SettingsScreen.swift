//
//  SettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 20.04.2021.
//

import SwiftUI

struct SettingsScreen: View {
   
    @Environment(\.presentationMode) var settingsPresentation
    
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
                Form {
                    Section(header: Text("")){
                        HStack {
                            Image("logoSettingsSmall")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(width: 70, height: 70)
                            
                            VStack(alignment: .leading) {
                                Text("STALINGRAD таймер")
                                    .italic()
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
                     // Form
                
//                    .navigationBarItems(leading: )
                } // navigationView
//            if showButton {
//                
//                TimePickerForm(secondSelection: 0)
//            }
        }//ZStack
        .navigationBarTitle(Text("Настройки") , displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { settingsPresentation.wrappedValue.dismiss() }) {
            if showButton == false {
                
                    Image(systemName: "chevron.left")
                        .font(.title3)
                
                .foregroundColor(.red)
                .font(.custom("HelveticaNeue", size: 15))
            }
        })
     
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsScreen()
        }
            
            
    }
}
// вместо вью - .sheet
//Button(action: {showTimerSettings.toggle()}) {
//    Image(systemName: "stopwatch")
//        .font(.system(size: 35, weight: .light))
//        .foregroundColor(.black)
//        .opacity(timerManager.trainMode != .initial ? 0.5 : 1)
//        .animation(.default)
//}
//.disabled(timerManager.trainMode != .initial)
//.sheet(isPresented: $showTimerSettings) {
//    TimerSettingsScreen()
//}
