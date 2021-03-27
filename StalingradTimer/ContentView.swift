//
//  ContentView.swift
//  StalingradTimer
//
//  Created by mac on 11.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
      UITabBar.appearance().backgroundColor = UIColor.white
      UITabBar.appearance().backgroundImage = UIImage()
    }
    @State private var selected = 0
    
    var body: some View {
        
            
            TabView(selection: $selected) {
                
                TimerScreen()
                    .tabItem {
                        Image(systemName: (selected == 0 ? "stopwatch.fill" : "stopwatch"))
                        Text("Таймер")
                    }
                    .tag(0)
                
                Text("map")
                    .tabItem {
                        Text("Бег")
                        Image(systemName: (selected == 1 ? "map.fill" : "map"))
                    }
                    .tag(1)
                
                Image(systemName: "gear")
                    .tabItem {
                        
                        Image(systemName: (selected == 2 ? "bolt.fill" : "bolt"))
                        Text("Тренировка")
                    }
                    .tag(2)
                
                //            Image(systemName: "gear")
                //                .resizable()
                //                .frame(width: 300, height: 300)
                Text("TEST")
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Меню")
                    }
                    .tag(3)
                
            }
            
            .accentColor(.black)
            
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    VStack {
//                        Text(secondsToMinutesAndSeconds(seconds: timerManager.timeleft))
//                            .font(Font.custom("ArialMT", size: 30))
//                        Spacer()
//                    }
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    HStack {
//                        Spacer()
//                        NavigationLink(destination: Text("Second View")) {
//                            ZStack {
//                                Image(systemName: "slider.horizontal.3")
//                                    .foregroundColor(.black)
//                                    .font(.title)
//                            }
//                            //
//                        }
//
//
//                    }
//                }
//            } //toolBars
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        }    
}
