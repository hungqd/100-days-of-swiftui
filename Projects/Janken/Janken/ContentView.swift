//
//  ContentView.swift
//  Janken
//
//  Created by Đặng Quang Hưng on 10/29/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    private let icons = ["\u{270A}", "\u{270B}", "\u{270C}"]

    @State private var appSelection = Int.random(in: 0..<3)
    @State private var userSelection = -1
    @State private var showResult = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Select your move")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    HStack {
                        ForEach(0..<icons.count) { selection in
                            Button(action: {
                                self.userSelection = selection
                                self.showResult = true
                            }) {
                                Text(self.icons[selection])
                                    .font(.system(size: 60))
                            }
                        }
                    }
                    Spacer()
                }.navigationBarTitle(Text("Janken"), displayMode: .inline)
                    .alert(isPresented: $showResult) { () -> Alert in
                        var message = ""
                        if userSelection == appSelection {
                            message = "Draw!"
                        } else if (userSelection == 0 && appSelection == 2)
                            || (userSelection == 1 && appSelection == 0)
                            || (userSelection == 2 && appSelection == 1) {
                            message = "You won! Keep it up"
                        } else {
                            message = "You lose! Good luck"
                        }
                        return Alert(title: Text(""), message: Text(message), dismissButton: .default(Text("OK"), action: {
                            self.appSelection = Int.random(in: 0..<3)
                        }))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
