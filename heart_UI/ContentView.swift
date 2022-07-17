//
//  ContentView.swift
//  heart_UI
//
//  Created by Hasegawa Akito on 2022/07/13.
//

import SwiftUI
import Speech
import AVFoundation

struct ContentView: View {
    
    @State private var degrees = 0.0
    
    
    
    var animation: Animation {
        Animation.easeInOut(duration: 3.0)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                Text("Connecting.....")
                        .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                
                Image("kaigara")
                    .resizable()
                    .frame(width: 250.0, height: 250.0)
                    .foregroundColor(.pink)
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                    .animation(animation)
                    .onAppear {
                                withAnimation() {
                                    
                                    self.degrees = 360.0
                                }
                    }
                    

                NavigationLink(destination: RainView()) {
                                Text("画面遷移")
                            }
                
            
                
            }
            .position(x:200, y:300)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
