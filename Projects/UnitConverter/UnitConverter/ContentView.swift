//
//  ContentView.swift
//  UnitConverter
//
//  Created by Đặng Quang Hưng on 10/16/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import SwiftUI

private func value(input: Double) -> Double {
    return input
}

private func celsius2Fahrenheit(input: Double) -> Double {
    return input * 9.0 / 5 + 32
}

private func celsius2Kelvin(input: Double) -> Double {
    return input + 273.15
}

private func fahrenheit2Celsius(input: Double) -> Double {
    return (input - 32) * (5.0 / 9)
}

private func fahrenheit2Kelvin(input: Double) -> Double {
    return (input - 32) * 5.0 / 9 + 273.15
}

private func kelvin2Celsius(input: Double) -> Double {
    return input - 273.15
}

private func kelvin2Fahrenheit(input: Double) -> Double {
    return (input - 273.15) * 9.0 / 5 + 32
}

private let converters: [[(Double) -> Double]] = [
    [value, celsius2Fahrenheit, celsius2Kelvin],
    [fahrenheit2Celsius, value, fahrenheit2Kelvin],
    [kelvin2Celsius, kelvin2Fahrenheit, value ]
]

struct ContentView: View {

    private let units = ["Celsius", "Fahrenheit", "Kelvin"]

    @State private var inputUnitIndex = 0
    @State private var ouputUnitIndex = 1

    @State private var inputValue = "37"

    private func getOutputValue() -> Double {
        guard let input = Double(inputValue) else {
            return 0.0
        }
        return converters[inputUnitIndex][ouputUnitIndex](input)
    }

    var body: some View {
        NavigationView {
            Form {
                HStack {
                    TextField("From", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("°")
                    Picker("", selection: $inputUnitIndex) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                }
                HStack {
                    Text("= \(getOutputValue(), specifier: "%.2f") °")
                    Picker("", selection: $ouputUnitIndex) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                }
            }
            .navigationBarTitle("Temperature Converter", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
