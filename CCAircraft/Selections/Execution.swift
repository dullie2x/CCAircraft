//
//  Execution.swift
//  CCAircraft
//
//  Created by Abdulmalik Ariyo on 3/2/24.
//

import SwiftUI

struct Execution: View {
    var isBugBlueSelected: Bool
    var isBugGrBlueSelected: Bool
    var isBugGrnSelected: Bool
    var isBugYBlueSelected: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all) // Black background

                    // "EXN" Text at the top middle
                    Text("EXN")
                        .font(.largeTitle.bold())
                        .foregroundColor(.green)
                        .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 20)

                    // Individual word buttons with specific positioning
                    // CRUISE Button
                    NavigationLink("CRUISE", destination: CruiseMain())
                        .font(.title.bold())
                        .foregroundColor(.blue)
                        .position(x: geometry.safeAreaInsets.leading + 55, y: geometry.size.height * 0.4) // Adjust position as needed
                    
                    // ENGAGEMENT Button
                    NavigationLink("ENGAGEMENT", destination: EngagementMain())
                    .font(.title.bold())
                    .foregroundColor(.blue)
                    .position(x: geometry.safeAreaInsets.leading + 100, y: geometry.size.height * 0.5) // Adjust position as needed
                    
                    // EGRESS Button
                    NavigationLink("EGRESS", destination: EgressMain())
                    .font(.title.bold())
                    .foregroundColor(.blue)
                    .position(x: geometry.safeAreaInsets.leading + 60, y: geometry.size.height * 0.6) // Adjust position as needed

                    // Display selected drones as images on the right side of the screen
                    VStack(alignment: .trailing, spacing: 20) {
                        if isBugBlueSelected {
                            Image("CCA1-Blue")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                        }
                        if isBugGrBlueSelected {
                            Image("CCA4-GrBlue")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                        }
                        if isBugGrnSelected {
                            Image("CCA2-Grn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                        }
                        if isBugYBlueSelected {
                            Image("CCA3-YBlue")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                        }
                    }
                    .position(x: geometry.size.width * 0.85, y: geometry.size.height / 2)
                }
            }
        }
    }
}

struct Execution_Previews: PreviewProvider {
    static var previews: some View {
        Execution(isBugBlueSelected: true, isBugGrBlueSelected: true, isBugGrnSelected: false, isBugYBlueSelected: false)
    }
}
