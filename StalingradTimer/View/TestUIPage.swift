//
//  TestUIPage.swift
//  StalingradTimer
//
//  Created by mac on 18.03.2021.
//

import SwiftUI

struct TestUIPage: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6431372549, green: 0.7490196078, blue: 0.937254902, alpha: 1)).opacity(1), Color(#colorLiteral(red: 0.4156862745, green: 0.5764705882, blue: 0.7960784314, alpha: 1)),]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TestUIPage_Previews: PreviewProvider {
    static var previews: some View {
        TestUIPage()
    }
}

//background-color: #6a93cb;
//background-image: linear-gradient(315deg, #6a93cb 0%, #a4bfef 74%);
