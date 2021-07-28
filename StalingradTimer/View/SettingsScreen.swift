//
//  SettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 20.04.2021.
//

import SwiftUI

struct SettingsScreen: View {
   
    @Environment(\.presentationMode) var settingsPresentation
    
//    @State private var showButton = false
    
    @State private var alertShown = false
    
    //    @State private var steps = Array(1...30)
    @State private var steps = Array(arrayLiteral: 1,3,5,10,15,20,30)
    @State private var stepSelected = 1
    @State private var stepEnable = false
    
    @State private var themeSelection = 0
 
    var body: some View {
        
        VStack {
            
            ZStack {
                Text("Настройки")
//                    .font(.custom("HelveticaNeue", size: 20))
//                    .bold()
                    .font(.headline)
                HStack {
                    Spacer()
                    Button(action: { settingsPresentation.wrappedValue.dismiss() }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
            }
            .font(.custom("HelveticaNeue", fixedSize: 20))
            .padding()
//            .padding(.bottom, 5)
//            .background(Color("menuBG"))
            .background(Color.white)
            
                Form {
                    //MARK: - Section 1
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
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .frame(height: 80)
                    } //: Section 1
                    
                    Section(header: Text("")) {
                        FormRawSettingsView(icon: "sun.min.fill", firstText: "Дистплей", iconBG: Color.yellow)
                        FormRawSettingsView(icon: "speaker.wave.2.fill", firstText: "Звук", iconBG: Color.green)
                    }
//                    Section(header: Text("")) {
//                        FormRawSettingsView(icon: "speaker.wave.2.fill", firstText: "Звук", iconBG: Color.green)
//                    }
                    Section(header: Text("")) {
                        FormRawSettingsView(icon: "stopwatch.fill", firstText: "Таймер", iconBG: Color.red)
//                            .listRowInsets(.init())
//                            .listRowBackground(Color.blue)
//                            .padding(.horizontal)
                    }
                    
                    Section(header: Text("")) {
                        FormRawSettingsView(icon: "crown.fill", firstText: "Клуб Сталинград", iconBG: Color.red)
                        FormRawSettingsView(icon: "link.circle.fill", firstText: "Контакты", iconBG: Color.blue)
                        FormRawSettingsView(icon: "arrowshape.turn.up.forward.fill", firstText: "Поделиться", iconBG: Color.blue)
                    }
                    
                    Section(header: Text("")) {
                        FormRawSettingsView(icon: "info.circle.fill", firstText: "О приложении", iconBG: Color.black)
                    }
//                    .textCase(nil)
                    
                } // Form
                
                .padding(.top, -10)
//
                
            // MARK: - Footer
            Text("Copyright © All rights reserved.")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .padding(.top)
                .padding(.bottom)
                .padding(.bottom)
                .foregroundColor(Color.secondary)
        }//VStack
        
//        .navigationBarTitle(Text("Настройки") , displayMode: .inline)
        .background(Color("menuBG"))
        .edgesIgnoringSafeArea(.all)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: Button(action: { settingsPresentation.wrappedValue.dismiss() }) {
//                    Image(systemName: "xmark")
//                        .font(.title3)
//                        .foregroundColor(.black)
//                .font(.custom("HelveticaNeue", size: 15))
//        })
     
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
