//
//  DynamicHeightTextField.swift
//  DynamicHeightTextField
//
//  Created by AlexBezkopylnyi on 28.07.2023.
//

import SwiftUI

struct DynamicHeightTextField: UIViewRepresentable {
    @EnvironmentObject var environment: ObservedEnvironmentObject
    
    @Binding private var text: String
    
    private let placeholder: String
    private let font: UIFont
    private let textColor: UIColor
    
    private let textView = UITextView()
    
    init(text: Binding<String>,
         placeholder: String = "Type your text",
         font: UIFont = .systemFont(ofSize: 18),
         textColor: UIColor = .black) {
        self.placeholder = placeholder
        self.font = font
        self.textColor = textColor
        self._text = text
    }
    
    func makeUIView(context: UIViewRepresentableContext<DynamicHeightTextField>) -> UITextView {
        textView.font = font
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.layer.masksToBounds = true
        textView.text = placeholder
        textView.delegate = context.coordinator
        self.environment.size = textView.contentSize.height
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        
        return textView
    }
    
    func updateUIView(_ uiView: DynamicHeightTextField.UIViewType, context: UIViewRepresentableContext<DynamicHeightTextField>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return DynamicHeightTextField.Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: DynamicHeightTextField
        
        init(parent: DynamicHeightTextField) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = (parent.text == parent.placeholder) ? "" : parent.text
            textView.textColor = self.parent.textColor
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.environment.size = textView.contentSize.height
            self.parent.text = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            parent.environment.size = textView.contentSize.height
            textView.text = (textView.text == "") ? parent.placeholder : textView.text
        }
    }
}


class ObservedEnvironmentObject: ObservableObject {
    @Published var size: CGFloat = 0
}


