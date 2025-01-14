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
    
    func getChar(_ index:Int) -> Character{
    
    let i = self.index(self.startIndex, offsetBy: index)
    
    return self[i]
    
    }
    func getString(_ start:Int, _ end:Int) -> String{        
        let start = self.index(self.startIndex, offsetBy: start)
        let end = self.index(self.startIndex, offsetBy: end)
    
        return String(self[start..<end])
    }

}
