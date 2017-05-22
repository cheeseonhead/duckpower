//
//  Overlay.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class OverlayViewController: UIViewController
{
    override func viewDidAppear(_ animated: Bool)
    {
        view.alpha = 0
        view.isHidden = false
        UIView.animate(withDuration: 0.1) { 
            self.view.alpha = 0.5
        }
    }
}
