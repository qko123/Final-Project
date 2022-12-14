//
//  Calculate.swift
//  Final Project
//
//  Created by Quinn Kozak on 11/28/22.
//

import SwiftUI

struct Calculate: View {
    @State private var showingAlert = false
    @State private var imageName = ""
    @State private var percentage = 0.0
    @State private var selectedKills = "0"
    let Kills = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    @State private var selectedErrors = "0"
    let Errors = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    @State private var selectedAttempts = "0"
    let Attempts = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    var body: some View {
        
        VStack {
            Text("Calculate Hitting %").bold().font(.title).padding()
            Text("Number of Attempts").bold().frame(width:200, height: 100)
            Picker("Attempts", selection: $selectedAttempts) {
                ForEach(Attempts, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Text("Number of Kills").bold().frame(width:200, height: 100)
            Picker("Kills", selection: $selectedKills) {
                ForEach(Kills, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Text("Number of Errors").bold().frame(width:200, height: 100)
            Picker("Errors", selection: $selectedErrors) {
                ForEach(Errors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Button("Calculate") {
                if let kills = Double(selectedKills) {
                    if let errors = Double(selectedErrors) {
                        if let attempts = Double(selectedAttempts) {
                            if kills + errors <= attempts {
                                percentage = ((kills - errors) / attempts) * 100
                            }
                            else {
                                showingAlert = true
                            }
                                
                        }
                    }
                }
                if percentage <= 5 {
                    imageName = "trash"
                }
                if percentage > 5, percentage < 40 {
                    imageName = ""
                }
                if percentage >= 40 {
                    imageName = "WOW!"
                }
            }
            .buttonStyle(CustomButtonStyle())
            .alert("This is impossible. You cannot have more kills and errors than attempts.", isPresented: $showingAlert) {
                Button("Ok", role: .cancel) {}
                
            }
            Text("You have a \(percentage, specifier: "%.2f")% hitting percentage")
            Image(imageName).resizable().frame(width: 150,height: 150)
        }
    }
}

struct Calculate_Previews: PreviewProvider {
    static var previews: some View {
        Calculate()
    }
}
