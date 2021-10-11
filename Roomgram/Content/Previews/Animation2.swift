//
//  Animation2.swift
//  Roomgram
//
//  Created by СОВА on 10.10.2021.
//

import SwiftUI

struct Animation2: View {
    @State private var labelLocal = LocalizedStringKey("welcomTitle2")
    @State var scale: CGFloat = 1.5
    @State var images: [Image] = [Image("2-1"), Image("2-2"), Image("2-3"), Image("2-4"), Image("2-5"), Image("2-6"), Image("2-7"), Image("2-8"), Image("2-8")]
    @State var activeImageIndex = 0
        @State var isExpanded = false
    var transition: AnyTransition {
        switch activeImageIndex {
        case 0:
            return .asymmetric(insertion: .scale, removal: .opacity)
        default:
            return .identity
        }
    }
        
    let imageSwitchTimer = Timer.publish(every: 0.9, on: .main, in: .common)
            .autoconnect()
        
        var body: some View {
            ZStack {
                Color.hex("3791c6").ignoresSafeArea()
                    images[activeImageIndex]
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(40)
                        .scaleEffect()
                        .transition(transition)
                        .animation(.spring())
                        .shadow(radius: 20)
                        .onReceive(imageSwitchTimer) { _ in
                            self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                        }
                VStack{
                    Spacer()
                    Text(labelLocal)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 50)
                        
                }

            }
        }
}

struct Animation2_Previews: PreviewProvider {
    static var previews: some View {
        Animation2()
    }
}
