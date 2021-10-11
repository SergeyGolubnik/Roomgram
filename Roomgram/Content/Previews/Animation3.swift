//
//  Animation3.swift
//  Roomgram
//
//  Created by СОВА on 10.10.2021.
//

import SwiftUI

struct Animation3: View {
    @State private var labelLocal = LocalizedStringKey("welcomTitle3")
    @State private var ButtonTitle1 = LocalizedStringKey("ButtonTitle1")
    @Binding var but: String
    @State var images: [Image] = [Image("icon1"), Image("icon2"), Image("icon3"), Image("icon4"), Image("icon6")]
    @State var activeImageIndex = 0
    
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
                .transition(transition)
                .animation(Animation.linear)
                .onReceive(imageSwitchTimer) { _ in
                    self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                }
                .shadow(radius: 20)
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
            self.but = "Пропустить"
        }
        
    }
}

struct Animation3_Previews: PreviewProvider {
    static var previews: some View {
        Animation3(but: .constant("Пропустить"))
    }
}
