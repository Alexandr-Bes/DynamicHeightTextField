//
//  ContentView.swift
//  DynamicHeightTextField
//
//  Created by AlexBezkopylnyi on 01.08.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var environmentObj: ObservedEnvironmentObject
    @State private var text = ""
    
    var body: some View {
        Background {
            VStack(spacing: 16) {
                Text("This is a Dynamic Height Text Field. Please type your text to test it out 🙂")
                    .font(Font.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom, 16)
                
                DynamicHeightTextField(text: $text)
                    .frame(height: environmentObj.size < 300 ? environmentObj.size : 300)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
            }
            .padding()
        }
        .onTapGesture {
            self.endEditing()
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ObservedEnvironmentObject())
    }
}
