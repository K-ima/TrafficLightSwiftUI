//
//  ContentView.swift
//  TrafficLight
//
//  Created by Kima on 12.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var nameButton = "START"
    @State var currentLight = CurrentLight.red
    @State var redLight = lightSection.off.rawValue
    @State var yellowLight = lightSection.off.rawValue
    @State var greenLight = lightSection.off.rawValue
    
    var body: some View {
        VStack {
            TrafficSectionView(color: .red.opacity(redLight), colorOverlay: selectLineColor())
            TrafficSectionView(color: .yellow.opacity(yellowLight), colorOverlay: selectLineColor())
            TrafficSectionView(color: .green.opacity(greenLight), colorOverlay: selectLineColor())
        }
        .padding()
        
        Spacer()
        
        Button(action: { startButtonPressed() }) {
            Text(nameButton)
                .font(.largeTitle)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(selectLineColor(), lineWidth: 4))
        .padding(.bottom, 40)
        
    }
    
    func selectLineColor() -> Color {
        if colorScheme == .dark {
            return Color.white
        } else {
            return Color.black
        }
    }
    
    func startButtonPressed() {
        if nameButton == "START" {
            nameButton = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenLight = lightSection.off.rawValue
            redLight = lightSection.on.rawValue
            currentLight = .yellow
        case .yellow:
            redLight = lightSection.off.rawValue
            yellowLight = lightSection.on.rawValue
            currentLight = .green
        case .green:
            yellowLight = lightSection.off.rawValue
            greenLight = lightSection.on.rawValue
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

