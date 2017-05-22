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
    
    let contentViews = [DefinitionView.instanceFromNib(), EvolutionView.instanceFromNib(), DisclaimerView.instanceFromNib()]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setContent(to: contentViews[0])
    }
}

// MARK: ContentHolder Helpers
extension OverlayViewController
{
    func previousContent()
    {
        guard let curIndex = getCurrentIndex(),
            curIndex > 0 else {
                return
        }
        
        setContent(to: contentViews[curIndex-1])
    }
    
    func nextContent()
    {
        guard let curIndex = getCurrentIndex(),
            curIndex < contentViews.count - 2 else {
                return
        }
        
        setContent(to: contentViews[curIndex+1])
    }
    
    
    func setContent(to view:UIView)
    {
        contentHolder.removeAllSubviews()
        contentHolder.addSubview(view)
        
        view.snp.makeConstraints { (make) in
            make.edges.equalTo(contentHolder)
        }
    }
    
    func getCurrentIndex() -> Int?
    {
        return contentViews.index(of: contentHolder.subviews[0])
    }
}

extension UIView
{
    func removeAllSubviews()
    {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
