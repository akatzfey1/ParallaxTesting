//
//  MotionManager.swift
//  Parallax
//
//  Created by Alex Katzfey on 4/12/22.
//

import CoreMotion
import SwiftUI
import Foundation

struct ParallaxMotionModifier: ViewModifier {
    
    @ObservedObject var manager: MotionManager = MotionManager()
    var magnitude: Double
    
    func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(manager.roll * magnitude), y: CGFloat(manager.pitch * magnitude))
    }
}

extension View {
    func parallax(magnitude: Double) -> some View {
        modifier(ParallaxMotionModifier(magnitude: magnitude))
    }
}

class MotionManager: ObservableObject {
    
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    
    private var manager: CMMotionManager
    
    init() {
        self.manager = CMMotionManager()
        self.manager.deviceMotionUpdateInterval = 1/200 // Setting this higher than device spec will result in device max used
        self.manager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
            }
        }
    }
}
