//
//  AnimationImage.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit
import Foundation

class AnimatedImageView: UIImageView
{
    var autoReverse = false
    var series: [UIImage] = []
    
    override init(frame: CGRect)
    {
        super .init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func animate()
    {
        startAnimating()
    }
    
    override func startAnimating()
    {
        if(autoReverse) {
            animationImages = series + series[1...(series.count - 2)].reversed()
        }
        else {
            animationImages = series
        }
        
        super.startAnimating()
    }
    
    func didLoad()
    {
    }
}
