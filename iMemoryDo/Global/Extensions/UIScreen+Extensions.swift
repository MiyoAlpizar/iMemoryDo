//
//  UIScreen+Extensions.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 10/11/20.
//

import SwiftUI

extension UIApplication {
    var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var heigth: CGFloat {
        return UIScreen.main.bounds.height
    }
}
