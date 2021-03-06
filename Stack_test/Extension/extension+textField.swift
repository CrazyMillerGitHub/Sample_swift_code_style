//
//  extension+textField.swift
//  Stack_test
//
//  Created by Михаил Борисов on 09.02.2020.
//  Copyright © 2020 Mikhail Borisov. All rights reserved.
//

import UIKit
import CocoaTextField

enum TextFieldType {
    // passwordTextField
    case password
    // emailTextField
    case email

}

extension UITextField {

    // MARK: ContainerTextField
    static func container(_ type: TextFieldType) -> CocoaTextField {
        // inizialize textField
        let textField = CocoaTextField()
        // check which type do you want to use
        switch type {
        case .password:
            textField.placeholder = "Password"
            // Set textContentType to password. This will work with keychain
            textField.textContentType = .password
        case .email:
            textField.placeholder = "Email"
            // Set keyboard type to email. Different keyboard
            textField.keyboardType = .emailAddress
            textField.textContentType = .emailAddress
        }
         // Set the inactive color to grey
        textField.inactiveHintColor = UIColor(red: 209/255, green: 211/255, blue: 212/255, alpha: 1)
         // Set the active color to sunrizeColor
        textField.activeHintColor = .sunrize
        // Set the default color to deep light grey
        textField.focusedBackgroundColor = UIColor(red: 236/255, green: 239/255, blue: 239/255, alpha: 1)
        // Set the default color to light grey
        textField.defaultBackgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        // Set the border color to grey
        textField.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        // Set the error color to sunrizeColor
        textField.errorColor = .sunrize
        // Set size of border width to 1
        textField.borderWidth = 1
        // Set the corner radius to 11
        textField.cornerRadius = 11

        return textField
    }

}
