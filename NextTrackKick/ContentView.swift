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
    }
}


#Preview {
    ContentView()
}
