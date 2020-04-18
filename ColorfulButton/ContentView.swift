//
//  ContentView.swift
//  ColorfulButton
//
//  Created by Ramill Ibragimov on 18.04.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Learn More")
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }.frame(width: 220, height: 60)
        .background(AnimatedBsckgroundGragient())
        .cornerRadius(12)
    }
}

struct AnimatedBsckgroundGragient: View {
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    let colors = [Color.blue, Color.purple, Color.pink, Color.purple, Color.pink, Color.red, Color.purple, Color.blue, Color.purple, Color.red, Color.purple, Color.pink, Color.pink]
    
    @State private var start = UnitPoint(x: 0, y: -2)
    @State private var end = UnitPoint(x: 4, y: 0)
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
        .animation(
            Animation.easeInOut(duration: 6)
            .repeatForever()
        )
            .onReceive(timer) { _ in
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
