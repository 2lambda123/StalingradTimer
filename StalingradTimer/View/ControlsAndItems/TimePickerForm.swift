//
//  TimePickerForm.swift
//  StalingradTimer
//
//  Created by mac on 29.04.2021.
//

import SwiftUI



struct TimePickerForm: View {
    
    
     var totalInSeconds: Int {
        return minuteSelection * self.secondsInMinute + secondSelection
    }
    
    @EnvironmentObject private var timerManager: TimerManager
    
   
    
//        var OKAction: () -> Void
//    var cancelAction: () -> Void
    
    @State var seconds: Int
    
    var daysArray = [Int](0..<30)
    var hoursArray = [Int](0..<23)
    var minutesArray = [Int](0...59)
    var secondsArray = [Int](0...59)
    
    let hoursInDay = 24
    let secondsInMinute = 60
    let minutesInHour = 60
    let secondsInHour = 3600
    let secondsInDay = 86400
    
    
    @State var minuteSelection: Int
    @State var secondSelection: Int
    
    
    
    private let frameHeight: CGFloat = 160
    
    @State var showSome = false
    
    
    
    @State private var steps = Array(arrayLiteral: 1,3,5,10,15,20,30)
    @State private var stepSelected = 0
    
    private let bgGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        
        ZStack {
            //MARK: - Background
            Rectangle()
                .fill(bgGradient)
                .opacity(0.93)
                .ignoresSafeArea(edges: .all)
                .onTapGesture {
                    showSome = false
                }
            
            //MARK: - Time Picker
            VStack {
                Text("Подготовка")
                    .italic()
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.custom("HelveticaNeue", fixedSize: 20))
                
                Divider()
                // minets
                //TODO: - убрать значение у minuteSelection
                HStack(spacing: 2) {
                    
                    Picker(selection: self.$minuteSelection, label: Text("")) {
                        ForEach(0 ..< self.minutesArray.count) { index in
                            Text(index > 9 ? "\(self.minutesArray[index])" : "0" + "\(self.minutesArray[index])")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.custom("HelveticaNeue", fixedSize: 30))
                                .tag(index)
                        }
                    }
                    .labelsHidden()
                    .onChange(of: minuteSelection) { newValue in
                        seconds = totalInSeconds
                        print(minuteSelection)
                    }
                    .frame(width: 80, height: 110)
                    .clipped()
                    
                    Text(":")
                   // seconds
                    Picker(selection: $secondSelection, label: Text("")) {
                        ForEach(0 ..< secondsArray.count) { index in
                            //                                Text("\(self.secondsArray[index])")
                            Text(index > 9 ? "\(self.secondsArray[index])" : "0" + "\(self.secondsArray[index])")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.custom("HelveticaNeue", fixedSize: 30))
                                .tag(index)
                        }
                    }
                    .labelsHidden()
                    .onChange(of: secondSelection) { newValue in
                        seconds = totalInSeconds
                    }
                    .frame(width: 80, height: 110)
                    .clipped()
                }
                
                Divider()
                    .foregroundColor(.red)
                // если разобрать, как заменить timerManager.usersPrepareTime = Float(totalInSeconds), на Binding  = Float(totalInSeconds), то можно будет применить данную форму ко всем вариантам (подг, трен, отдых и т.д.)
                Button(action: { timerManager.usersPrepareTime = Float(totalInSeconds); timerManager.showTimePicker = false; print("rprepare time is: \(timerManager.usersPrepareTime)") }) {
                    Text("OK")
                        .italic()
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .font(.custom("HelveticaNeue", fixedSize: 20))
                        
                        .frame(width: 170, height: 30)
                }
                .offset(x: 0, y: 5)
                
                
            }// Vstack
            .frame(width: 200, height: 240)
            .background(Color.white)
            .cornerRadius(15)
            .offset(y: -44)
            
            //MARK: - Cancel button
            CancelButton(action: {withAnimation(.easeInOut(duration: 4)){ timerManager.showTimePicker = false } })
                .offset(x: 100, y: -120)
                .offset(y: -44)
            
            HStack {
                Button(action: {seconds = totalInSeconds}, label: {
                    Text("Button")
                    Spacer().frame(width: 30)
                 Text("\(seconds)")
                })
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .offset(y: 130)
            .padding(.horizontal)
            
            
        } // Zstack
    }
    
}

struct TimePickerForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimePickerForm(seconds: 1, minuteSelection: 5, secondSelection: 10)
                .environmentObject(TimerManager())
        } .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct CancelButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .background(Color.white)
                .mask(Circle())
                .foregroundColor(.red)
                .frame(width: 35, height: 35)
                
            
        }
    }
}
