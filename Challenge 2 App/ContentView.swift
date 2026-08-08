//
//  ContentView.swift
//  Challenge 2 App
//
//  Created by T Krobot on 8/8/26.
//

import SwiftUI

//ContentView.Swift
struct ContentView: View {
    
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("\(counter) score")
            Button {
                counter += 1
            } label: {
                Text("+1 score")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .shadow(color: .white.opacity(0.3),
                    radius: 10, x: 0.0, y: 0.0)
                        
            
            Button("-1 score") {
                counter -= 1
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}
