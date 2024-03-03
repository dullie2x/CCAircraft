//
//  ContentView.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

struct OpenView: View {
    @State private var currentNumber = 18 // Starting value
    
    @State private var isBugBlueClicked = false
    @State private var isBugGrBlueClicked = false
    @State private var isBugGrnClicked = false
    @State private var isBugYBlueClicked = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("bg3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                    let droneSize = CGFloat(40 + (currentNumber - 18) * 15)
                    
                    droneButton("Bug-Blue", isClicked: $isBugBlueClicked, geometry: geometry, x: 0.29, y: 0.59, size: droneSize)
                    droneButton("Bug-GrBlue", isClicked: $isBugGrBlueClicked, geometry: geometry, x: 0.45, y: 0.4, size: droneSize)
                    droneButton("Bug-Grn", isClicked: $isBugGrnClicked, geometry: geometry, x: 0.6, y: 0.5, size: droneSize)
                    droneButton("Bug-YBlue", isClicked: $isBugYBlueClicked, geometry: geometry, x: 0.7, y: 0.3, size: droneSize)
                    
                    enemyImage("Enemy", geometry: geometry, x: 0.4, y: 0.5, size: droneSize)
                    enemyImage("Enemy", geometry: geometry, x: 0.5, y: 0.7, size: droneSize)
                    enemyImage("Enemy", geometry: geometry, x: 0.25, y: 0.35, size: droneSize)
                    
                    scaleButton("Up", action: {
                        if currentNumber < 22 { currentNumber += 1 }
                    }, geometry: geometry, x: 0.1, y: 0.25)
                    
                    scaleButton("Down", action: {
                        if currentNumber > 18 { currentNumber -= 1 }
                    }, geometry: geometry, x: 0.1, y: 0.4)
                    
                    Text("\(currentNumber)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.2, green: 0.65, blue: 1.0))
                        .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.325)
                    
                    Button(action: {
                        // Trigger navigation
                    }) {
                        NavigationLink(destination: Execution(isBugBlueSelected: isBugBlueClicked,
                                                              isBugGrBlueSelected: isBugGrBlueClicked,
                                                              isBugGrnSelected: isBugGrnClicked,
                                                              isBugYBlueSelected: isBugYBlueClicked)) {
                            Image("ME")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                        }
                    }
                    .position(x: geometry.size.width * 0.7, y: geometry.size.height - 80)

                    Button(action: {
                        // Action for MP button
                    }) {
                        Image("MP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    }
                    .position(x: geometry.size.width * 0.5 - 60, y: geometry.size.height - 80)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    @ViewBuilder
    private func droneButton(_ imageName: String, isClicked: Binding<Bool>, geometry: GeometryProxy, x: CGFloat, y: CGFloat, size: CGFloat) -> some View {
        Button(action: {
            isClicked.wrappedValue.toggle()
        }) {
            Image(isClicked.wrappedValue ? imageName + "C" : imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
        }
        .position(x: geometry.size.width * x, y: geometry.size.height * y)
    }
    
    @ViewBuilder
    private func enemyImage(_ imageName: String, geometry: GeometryProxy, x: CGFloat, y: CGFloat, size: CGFloat) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .position(x: geometry.size.width * x, y: geometry.size.height * y)
    }
    
    @ViewBuilder
    private func scaleButton(_ imageName: String, action: @escaping () -> Void, geometry: GeometryProxy, x: CGFloat, y: CGFloat) -> some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        }
        .position(x: geometry.size.width * x, y: geometry.size.height * y)
    }
}

struct OpenView_Previews: PreviewProvider {
    static var previews: some View {
        OpenView()
    }
}

