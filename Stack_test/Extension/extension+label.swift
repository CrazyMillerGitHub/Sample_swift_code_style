//
//  extension+label.swift
//  Stack_test
//
//  Created by Михаил Борисов on 09.02.2020.
//  Copyright © 2020 Mikhail Borisov. All rights reserved.
//

import UIKit

extension UILabel {

    // MARK: Splash Label
    static var splash: UILabel {
        // Inizialize label with size: height - 60, width - width of screen
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        // Set default text to "Nice Day"
        label.text = "Nice Day"
        // Set aligment to center
        label.textAlignment = .center
        // Use the huge font
        label.font = UIFont.systemFont(ofSize: 56, weight: .heavy)
        // Set text color to sunrize color
        label.textColor = UIColor(red: 1.00, green: 0.18, blue: 0.33, alpha: 1.0)
        label.alpha = 0
        return label
    }

    // MARK: forgotPassword Label
    static var forgotPassword: UILabel {
        // Inizialize label
        let label = UILabel()
        // set label text to localized
        label.text = "_forgotPassword".localized
        // set aligment to right
        label.textAlignment = .right
        // font to semibold SF size 16 pt
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        // set label color
        label.textColor = .white
        // set label as user iteraction
        label.isUserInteractionEnabled = true
        return label
    }

    // MARK: title label
    static var title: UILabel {
        // inizialize label
        let label = UILabel()
        // disable auto-constraint
        label.translatesAutoresizingMaskIntoConstraints = false
        // set text
        label.text = "Nice Day"
        // text color
        label.textColor = .black
        // set alignment to left
        label.textAlignment = .left
        // set font
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }
    
    // MARK: description label
    static var description: UILabel {
        // inizialize label
        let label = UILabel()
        // disable auto-constraint
        label.translatesAutoresizingMaskIntoConstraints = false
        // text color
        label.textColor = .black
        // set text
        label.text = "Be better every day!"
        // set alignment to left
        label.textAlignment = .left
        // set font
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }
    
}
