//
//  ColorChangeDelegate.swift
//  Seven-Seven
//
//  Created by itay gervash on 09/11/2020.
//

import Foundation

protocol ColorChangeDelegate {
    
    func colorDidChange(to color: ColorSelection)
    func applyColorChanges(color: ColorSelection, animated: Bool, duration: Double, completion: (() -> Void)?)
}
