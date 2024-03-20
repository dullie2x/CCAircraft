//
//  Lag.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

struct Lag: View {
    let rows: Int = 4
    let columns: Int = 3
    
    @State private var isSelected: [[Bool]] = Array(repeating: Array(repeating: false, count: 3), count: 4)
    @EnvironmentObject var navigationController: NavigationController

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("LAG PURSUIT")
                    .font(.largeTitle.bold())
                    .foregroundColor(.green)
                    .padding(.top, 20)
                
                // Grid of buttons
                VStack(spacing: 5) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<columns, id: \.self) { column in
                                Button(action: {
                                    // Reset all selections
                                    for r in 0..<rows {
                                        for c in 0..<columns {
                                            isSelected[r][c] = false
                                        }
                                    }
                                    // Set only this button as selected
                                    isSelected[row][column] = true
                                }) {
                                    imageFor(row: row, column: column)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 120)
                                        .background(isSelected[row][column] ? Color.red.opacity(0.9) : Color.clear)
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(isSelected[row][column] ? Color.red : Color.clear, lineWidth: 10))
                                }
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            
                // Execute button at the bottom right
                Button(action: {
                    // Resetting the selections
                    for row in 0..<rows {
                        for column in 0..<columns {
                            isSelected[row][column] = false
                        }
                    }
                    
                    // Use the navigationController to reset the app to the initial state
                    withAnimation {
                        navigationController.showSplash = true
                    }
                }) {
                    Image("Execute")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                .position(x: geometry.size.width - geometry.safeAreaInsets.trailing - 90, y: geometry.size.height - geometry.safeAreaInsets.bottom - 25)

            }
        }
    }
    
    func imageFor(row: Int, column: Int) -> Image {
        if row == 0 && column < 3 {
            // Handling specific images for the first row
            switch column {
            case 0: return Image("Cold")
            case 1: return Image("Commit")
            case 2: return Image("Crank")
            default: return Image("Grn-Sq") // Fallback, not expected to be used
            }
        } else if row == 1 && column < 3 {
            // "Eng-Skt" on the second row of the first column
            switch column {
            case 0: return Image("Shoot")
            case 1: return Image("Out")
            case 2: return Image("Sprint")
            default: return Image("Grn-Sq") // Fallback, not expected to be used
            }
        } else if row == 2 && column == 0 {
            return Image("Target") // Fallback, not expected to be used
        } else {
            // Default blue square for other positions
            return Image("Grn-Sq")
        }
    }
}

#Preview {
    Lag()
}
