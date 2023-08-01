//
//  Extensions.swift
//  DynamicHeightTextField
//
//  Created by AlexBezkopylnyi on 01.08.2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
