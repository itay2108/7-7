//
//  CEmbeddedViewController.swift
//  Seven-Seven
//
//  Created by itay gervash on 09/11/2020.
//

import UIKit

class CEmbeddedViewController: UIViewController {
    
    @IBOutlet weak var greenButton: ColorChangerButton!
    @IBOutlet weak var yellowButton: ColorChangerButton!
    @IBOutlet weak var indigoButton: ColorChangerButton!
    
    var currentColorSelection: ColorSelection?
    
    var delegate: ColorChangeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        greenButton.colorID = .green; yellowButton.colorID = .yellow; indigoButton.colorID = .indigo
    }
    
    @IBAction func colorChangerTapped(_ sender: ColorChangerButton) {
        delegate?.colorDidChange(to: sender.colorID)
    }

}

extension CEmbeddedViewController: ColorChangeDelegate {
    func colorDidChange(to color: ColorSelection) {
        currentColorSelection = color
        applyColorChanges(color: color, animated: true, completion: nil)
    }
    
    func applyColorChanges(color: ColorSelection, animated: Bool, duration: Double = 0.4, completion: (() -> Void)?) {
        
        if animated {
            UIView.animate(withDuration: duration) {
                self.view.backgroundColor = color.asUIColor()
            }
        } else {
            self.view.backgroundColor = color.asUIColor()
        }
        
        if completion != nil { completion!() }
    }
    
}
