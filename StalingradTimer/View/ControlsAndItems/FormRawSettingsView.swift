//
//  FormRawSettingsView.swift
//  StalingradTimer
//
//  Created by mac on 14.07.2021.
//

import SwiftUI

struct FormRawSettingsView: View {
    
    var icon: String
    var firstText: String
    var iconBG: Color
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(iconBG)
//                    .opacity(0.1)
//                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 0)
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.title3)
            }
            .frame(width: 35, height: 35)
            .padding(.trailing, 5)
            Text(firstText)
                .font(.custom("HelveticaNeue", size: 17))
                
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
    }
}

struct FormRawSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FormRawSettingsView(icon: "gear", firstText: "Application", iconBG: Color.black)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
