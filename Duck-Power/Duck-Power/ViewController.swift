//
//  ViewController.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let maxLength = 5
    
    @IBOutlet var duckViews: [AnimatedImageView]!
    @IBOutlet weak var duckPowerNumberLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var hpField: UITextField!
    
    weak var overlayViewController: OverlayViewController?
    
    fileprivate let duckStore = DuckPowerStore()
    var selectHPField = true
    
    override func viewDidLoad()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for duckView in duckViews
        {
            duckView.animate()
        }
        if selectHPField {
            hpField.becomeFirstResponder()
            selectHPField = false
        }
    }
    
    @IBAction func numberChanged(_ sender: UITextField)
    {
        updateDuckPower(from: sender)
    }
    
    @IBAction func editingEnded(_ sender: UITextField)
    {
        if sender.text?.characters.count == 0 {
            sender.text = "0"
            
            updateDuckPower(from: sender)
        }
    }
    
    @IBAction func questionButtonTapped(_ sender: Any)
    {
        showOverlay()
    }
}

// MARK: Calculation
extension ViewController
{
    func updateDuckPower(from textfield: UITextField)
    {
        guard let text = textfield.text,
            let horsePower = Double(text) else {
                return
        }
        
        var calculation = horsePower * duckStore.getDuckPower()
        calculation.round(.toNearestOrAwayFromZero)
        duckPowerNumberLabel.text = "\(Int(calculation))"
    }
}

// MARK: Overlay View Methods
extension ViewController
{
    func showOverlay()
    {
        dismissKeyboard()
        
        overlayView.alpha = 0
        overlayView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1
        }
    }
    
    func hideOverlay()
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.overlayView.alpha = 0
        }) { (finished) in
            self.overlayView.isHidden = true
        }
    }
}

extension ViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.typingAttributes = [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        
        let currentString: NSString = textField.text! as NSString
        let newString: String = currentString.replacingCharacters(in: range, with: string)
        return newString.characters.count <= maxLength
    }
}

extension ViewController: OverlayViewControllerDelegate
{
    func closeOverlay() {
        hideOverlay()
    }
}

extension ViewController
{
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "Overlay" {
            overlayViewController = segue.destination as? OverlayViewController
            overlayViewController?.delegate = self
        }
    }
}
