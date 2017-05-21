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
    
    override func viewDidAppear(_ animated: Bool) {
        for duckView in duckViews
        {
            duckView.animate()
        }
    }
}

