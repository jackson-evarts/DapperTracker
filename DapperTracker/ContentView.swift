//
//  ContentView.swift
//  DapperTracker
//
//  Created by Jackson Evarts on 1/1/25.
//

import SwiftUI

struct ContentView: View {
    // TODO: Make a variable named CurrentDapScore that will save an integer in the app for the duration of the day
    
    var body: some View {
        ZStack {
            // Background color filling the entire screen
            Color.lightGrey // Background color
                .edgesIgnoringSafeArea(.all) // Fill entire background
            
            VStack {
                Text("Dap Tracker")
                    .font(.custom("Futura-Bold", size: 40))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center) // Center-align text
                    .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                
                HStack{
                    

                    VStack {
                        
                        // TODO: Change this into a button that increases the crisp dap counter, and changes the current dap score.
                        Image("BadDap")
                            .resizable() // Allows resizing of the image
                            .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                            .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                            .frame(maxWidth: .infinity) // Ensures the image is centered horizontally
                        Text("Miss")
                            .font(.custom("Futura-Bold", size: 20))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center) // Center-align text
                            .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                    }
                    
                    
                    VStack {
                        // TODO: Display the image named Pop when the button is pressed

                        Image("GoodDap")
                            .resizable() // Allows resizing of the image
                            .aspectRatio(contentMode: .fit) // Maintains the aspect ratio while fitting within the bounds
                            .frame(maxWidth: 200, maxHeight: 200) // Sets a reasonable size limit for the image
                            .frame(maxWidth: .infinity) // Ensures the image is centered horizontally
                        
                        Text("Crisp Dap")
                            .font(.custom("Futura-Bold", size: 20))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center) // Center-align text
                            .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                    }
                } // End Central HStack
                
                // TODO: Make a slider that starts in the middle of the
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
