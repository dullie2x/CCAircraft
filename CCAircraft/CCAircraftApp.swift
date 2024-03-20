//
//  CCAircraftApp.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

@main
struct CCAircraftApp: App {
    @StateObject private var navigationController = NavigationController() // Use StateObject for lifecycle management

    var body: some Scene {
        WindowGroup {
            // Use the navigationController to control the view logic
            if navigationController.showSplash {
                SplashPage()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                navigationController.showSplash = false
                            }
                        }
                    }
            } else {
                OpenView()
                    .environmentObject(navigationController) // Pass the navigationController down
            }
        }
    }
}

