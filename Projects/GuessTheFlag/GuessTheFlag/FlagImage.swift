//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Đặng Quang Hưng on 10/26/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

struct FlagImage: View {

    let country: String
    let action: () -> Void

    var body: some View {
        return Button(action: action) {
            Image(country)
                .renderingMode(.original)
        }
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(country: "US") {
            
        }
    }
}
