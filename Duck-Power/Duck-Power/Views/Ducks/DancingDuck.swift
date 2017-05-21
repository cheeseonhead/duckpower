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
        series = [#imageLiteral(resourceName: "duck1"), #imageLiteral(resourceName: "duck2"), #imageLiteral(resourceName: "duck3")]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
