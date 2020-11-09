//
//  BViewController.swift
//  Seven-Seven
//
//  Created by itay gervash on 09/11/2020.
//

import UIKit

class BViewController: UIViewController {
    
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var changeButton: CRButton!
    
    var currentColorSelection: ColorSelection = .green
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BSelectionViewController, segue.identifier == "selection" {
            vc.delegate = self
            vc.currentColorSelection = self.currentColorSelection
        }
    }
    
    @IBAction func changeSelectionTapped(_ sender: Any) {
        performSegue(withIdentifier: "selection", sender: self)
    }

}

extension BViewController: ColorChangeDelegate {
    
    func colorDidChange(to color: ColorSelection) {
        currentColorSelection = color
        applyColorChanges(color: currentColorSelection, animated: true, completion: nil)
    }
    
    func applyColorChanges(color: ColorSelection, animated: Bool, duration: Double = 0.4, completion: (() -> Void)?) {
        selectionLabel.text = "\(color.rawValue) is selected"
        
        
        if animated {
            UIView.animate(withDuration: duration ) {
                self.view.backgroundColor = color.asUIColor()
            }
        } else {
            self.view.backgroundColor = color.asUIColor()
        }
        
        if completion != nil { completion!() }
    }
}
