//
//  ContentView.swift
//  Final Project
//
//  Created by Quinn Kozak on 11/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                VStack {
                    Text("VB Hitting % Calculator").bold().font(.title).shadow(radius: 1)
                        .padding()
                    Image("player")
                        .resizable().frame(width: 350, height: 350)
                NavigationLink("What is A Hitting Percentage?", destination: InstructionsView())
                        .bold()
                        .padding()
                    Text("-------------------------------------")
                    NavigationLink("Calculate Hitting Percentage", destination: Calculate())
                            .bold()
                            .padding()
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct InstructionsView: View {
    var body: some View {
        VStack {
            Text("What is A Hitting Percentage?")
                .font(.title).bold()
                .padding()
            Text("Hitting percentage in volleyball is the percent of your hitting attempts that get you the point.")
                .padding()
            Text("It is calculated by taking your kills, or the amount of spikes that won your team the point, subtracting the errors made when trying to get a kill, and dividing that number by your total hitting attempts")
                .padding()
            Image("hits")
                .resizable()
                .frame(width:300, height: 300, alignment: .center).padding()
            
        }
        Spacer()
    }
}
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100)
            .font(Font.custom("Marker Felt", size: 24))
            .padding()
            .background(.black).opacity(configuration.isPressed ? 0.0 : 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
