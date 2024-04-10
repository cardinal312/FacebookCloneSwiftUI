//
//  Extension.swift
//  FacebookClone
//
//  Created by Macbook on 10/4/24.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
