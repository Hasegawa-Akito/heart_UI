//
//  object3DView.swift
//  heart_UI
//
//  Created by Hasegawa Akito on 2022/07/13.
//

import SwiftUI

struct object3DView: View {
    @State private var degrees = 0.0
    
        var body: some View {
            VStack {
                Button("Animate..!") {
                    withAnimation {
                        self.degrees += 360
                    }
                }
                .padding(20)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(Color.white)
                .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 1, z: 1))
   Text("SwiftUI Animations")
                    .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
            }
        }
}

struct object3DView_Previews: PreviewProvider {
    static var previews: some View {
        object3DView()
    }
}
