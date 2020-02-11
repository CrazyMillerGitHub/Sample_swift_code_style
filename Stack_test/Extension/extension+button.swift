//
//  extension+button.swift
//  Stack_test
//
//  Created by Михаил Борисов on 11.02.2020.
//  Copyright © 2020 Mikhail Borisov. All rights reserved.
//

import UIKit
import AuthenticationServices

extension UIButton {

    static var signIn: UIButton {
        // inizialization button
        let button = UIButton()
        // set title
        button.setTitle("_log_in".localized, for: .normal)
        // set clear background color
        button.backgroundColor = .clear
        button.tintColor = .white
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.white.cgColor
        // set title font to SF semibold size - 17.0
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        // disable auto constraint
        button.translatesAutoresizingMaskIntoConstraints = false
        // hide button
        button.alpha = 0
        button.isHidden = true
        // set corner radius
        button.layer.cornerRadius = 15
        // set clips to bound to true
        button.clipsToBounds = true
        // add target to signIn Button
        return button
    }
    
    static var emailSignIn: UIButton {
        // inizialization button
        let button = UIButton()
        // set background color
        button.backgroundColor = UIColor(red:1.00, green:0.18, blue:0.33, alpha:1.0)
        // set title to localized
        button.setTitle("_sign_in_with_email_and_password".localized, for: .normal)
        // set tint color to white
        button.tintColor = .white
        // set font to SF semibold size - 18
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        // disable auto constraint
        button.translatesAutoresizingMaskIntoConstraints = false
        // set corner radius to 5 pt
        button.layer.cornerRadius = 5
        // set clips to bounds to true
        button.clipsToBounds = true
        return button
    }
    
    static var appleSignIn: ASAuthorizationAppleIDButton {
        // inzialize sign in button
        let appleSignInButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        return appleSignInButton
    }
}
