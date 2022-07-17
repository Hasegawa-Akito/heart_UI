//
//  RainView.swift
//  heart_UI
//
//  Created by Hasegawa Akito on 2022/07/17.
//

import SwiftUI

struct RainView: View {
    static let startPosition = CGFloat(UIScreen.main.bounds.height)
    static let framesPerSecond: Int = 60
    static let dropMax: Int = 1000
    static let dropSizeMin = 7
    static let dropSizeMax = 10
    static let dropCountMin = 60
    static let dropCountMax = 90
    static let dropChance = 1
    static var colorArray = [Color(UIColor.systemBlue),
                             Color(UIColor.systemIndigo),
                             Color(UIColor.systemTeal)]

    
    // MARK: Property
    @State var drops: [Drop] = []
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(1.0 / TimeInterval(RainView.framesPerSecond)),
                             repeats: true) {_ in
                                self.rainUpdate()
        }
    }
    
    var body: some View {
        ZStack() {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("kaigara")
                        .resizable()
                        .frame(width: 250.0, height: 250.0, alignment: .leading)
                        .foregroundColor(.pink)
                        .frame(width: 250, height: 250)
            
                    ForEach(self.drops) { drop in
//                        Circle()
                        Image(systemName: "heart.fill")
//                            .fill(drop.color)
                            .foregroundColor(.pink)
                            .frame(width: drop.size, height: drop.size)
                            .position(x: drop.x, y: drop.y)
                            .opacity(drop.opacity)
                    }
                    
                    
                    
                }
                .onAppear() {
                    _ = self.timer
                }
    }
}


extension RainView {
    func rainUpdate() {
        guard let viewSize = UIApplication.viewSize() else {
            return
        }
        
        if (drops.count < RainView.dropMax) {
            if Int.random(in: 0..<RainView.dropChance) == 0 {
                var drop = Drop()
                drop.x = CGFloat(Int.random(in: 0..<Int(viewSize.width)))
                drop.size = CGFloat(Int.random(in: RainView.dropSizeMin...RainView.dropSizeMax))
                drop.color = RainView.colorArray[Int.random(in: 0..<RainView.colorArray.count)]
                drop.countMax = Int.random(in: RainView.dropCountMin..<RainView.dropCountMax)
                drops.append(drop)
            }
        }

        var drops2:[Drop] = []
        
        for drop in drops {
            if drop.y > viewSize.height {
                continue
            }
            
            let v = Interpolation.interpolationSlowFast(Float(Float(drop.count) / Float(drop.countMax)))
            let arc = Interpolation.interpolationArc(Float(Float(drop.count) / Float(drop.countMax)))
            
            var drop2 = Drop(drop)
            //yの位置座標
            drop2.y = Self.startPosition - CGFloat(v) * viewSize.height
            drop2.count = drop2.count + 1
            drop2.opacity = Double(arc)
            
            drops2.append(drop2)
        }
        
        drops = drops2
    }
}

struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        RainView()
    }
}
