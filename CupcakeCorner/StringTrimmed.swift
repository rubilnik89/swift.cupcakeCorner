//
//  StringTrimmed.swift
//  CupcakeCorner
//
//  Created by Roman Zherebko on 16.06.2022.
//

import Foundation

extension String {
    
    func trimmed() -> Self {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
