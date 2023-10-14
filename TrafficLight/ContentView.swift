//
//  ContentView.swift
//  TrafficLight
//
//  Created by Kima on 12.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var nameButton = "START"
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    @State private var currentLight = CurrentLight.red
    @State private var redLight = 0.3
    @State private var yellowLight = 0.3
    @State private var greenLight = 0.3
    
    var body: some View {
        VStack {
            TrafficSectionView(color: .red, opacity: redLight)
            TrafficSectionView(color: .yellow, opacity: yellowLight)
            TrafficSectionView(color: .green, opacity: greenLight)
        }
        .padding()
        
        Spacer()
        
        Button(action: startButtonPressed) {
            Text(nameButton)
                .font(.largeTitle)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.primary, lineWidth: 4))
        .padding(.bottom, 40)
    }
    
    private func startButtonPressed() {
        if nameButton == "START" {
            nameButton = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenLight = lightOff
            redLight = lightOn
            currentLight = .yellow
        case .yellow:
            redLight = lightOff
            yellowLight = lightOn
            currentLight = .green
        case .green:
            yellowLight = lightOff
            greenLight = lightOn
            currentLight = .red
        }
    }
}

enum lightSection: Double {
    case on = 1
    case off = 0.3
}

enum CurrentLight {
    case red, yellow, green
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

