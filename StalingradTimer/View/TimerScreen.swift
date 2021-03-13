//
//  TimerScreen.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct TimerScreen: View {
    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationBarTitle(Text("World"), displayMode: .inline)
                .navigationBarItems(
                    trailing:
                        Button(
                            action: { print("Going to Setting") },
                            label: { Text("Setting") }
                        )
                    
                    
                )
            
        }
    }
}

struct TimerScreen_Previews: PreviewProvider {
    static var previews: some View {
        TimerScreen()
    }
}
