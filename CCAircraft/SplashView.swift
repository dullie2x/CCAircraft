//
//  SplashView.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/3/24.
//

import SwiftUI

struct SplashPage: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            Image("AppLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .scaleEffect(logoScale)
                .opacity(logoOpacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        logoScale = 1.0
                        logoOpacity = 1.0
                    }
                }
        }
    }
}

// Preview
struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
