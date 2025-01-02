//
//  ContentView.swift
//  DapperTracker
//
//  Created by Jackson Evarts on 1/1/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State Variables
    
    @AppStorage("CurrentDapScore") private var currentDapScore: Int = 0
    @AppStorage("GoodDaps") private var goodDaps: Int = 0
    @AppStorage("BadDaps") private var badDaps: Int = 0


    // Timer to reset the dap score at 2 AM
    @State private var timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Background color filling the entire screen
            Color.lightGrey
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dap Tracker")
                    .font(.custom("Futura-Bold", size: 40))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                    VStack {
                        // Button to decrease the score
                        Button(action: {
                            currentDapScore -= 1
                            badDaps -= 1
                        }) {
                            Image("BadDap")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 200)
                                .frame(maxWidth: .infinity)
                        }
                        Text("Miss")
                            .font(.custom("Futura-Bold", size: 20))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    VStack {
                        // Button to increase the score
                        Button(action: {
                            currentDapScore += 1
                            goodDaps += 1
                            
                        }) {
                            Image("GoodDap")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 200)
                                .frame(maxWidth: .infinity)
                        }
                        Text("Crisp Dap")
                            .font(.custom("Futura-Bold", size: 20))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .padding()
                
                
                
                DapSliderView(goodDaps: $goodDaps, badDaps: $badDaps)
                    .previewLayout(.sizeThatFits)
                    .padding()

                // Display the current Dap score
                Text("Today's Dap Score: \(currentDapScore)")
                    .font(.custom("Futura-Bold", size: 24))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
            }
            .padding()
        }
        .onReceive(timer) { _ in
            resetScoreAt2AM()
        }
    }
    
    // MARK: - Helper Functions
    
    private func resetScoreAt2AM() {
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: Date())
        let currentMinute = calendar.component(.minute, from: Date())
        
        if currentHour == 2 && currentMinute == 0 {
            currentDapScore = 0
        }
    }
}

#Preview {
    ContentView()
}
