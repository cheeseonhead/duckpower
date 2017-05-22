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
    override func viewWillAppear(_ animated: Bool)
    {
        view.alpha = 0.5
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        view.alpha = 0.5
    }
}
