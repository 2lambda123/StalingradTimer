//
//  TrimStartButton.swift
//  StalingradTimer
//
//  Created by mac on 16.03.2021.
//

import SwiftUI

struct TrimStartButton: View {
    var trimTo: CGFloat
    var action: () -> Void
    var buttonImage: String
    @ObservedObject private var timerManager = TimerManager()
    var body: some View {
        VStack {
            Button(action: action)  {
                ZStack {
                    Group {
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(Color.gray.opacity(0.1),
                                    style: StrokeStyle(
                                        lineWidth: 10,
                                        lineCap: .square))
                        Circle()
                            .trim(from: 0, to: trimTo)
                            
                            .stroke(Color.red,
                                    style: StrokeStyle(
                                        lineWidth: 10,
                                        lineCap: .butt))
                            .animation(.easeIn)
                            .shadowForView()
                    }
                    
                    
                    Image(systemName: buttonImage)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                        .rotationEffect(.init(degrees: 90))
                        .frame(maxWidth: 50, maxHeight: 50)
                        .minimumScaleFactor(0.1)
//                        .shadowForView()
                }
                .frame(maxWidth: 200,maxHeight: 200)
            }
            .rotationEffect(.init(degrees: -90))
            //            Button(action: {})  {
            //                ZStack {
            //                    Group {
            //                        Circle()
            //                            .trim(from: 0, to: 1)
            //                            .stroke(Color.gray.opacity(0.1),
            //                                    style: StrokeStyle(
            //                                        lineWidth: 10,
            //                                        lineCap: .square))
            //                        Circle()
            //                            .trim(from: 0, to: 0.7)
            //
            //                            .stroke(Color.red,
            //                                    style: StrokeStyle(
            //                                        lineWidth: 10,
            //                                        lineCap: .butt))
            //                    }
            //
            //
            //                    Image(systemName: "play.fill")
            //                        .resizable()
            //                        .scaledToFit()
            //                        .foregroundColor(.red)
            //                        .rotationEffect(.init(degrees: 90))
            //                        .frame(maxWidth: 50, maxHeight: 50)
            //                        .minimumScaleFactor(0.1)
            //
            //                }
            //                .frame(maxWidth: 200,maxHeight: 200)
            //            }
            //            .padding()
            //            .rotationEffect(.init(degrees: -90))
            //            Button(action: {})  {
            //                ZStack {
            //                    Group {
            //                        Circle()
            //                            .trim(from: 0, to: 1)
            //                            .stroke(Color.gray.opacity(0.1),
            //                                    style: StrokeStyle(
            //                                        lineWidth: 10,
            //                                        lineCap: .square))
            //                        Circle()
            //                            .trim(from: 0, to: 0.7)
            //
            //                            .stroke(Color.red,
            //                                    style: StrokeStyle(
            //                                        lineWidth: 10,
            //                                        lineCap: .butt))
            //                    }
            //
            //
            //                    Image(systemName: "pause.fill")
            //                        .resizable()
            //                        .scaledToFit()
            //                        .foregroundColor(.red)
            //                        .rotationEffect(.init(degrees: 90))
            //                        .frame(maxWidth: 80, maxHeight: 80)
            //                        .minimumScaleFactor(0.1)
            //
            //                }
            //                .frame(maxWidth: 200,maxHeight: 200)
            //            }
            //            .padding()
            //            .rotationEffect(.init(degrees: -90))
            //
            //            Button(action: {})  {
            //                ZStack {
            //                    Group {
            //                        Circle()
            //                            .trim(from: 0, to: 1)
            //                            .stroke(Color.gray.opacity(0.1),
            //                                    style: StrokeStyle(
            //                                        lineWidth: 10,
            //                                        lineCap: .square))
            //                        Circle()
            //                            .trim(from: 0, to: 0.7)
            //
            //                            .stroke(Color.red,
            //                                    style: StrokeStyle(
            //                                        lineWidth: 10,
            //                                        lineCap: .butt))
            //                    }
            //
            //
            //                        Image(systemName: "play.fill")
            //                            .resizable()
            //                            .scaledToFit()
            //                            .foregroundColor(.red)
            //                            .rotationEffect(.init(degrees: 90))
            //                            .frame(maxWidth: 80, maxHeight: 80)
            //                            .minimumScaleFactor(0.1)
            //
            //                }
            //                .frame(maxWidth: 200,maxHeight: 200)
            //            }
            //            .padding()
            //            .rotationEffect(.init(degrees: -90))
            //
            //        }
        }
//        .shadowForView()
    }
}
struct TrimStartButton_Previews: PreviewProvider {
    static var previews: some View {
        TrimStartButton(trimTo: 0.4, action: {}, buttonImage: "play.fill")
    }
}
