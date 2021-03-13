//
//  ShadowForViews.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

//MARK: - тень для some View
struct ShadowForViews:ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 2, y: 4)
    }
}

extension View {
    func shadowForView() -> some View {
        modifier(ShadowForViews())
    }
}

