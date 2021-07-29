//
//  ValuePickerForm.swift
//  StalingradTimer
//
//  Created by mac on 02.06.2021.
//

 

//import SwiftUI
//
//struct ValuePickerForm: View {
//    
//    @Environment(\.presentationMode) var valuePickerPresentation
//    
//    @EnvironmentObject private var timerManager: TimerManager
//
//    @State var valuePickerText: String
//    @State var valuePickerValue: Int
//    
//    var roundsArray = [Int](0...59)
//    var cyclesArray = [Int](0...59)
//   
//    private let frameHeight: CGFloat = 160
//
//    @State private var steps = Array(arrayLiteral: 1,3,5,10,15,20,30)
//    @State private var stepSelected = 0
//    
//    private let bgGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .bottom, endPoint: .top)
//    
//    var body: some View {
//        
//        ZStack {
//            //MARK: - Background
//            Rectangle()
//                .fill(bgGradient)
//                .opacity(0.93)
//                .ignoresSafeArea(edges: .all)
//                
//            
//            //MARK: - Time Picker
//            VStack {
//                Text("\(valuePickerText)")
//                    .italic()
////                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .font(.custom("HelveticaNeue", fixedSize: 20))
//                    .padding(5)
//                
//                Divider()
//                // minets
//                
//                HStack {
//                    Button(action: {valuePickerValue -= 1}) {
//                        Image(systemName: "minus")
//                            .font(.system(size: 30, weight: .light))
//                            .foregroundColor(.red)
//                    }
//                    .disabled(valuePickerValue <= 1)
//                    
//                    Spacer()
//                    
//                    Text("\(valuePickerValue)")
////                        .fontWeight(.light)
//                        .foregroundColor(.black)
//                        .font(.custom("HelveticaNeue", fixedSize: 30))
//                    
//                    Spacer()
//                    Button(action: {valuePickerValue += 1}) {
//                    Image(systemName: "plus")
//                        .font(.system(size: 30, weight: .light))
//                        .foregroundColor(.red)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.vertical, 10)
//                
//                Divider()
//                    .foregroundColor(.red)
//               
//                Button(action: { getValue(); timerManager.showValuePicker = false;  print("\(valuePickerText) is:\(valuePickerValue)"); print("usersRounds: \(timerManager.usersRounds), usersCycles: \(timerManager.usersCycles)") }) {
//                    Text("OK")
//                        .italic()
////                        .fontWeight(.bold)
//                        .foregroundColor(.red)
//                        .font(.custom("HelveticaNeue", fixedSize: 20))
//                        
//                        .frame(width: 170, height: 30)
//                }
////                .offset(x: 0, y: 5)
//                .padding(5)
//                
//                
//            }// Vstack
//            .frame(width: 200, height: 180)
//            .background(Color.white)
//            .cornerRadius(15)
//            .offset(y: -44)
//            
//            //MARK: - Cancel button
//            CancelButtonValuePicker(action: { withAnimation(.easeInOut(duration: 4)){ timerManager.showValuePicker = false }; setValueIfCancelButtonPwressed() })
//                .offset(x: 100, y: -90)
//                .offset(y: -44)
//        } // Zstack
//    }
//}
//
//struct ValuePickerForm_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ValuePickerForm(valuePickerText: "Раунды", valuePickerValue: 1)
//                .environmentObject(TimerManager())
//        } .navigationBarTitleDisplayMode(.inline)
//        
//        
//    }
//}
//
//struct CancelButtonValuePicker: View {
//var action: () -> Void
//var body: some View {
//Button(action: action) {
//    Image(systemName: "xmark.circle.fill")
//        .resizable()
//        .background(Color.white)
//        .mask(Circle())
//        .foregroundColor(.red)
//        .frame(width: 35, height: 35)
//        
//    
//}
//}
//}
//
//
//extension ValuePickerForm {
//    private func getValue() {
//        switch timerManager.settingsMode {
//        case .rounds:
//            timerManager.usersRounds = valuePickerValue
//        case . cycles:
//            timerManager.usersCycles = valuePickerValue
//        default:
//            break
//        }
//    }
//    
//    private func setValueIfCancelButtonPwressed() {
//        switch timerManager.settingsMode {
//        case .rounds:
//            valuePickerValue = timerManager.usersRounds
//        case . cycles:
//             valuePickerValue = timerManager.usersCycles
//        default:
//            break
//        }
//        
//    }
//}
//
