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
                        // Button to increase the score and show Pop image
                        Button(action: {
                            currentDapScore += 1
                            
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
                
                // Display the current Dap score
                Text("Current Dap Score: \(currentDapScore)")
                    .font(.custom("Futura-Bold", size: 24))
                    .foregroundColor(.black)
                    .padding(.top, 20)
            }
            .padding()
            
            
        }
    }
}

#Preview {
    ContentView()
}
