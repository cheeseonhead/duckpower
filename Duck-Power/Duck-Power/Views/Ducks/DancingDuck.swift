//
// Created by Jeffrey Wu on 2017-05-21.
// Copyright (c) 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class DancingDuck: AnimatedImageView
{
    override init(frame: CGRect)
    {
        super .init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad()
    {
        series = [#imageLiteral(resourceName: "duck1"), #imageLiteral(resourceName: "duck2"), #imageLiteral(resourceName: "duck3")]
        autoReverse = true
        animationDuration = 1
    }
}
