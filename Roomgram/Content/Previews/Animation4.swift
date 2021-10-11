//
//  Animation4.swift
//  Roomgram
//
//  Created by СОВА on 10.10.2021.
//

import SwiftUI

struct Animation4: View {
    @State private var labelLocal = LocalizedStringKey("welcomTitle4")
    @State private var ButtonTitle2 = LocalizedStringKey("ButtonTitle2")
    @Binding var buttom: String
    @State var images: [Image] = [Image("4-1"), Image("4-2"), Image("4-3"), Image("4-4"), Image("4-5"), Image("4-6"), Image("4-7"), Image("4-8"), Image("4-9")]
    @State var activeImageIndex = 0
    
    var transition: AnyTransition {
        switch activeImageIndex {
        case 0:
            return .asymmetric(insertion: .scale, removal: .opacity)
        default:
            return .identity
        }
    }
    
    let imageSwitchTimer = Timer.publish(every: 0.2, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Color.hex("3791c6").ignoresSafeArea()
            Image("4-0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .shadow(radius: 20)
            
            images[activeImageIndex]
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .transition(transition)
                .animation(Animation.linear)
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
            
        }.onAppear {
            self.buttom = "Продолжить"
        }
        
    }
}

struct Animation4_Previews: PreviewProvider {
    static var previews: some View {
        Animation4(buttom: .constant("Продолжить"))
    }
}
