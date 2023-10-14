//
//  TrafficSignalSectionView.swift
//  TrafficLight
//
//  Created by Kima on 12.10.2023.
//

import SwiftUI

struct TrafficSectionView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color.opacity(opacity))
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(.primary, lineWidth: 4))
    }
}

struct TrafficSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficSectionView(color: .red, opacity: 0.3)
    }
}
