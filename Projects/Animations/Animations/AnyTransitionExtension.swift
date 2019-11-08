//
//  AnyTransitionExtension.swift
//  Animations
//
//  Created by Đặng Quang Hưng on 11/8/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var pivot : AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
