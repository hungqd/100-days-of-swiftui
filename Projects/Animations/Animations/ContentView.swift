//
//  ContentView.swift
//  Animations
//
//  Created by Đặng Quang Hưng on 10/31/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var animationAmount: CGFloat = 1

    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            Spacer()
            Button("Tap me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
