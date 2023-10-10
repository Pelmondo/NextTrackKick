//
//  ContentView.swift
//  NextTrackKick
//
//  Created by Сергей Прокопьев on 05.10.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var isTapped: Bool = false

    var body: some View {
        Button {
            isTapped.toggle()
        } label: {
            HStack(spacing: -6) {
                if isTapped {
                    Image(systemName: "play.fill")
                        .transition(.scale.combined(with: .opacity))
                }

                Image(systemName: "play.fill")

                if !isTapped {
                    Image(systemName: "play.fill")
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .font(.system(size: 40))
            .foregroundColor(.cyan)
            .animation(isTapped ? .spring(dampingFraction: 0.6) : nil, value: isTapped)
            .onChange(of: isTapped) {
                if !isTapped {
                    isTapped.toggle()
                }
            }
        }
        .buttonStyle(CircleBackgroundStyle())
    }
}

struct CircleBackgroundStyle: ButtonStyle {
    @State private var isAnimating = false

    private let duration = 0.22

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 36)
            .background(isAnimating ? .gray.opacity(0.45) : .clear)
            .containerShape(Circle())
            .scaleEffect(isAnimating ? 0.86 : 1)
            .animation(.easeInOut(duration: duration), value: isAnimating)
            .onChange(of: configuration.isPressed) {
                isAnimating = true
                DispatchQueue.main.asyncAfter(deadline: .now() +  duration) {
                    isAnimating = false
                }
            }
    }
}


#Preview {
    ContentView()
}
