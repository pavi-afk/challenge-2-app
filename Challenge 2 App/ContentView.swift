//
//  ContentView.swift
//  Challenge 2 App
//
//  Created by T Krobot on 8/8/26.
//

// // ContentView.swift // Challenge 2 App // // Created by T Krobot on 8/8/26. //

// // ContentView.swift // Challenge 2 App // // Created by T Krobot on 8/8/26. //

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var counter1 = 0

    var body: some View {
        HStack(spacing: 40) {
            VStack {
                Text("Paviesh")
                Text("\(counter) score")
                    .font(.headline)
                
                Button {
                    counter += 1
                } label: {
                    Text("+1 score")
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
                
                Button("-1 score") {
                    counter -= 1
                }
                .buttonStyle(.bordered)
            }
            VStack {
                Text("Val")
                Text("\(counter1) score")
                    .font(.headline)
                
                Button {
                    counter1 += 1
                } label: {
                    Text("+1 score")
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
                
                Button("-1 score") {
                    counter1 -= 1
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

