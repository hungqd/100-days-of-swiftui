//
//  CornerRotateModifier.swift
//  Animations
//
//  Created by Đặng Quang Hưng on 11/6/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {

    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}
