//
//  ContentView.swift
//  Parallax
//
//  Created by Alex Katzfey on 4/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundColor(.red)
                .cornerRadius(20)
                .parallax(magnitude: 10)
                .shadow(radius: 10)
            
            Rectangle()
                .frame(width: 225, height: 225)
                .foregroundColor(.green)
                .cornerRadius(20)
                .parallax(magnitude: 25)
                .shadow(radius: 10)
            
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .cornerRadius(20)
                .parallax(magnitude: 40)
                .shadow(radius: 10)
            
            Rectangle()
                .frame(width: 75, height: 75)
                .foregroundColor(.orange)
                .cornerRadius(20)
                .parallax(magnitude: 55)
                .shadow(radius: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
