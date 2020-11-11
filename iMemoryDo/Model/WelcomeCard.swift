//
//  WelcomeCard.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 10/11/20.
//

import Foundation
import SwiftUI

struct WelcomeCard: Identifiable {
    var id: Int
    var title: String
    var description: String
    var img: String
    var show: Bool
    var color: Color
}


extension WelcomeCard {
    static func GetCards() -> [WelcomeCard]{
        let data = [
            WelcomeCard(id: 0, title: "t1".asLocalized(), description: "d1".asLocalized(), img: "Brain1", show: false, color: Color.Accent),
            
            WelcomeCard(id: 1, title: "t2".asLocalized(), description: "d2".asLocalized(), img: "Brain2", show: false, color: Color.Accent2),
            
            WelcomeCard(id: 2, title: "t3".asLocalized(), description: "d3".asLocalized(), img: "Brain3", show: false, color: Color.Accent3),
            
            WelcomeCard(id: 3, title: "t4".asLocalized(), description: "d4".asLocalized(), img: "Brain4", show: false, color: Color.Accent4),
            
            WelcomeCard(id: 4, title: "t5".asLocalized(), description: "d5".asLocalized(), img: "Brain5", show: false, color: Color.Accent5),
           
            
        ]
        return data
    }
}
