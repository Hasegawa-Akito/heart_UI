//
//  Drop.swift
//  heart_UI
//
//  Created by Hasegawa Akito on 2022/07/17.
//

import UIKit
import SwiftUI

struct Drop: Identifiable {
    let id = UUID()
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    var size: CGFloat = 0
    var color: Color = .blue
    var opacity: Double = 1
    var count: Int = 0
    var countMax: Int = 0
    
    init() {
    }
    
    init(_ drop: Drop) {
        x = drop.x
        y = drop.y
        size = drop.size
        opacity = drop.opacity
        color = drop.color
        count = drop.count
        countMax = drop.countMax
    }
}

