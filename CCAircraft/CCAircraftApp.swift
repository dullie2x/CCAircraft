//
//  CCAircraftApp.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

@main
struct CCAircraftApp: App {
    @State private var showSplash = true // Add a boolean state variable
    var body: some Scene {
        WindowGroup {
            // Use a conditional to show either the splash screen or the main app content
            if showSplash {
                SplashPage()
                    .onAppear {
                        // Automatically dismiss the splash screen after 2 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                OpenView()
            }
        }
    }
}
