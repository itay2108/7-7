//
//  ColorSelection.swift
//  Seven-Seven
//
//  Created by itay gervash on 09/11/2020.
//

import UIKit

enum ColorSelection: String {
    case green = "Green"
    case blue = "Blue"
    case red = "Red"
    case yellow = "Yellow"
    case indigo = "Indigo"
    
    func asUIColor() ->  UIColor {
        switch self {
        case .green:
            return .systemGreen
        case .blue:
            return .systemBlue
        case .red:
            return .systemRed
        case .yellow:
            return .systemYellow
        case .indigo:
            return .systemIndigo
        }
    }
}
