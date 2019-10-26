//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Đặng Quang Hưng on 10/21/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var answeredQuestions = 0
    @State private var correctQuestions = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                ForEach(0..<3) { number in
                    FlagImage(country: self.countries[number]) {
                        self.flagTapped(number)
                    }
                }
                Text("Your score: \(score)")
                    .foregroundColor(.white)
                Text("Correct: \(correctQuestions)/\(answeredQuestions)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func flagTapped(_ number: Int) {
        answeredQuestions += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            correctQuestions += 1
            score += 2
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
