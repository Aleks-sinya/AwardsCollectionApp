//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Алексей Синяговский on 03.06.2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var awardInShowing = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(awardInShowing ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(awardInShowing ? 0 : 180))
                        .scaleEffect(awardInShowing ? 2: 1)
                }
            }
            
            Spacer()
            if awardInShowing {
                GradientRectangles()
                    .frame(width: 250, height: 250)
                    .transition(.leadingSlide)
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            awardInShowing.toggle()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension AnyTransition {
    static var leadingSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
