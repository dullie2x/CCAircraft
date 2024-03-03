//
//  EgressMain.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

struct EgressMain: View {
    let rows = 4
    let columns = 3
    
    @State private var isSelected: [[Bool]] = Array(repeating: Array(repeating: false, count: 3), count: 4)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("EGRESS")
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
                                        .aspectRatio(1, contentMode: .fit)
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
            
            // Edit button at the bottom left
                Button(action: {
                    // Edit action
                }) {
                    Image("Edit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 60)
                }
                .position(x: geometry.safeAreaInsets.leading + 60, y: geometry.size.height - geometry.safeAreaInsets.bottom - 25)
                
                // Execute button at the bottom right
                Button(action: {
                    // Execute action
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
    // Image selection logic
    if row == 0 {
        switch column {
        case 0: return Image("Cruise-Echelon")
        case 1: return Image("Cruise-Loose")
        case 2: return Image("Cruise-Trail")
        default: return Image("Blue-Sq")
        }
    }
    return Image("Blue-Sq")
}
}

#Preview {
    EgressMain()
}
