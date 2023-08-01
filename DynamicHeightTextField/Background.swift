//
//  Background.swift
//  DynamicHeightTextField
//
//  Created by AlexBezkopylnyi on 01.08.2023.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        background
    }
    
    @ViewBuilder private var background: some View {
        if #available(iOS 14.0, *) {
            Color(red: 0.145, green: 0.20, blue: 0.66)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .overlay(content)
                .ignoresSafeArea()
        } else {
            Color(red: 0.145, green: 0.20, blue: 0.66)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .overlay(content)
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background {}
    }
}
