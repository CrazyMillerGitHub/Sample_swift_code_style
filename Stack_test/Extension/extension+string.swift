//
//  extension+string.swift
//  Stack_test
//
//  Created by Михаил Борисов on 10.02.2020.
//  Copyright © 2020 Mikhail Borisov. All rights reserved.
//

import Foundation

extension String {

    // create localized extension that will help to improve code style
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
