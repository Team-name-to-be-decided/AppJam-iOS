//
//  UIScrollView+updateContentSize.swift
//  AppJam
//
//  Created by 겸 on 2022/12/18.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit

extension UIScrollView {
    func updateContentSize() {
            let unionCalculatedTotalRect = recursiveUnionInDepthFor(view: self)
            
            self.contentSize = CGSize(width: self.frame.width, height: unionCalculatedTotalRect.height+50)
        }
        
        private func recursiveUnionInDepthFor(view: UIView) -> CGRect {
            var totalRect: CGRect = .zero
            
            for subView in view.subviews {
                totalRect = totalRect.union(recursiveUnionInDepthFor(view: subView))
            }
            
            return totalRect.union(view.frame)
        }
}
