//
//  Calculate.swift
//  Final Project
//
//  Created by Quinn Kozak on 11/28/22.
//

import SwiftUI

struct Calculate: View {
    @State private var percentage = 0.0
    @State private var selectedKills = "0"
    let Kills = ["0","1","2","3","4","5","6","7","8","9","10"]
    @State private var selectedErrors = "0"
    let Errors = ["0","1","2","3","4","5","6","7","8","9","10"]
    @State private var selectedAttempts = "0"
    let Attempts = ["0","1","2","3","4","5","6","7","8","9","10"]
    var body: some View {
        VStack {
            Text("Calculate Hitting %").bold().font(.title).padding()
            Text("Number of Kills").bold().frame(width:200, height: 100)
                Picker("Kills", selection: $selectedKills) {
                    ForEach(Kills, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
            Text("Number of Errors").bold().frame(width:200, height: 100)
                Picker("Errors", selection: $selectedErrors) {
                    ForEach(Errors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
            Text("Number of Attempts").bold().frame(width:200, height: 100)
                Picker("Attempts", selection: $selectedAttempts) {
                    ForEach(Attempts, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu).padding()
            Button("Calculate") {
                if let kills = Double(selectedKills) {
                    if let errors = Double(selectedErrors) {
                        if let attempts = Double(selectedAttempts) {
                            percentage = ((kills - errors) / attempts) * 100
                        }
                    }
                }
            }
            Text("You have a \(percentage, specifier: "%.2f")% hitting percentage")
        }
    }
}

struct Calculate_Previews: PreviewProvider {
    static var previews: some View {
        Calculate()
    }
}
