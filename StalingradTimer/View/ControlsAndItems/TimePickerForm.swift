//
//  TimePickerForm.swift
//  StalingradTimer
//
//  Created by mac on 29.04.2021.
//

import SwiftUI



struct TimePickerForm: View {
//    internal init(OKAction: () -> Void, cancelAction: () -> Void, daysArray: [Int] = [Int](0..<30), hoursArray: [Int] = [Int](0..<23), minutesArray: [Int] = [Int](0..<60), secondsArray: [Int] = [Int](0..<60)) {
//        self.OKAction = OKAction
//        self.cancelAction = cancelAction
//        self.daysArray = daysArray
//        self.hoursArray = hoursArray
//        self.minutesArray = minutesArray
//        self.secondsArray = secondsArray
//    }
    
    
    
    var OKAction: () -> Void
    var cancelAction: () -> Void
    
    @State private var seconds: Int = 60
    
     var daysArray = [Int](0..<30)
     var hoursArray = [Int](0..<23)
     var minutesArray = [Int](0..<60)
      var secondsArray = [Int](0..<60)
    
     let hoursInDay = 24
     let secondsInMinute = 60
     let minutesInHour = 60
     let secondsInHour = 3600
     let secondsInDay = 86400
    
    @State private var daySelection = 0
    @State private var hourSelection = 0
    @State private var minuteSelection = 1
    @State private var secondSelection = 0
    
    private let frameHeight: CGFloat = 160
    
    @State var showSome = false
    
    private var totalInSeconds: Int {
        return daySelection * self.secondsInDay + hourSelection * self.secondsInHour + minuteSelection *     self.secondsInMinute + secondSelection
    }
    
    @State private var steps = Array(arrayLiteral: 1,3,5,10,15,20,30)
    @State private var stepSelected = 0
    
    private let bgGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        
        ZStack {
//
            Rectangle()
                .fill(bgGradient)
                .opacity(0.93)
                .ignoresSafeArea(edges: .all)
                .onTapGesture {
                    showSome = false
                }
            
            VStack {
                
                HStack(spacing: 0) {
                    Picker(selection: self.$minuteSelection, label: Text("")) {
                        ForEach(0 ..< self.minutesArray.count) { index in
                            Text("\(self.minutesArray[index])")
                                .foregroundColor(.black)
                                .font(.custom("HelveticaNeue", fixedSize: 25))
                                //                                .font(.custom("HelveticaNeue", size: 38))
                                //                            Text("")
                                .tag(index)
                        }
                    }
                    .labelsHidden()
                    .onChange(of: self.minuteSelection) { newValue in
                        seconds = totalInSeconds
                    }
                    .frame(width: 80, height: 110)
                    .clipped()
                    Text(":")
                    //                        .font(.custom("HelveticaNeue", size: 38))
                    Picker(selection: self.self.$secondSelection, label: Text("")) {
                        ForEach(0 ..< self.secondsArray.count) { index in
                            Text("\(self.secondsArray[index])")
                                .foregroundColor(.black)
                                .font(.custom("HelveticaNeue", fixedSize: 25))

                                //                                .font(.custom("HelveticaNeue", size: 38))
                                //                            Text("")
                                .tag(index)
                        }
                    }
                    .labelsHidden()
                    .onChange(of: self.secondSelection) { newValue in
                        seconds = totalInSeconds
                    }
                    .frame(width: 80, height: 110)
                    .clipped()
                }
                
                Divider()
                    .foregroundColor(.red)
                Button(action: OKAction) {
                    Text("OK")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .font(.custom("HelveticaNeue", fixedSize: 20))
                    
                        .frame(width: 170, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .background(Color.blue)
                }
                .offset(x: 0, y: 5)
                
            }// Vstack
            .frame(width: 200, height: 200)
            .background(Color.white)
            .cornerRadius(15)
//            .clipped()
            
            CancelButton(action: cancelAction)
                .offset(x: 95, y: -95)
        } // Zstack
       
    }
}

struct TimePickerForm_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerForm(OKAction: {}, cancelAction: {})
            
            
    }
}

//
//Picker("Выберите шаг", selection: $stepSelected) {
//    ForEach(0..<steps.count) {
//        Text("\(steps[$0]) ")
//            .font(.custom("HelveticaNeue", size: 28))
//
//    }
//}
//.pickerStyle(InlinePickerStyle())
//.frame(width: 200, height: 200)
//.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
//.cornerRadius(10)
//.clipped()

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