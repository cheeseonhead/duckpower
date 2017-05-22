//
//  ViewController.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var duckViews: [AnimatedImageView]!
    @IBOutlet weak var duckPowerNumberLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
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
    }
    
    @IBAction func numberChanged(_ sender: UITextField)
    {
        guard let text = sender.text,
        let horsePower = Int(text) else {
            return
        }
        
        duckPowerNumberLabel.text = "\(horsePower * 40)"
    }
    
    @IBAction func questionButtonTapped(_ sender: Any)
    {
        overlayView.alpha = 0
        overlayView.isHidden = false
        UIView.animate(withDuration: 0.3) { 
            self.overlayView.alpha = 1
        }
    }
}

extension ViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 5
        let currentString: NSString = textField.text! as NSString
        let newString: String = currentString.replacingCharacters(in: range, with: string)
        return newString.characters.count <= maxLength
    }
}

extension ViewController
{
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
