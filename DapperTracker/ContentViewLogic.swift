//
//  ContentViewLogic.swift
//  DapperTracker
//
//  Created by Jackson Evarts on 1/1/25.
//
import SwiftUI

extension Color {
    static let primaryGold = Color(hex: "#DAA520") // Goldenrod
    static let softGold = Color(hex: "#FFD700")    // Gold
    static let mutedGold = Color(hex: "#B8860B")   // Dark Goldenrod

    static let lightGrey = Color(hex: "#F5F5F5")   // White Smoke
    static let neutralGrey = Color(hex: "#D3D3D3") // Light Grey
    static let darkGrey = Color(hex: "#696969")    // Dim Grey
    static let charcoalGrey = Color(hex: "#333333") // Dark Grey

    // Helper initializer for HEX values
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}


struct DapSliderView: View {
    
    @Binding var goodDaps: Int
    @Binding var badDaps: Int
    
    // Computed property to determine slider value
    private var sliderValue: Double {
        let totalDaps = goodDaps + badDaps
        if goodDaps == badDaps{ return 0 }
        
        // Calculate slider position as a ratio between -1 (all bad) to 1 (all good)
        return Double(goodDaps - badDaps) / Double(totalDaps)
    }
    
    var body: some View {
        VStack {
            // Slider Track
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 8)
                    .cornerRadius(4)
                GeometryReader { geometry in
                    let intialPosition = geometry.size.width / 2
                    
                    // Slider Thumb
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // TODO: Make this dynamic
                        .animation(.easeInOut(duration: 0.3), value: sliderValue)
                }
                
            }
        }
    }
}

