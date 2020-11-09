import UIKit

class BSelectionViewController: UIViewController {
    
    @IBOutlet weak var selectionLabel: UILabel!
    
    @IBOutlet weak var greenButton: ColorChangerButton!
    @IBOutlet weak var blueButton: ColorChangerButton!
    @IBOutlet weak var redButton: ColorChangerButton!
    
    var currentColorSelection: ColorSelection = .green
    
    var delegate: ColorChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenButton.colorID = .green; blueButton.colorID = .blue; redButton.colorID = .red
        
        applyColorChanges(color: currentColorSelection, animated: false, completion: nil)
    }
    
    func applyColorChanges(color: ColorSelection, animated: Bool, completion: (() -> Void)?) {
        selectionLabel.text = "\(color.rawValue) is selected"

        
        if animated {
            UIView.animate(withDuration: 0.4) {
                self.view.backgroundColor = color.asUIColor()
            }
        } else {
            self.view.backgroundColor = color.asUIColor()
        }
        
        if completion != nil { completion!() }
        
    }
    
    @IBAction func colorChangerTapped(_ sender: ColorChangerButton) {
        currentColorSelection = sender.colorID
        applyColorChanges(color: currentColorSelection, animated: true) {
            self.delegate?.colorDidChange(to: self.currentColorSelection)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.66) {
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        
    }
    
    
}
