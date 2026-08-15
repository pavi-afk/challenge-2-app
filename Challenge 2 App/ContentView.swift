//
//  ContentView.swift
//  Challenge 2 App
//
//  Created by T Krobot on 8/8/26.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct ContentView: View {
    @State private var players = [
        Player(name: "Paviesh", color: .blue),
        Player(name: "Val", color: .purple)
    ]
    @State private var scores: [Int] = [0, 0]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, Color(red: 0.1, green: 0.05, blue: 0.2), .purple.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Scoreboard")
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)

                HStack(spacing: 20) {
                    ForEach(Array(players.enumerated()), id: \.element.id) { index, player in
                        PlayerCard(
                            name: player.name,
                            color: player.color,
                            score: scores[index],
                            increment: { withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) { scores[index] += 1 } },
                            decrement: { withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) { scores[index] -= 1 } }
                        )
                    }
                }
                .frame(maxHeight: .infinity)

                Spacer()
            }
            .padding(.top, 8)
        }
    }
}

struct PlayerCard: View {
    let name: String
    let color: Color
    let score: Int
    let increment: () -> Void
    let decrement: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(name)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text("\(score)")
                .font(.system(size: 88, weight: .heavy, design: .rounded))
                .foregroundStyle(color)
                .contentTransition(.numericText())
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: score)

            Text("points")
                .font(.title3)
                .foregroundStyle(.white.opacity(0.7))

            VStack(spacing: 12) {
                ScoreButton(title: "+1", color: color) {
                    increment()
                }
                ScoreButton(title: "-1", color: .gray) {
                    decrement()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(28)
        .background(.black.opacity(0.55))
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(color.opacity(0.5), lineWidth: 2)
        )
        .shadow(color: color.opacity(0.35), radius: 14, x: 0, y: 8)
    }
}

struct ScoreButton: View {
    let title: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(color.gradient)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .buttonStyle(.plain)
        .shadow(color: color.opacity(0.35), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    ContentView()
}

