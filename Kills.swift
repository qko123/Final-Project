//
//  Calculate.swift
//  Final Project
//
//  Created by Quinn Kozak on 11/28/22.
//

import SwiftUI

struct Calculate: View {
    @State private var killsTextField = ""
    @State private var errorsTextField = ""
    @State private var attemptsTextField = ""
    @State private var kills = 0.0
    @State private var errors = 0.0
    @State private var attempts = 0.0
    @State private var percentage = 0.0
    var body: some View {
        VStack {
            Text("Calculate Hitting %").bold().font(.title).padding()
            
                TextField("Number of Kills", text: $killsTextField).padding().multilineTextAlignment(.center)
                TextField("Number of Errors", text: $errorsTextField).padding().multilineTextAlignment(.center)
            
            TextField("Number of Attempts", text: $attemptsTextField).padding()
                .multilineTextAlignment(.center)
            Button("Calculate") {
                if let kills = Double(killsTextField) {
                    if let errors = Double(errorsTextField) {
                        if let attempts = Double(attemptsTextField) {
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
