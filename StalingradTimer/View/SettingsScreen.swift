//
//  SettingsScreen.swift
//  StalingradTimer
//
//  Created by mac on 20.04.2021.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationView {
        Text("Settings")
        }.navigationTitle("Settings")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
