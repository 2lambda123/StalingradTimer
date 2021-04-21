//
//  SettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 20.04.2021.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var enableDarkMode = false
//    init() {
//
//              UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//              UINavigationBar.appearance().shadowImage = UIImage()
//              UINavigationBar.appearance().isTranslucent = true
//              UINavigationBar.appearance().tintColor = .clear
//              UINavigationBar.appearance().backgroundColor = .clear
//         }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")){
                    HStack {
                        Image("StalingradLogo")
                            .resizable()
                            .scaledToFit()
                        VStack(alignment: .leading) {
                            Text("Сталинград таймер")
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
                    .frame(height: 100)
                }
                
                Section(header: Text("Основные")){
                    Toggle(isOn: $enableDarkMode) {
                        Text("Dark mode")
                    }
                }
            }
            .navigationBarTitle(Text("Настройки"), displayMode: .inline)
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            
    }
}
