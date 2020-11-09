//
//  CViewController.swift
//  Seven-Seven
//
//  Created by itay gervash on 09/11/2020.
//

import UIKit

class CViewController: UIViewController {
    
    
    @IBOutlet weak var greenButton: ColorChangerButton!
    @IBOutlet weak var yellowButton: ColorChangerButton!
    @IBOutlet weak var indigoButton: ColorChangerButton!
    
    var currentColorSelection: ColorSelection = .green
    
    var delegate: (CEmbeddedViewController & ColorChangeDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenButton.colorID = .green; yellowButton.colorID = .yellow; indigoButton.colorID = .indigo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CEmbeddedViewController, segue.identifier == "embeddedVC" {
            delegate = vc
            vc.delegate = self
        }
    }
    
    @IBAction func colorChangerTapped(_ sender: ColorChangerButton) {
        delegate?.colorDidChange(to: sender.colorID)
    }

}

extension CViewController: ColorChangeDelegate {
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
