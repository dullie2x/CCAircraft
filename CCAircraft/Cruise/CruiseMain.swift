//
//  CruiseMain.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

struct CruiseMain: View {
    let rows = 4
    let columns = 3
    @State private var isSelected: [[Bool]] = Array(repeating: Array(repeating: false, count: 3), count: 4)
    @State private var selectedRow: Int?
    @State private var selectedColumn: Int?
    @State private var isShowingErrorAlert = false
    @State private var navigateToEditView = false // Added state variable

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)

                    VStack {
                        Text("CRUISE")
                            .font(.largeTitle.bold())
                            .foregroundColor(.green)
                            .padding(.top, 20)
                        
                        gridOfButtons
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            editButton
                                .position(x: geometry.safeAreaInsets.leading + 80, y: geometry.size.height - geometry.safeAreaInsets.bottom - 25)
                            
                            Spacer()
                            
                            executeButton
                                
                        }
                    }
                }
                .navigationTitle("Cruise Selection")
                .navigationBarHidden(true)
            }
        }
        .alert(isPresented: $isShowingErrorAlert) {
            Alert(title: Text("Error"), message: Text("No specific selection made."), dismissButton: .default(Text("OK")))
        }
        .sheet(isPresented: $navigateToEditView, content: {
            destinationView()
        })
    }

    var gridOfButtons: some View {
        VStack(spacing: 5) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<columns, id: \.self) { column in
                        Button(action: {
                            resetSelections()
                            isSelected[row][column] = true
                            selectedRow = row
                            selectedColumn = column
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
    }
    var editButton: some View {
        Button(action: {
            if selectedRow == nil || selectedColumn == nil {
                isShowingErrorAlert = true
            } else {
                navigateToEditView = true // Set navigateToEditView to true to show the edit view
            }
        }) {
            Image("Edit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 50)
        }
    }
    var executeButton: some View {
        GeometryReader { geometry in
            Button(action: {
                // Execute action
            }) {
                Image("Execute")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 50)
            }
            .position(x: geometry.size.width - geometry.safeAreaInsets.trailing - 100, y: geometry.size.height - geometry.safeAreaInsets.bottom - 25)
        }
    }
    func resetSelections() {
        for row in 0..<rows {
            for column in 0..<columns {
                isSelected[row][column] = false
            }
        }
    }
    func imageFor(row: Int, column: Int) -> Image {
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
    
    @ViewBuilder
    func destinationView() -> some View {
        if let row = selectedRow, let column = selectedColumn, row == 0 {
            switch column {
            case 0: Echelon()
            case 1: Loose()
            case 2: Trail()
            default: Text("Selection not valid")
            }
        } else {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Text("Nothing to edit, go back")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
    }
}

struct CruiseMain_Previews: PreviewProvider {
    static var previews: some View {
        CruiseMain()
    }
}

