//
//  Overlay.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class OverlayViewController: UIViewController
{
    @IBOutlet weak var contentHolder: UIView!
    
    override func viewDidLoad()
    {
        let definitionView = DefinitionView.instanceFromNib()
        
        contentHolder.addSubview(definitionView)
        
        definitionView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentHolder)
        }
    }
}
