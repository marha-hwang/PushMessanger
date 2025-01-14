//
//  String+localized.swift
//  PushMessenger
//
//  Created by h2o on 2025/01/14.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: self, comment: "")
    }
}
