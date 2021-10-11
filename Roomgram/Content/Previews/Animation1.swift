//
//  Animation1.swift
//  Roomgram
//
//  Created by СОВА on 10.10.2021.
//

import SwiftUI

struct Animation1: View {
    @State var planet = false
    @State var cloud1 = false
    @State var cloud2 = false
    @State var cloud3 = false
    @State var sum = false
    @State private var labelLocal = LocalizedStringKey("welcomTitle")
    
    
    
    var body: some View {
        ZStack {
            Color.hex("3791c6").ignoresSafeArea()
            ZStack{
                Sun(image: "sun")
                
                GeometryReader {metrics in
                    VStack(spacing: 0){
                        Spacer()
                        Color.hex("3791c6")
                            .frame(width: metrics.size.width, height: metrics.size.height / 2)
                    }
                }
                
                
                Planet()
                
                Cloud1()
                
                Cloud2()
                
                Cloud3()
                
                VStack{
                    Spacer()
                    Text(labelLocal)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 50)
                    
                }
            }
        }
    }
}

struct Animation1_Previews: PreviewProvider {
    static var previews: some View {
        Animation1()
    }
}


struct Planet: View {
    @State var planet = false
    var body: some View {
        Image("planet")
            .resizable()
            .frame(width: 300, height: 300, alignment: .center)
            .rotationEffect(.degrees(planet ? 0 : -360), anchor: .center)
            .animation(Animation.linear(duration: 9).repeatForever(autoreverses: false))
            .shadow(radius: 20)
            .onAppear {
                self.planet = true
            }
    }
}

struct Sun: View {
    
    @State var sun = false
    @State var image = "sun"
    var body: some View {
        VStack {
            Image("sun")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(sun ? -360 : 0), anchor: .center)
                .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
                .onAppear {
                    
                    self.sun = true
                    
                }
            
            Spacer()
            
            Image("moon")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(sun ? -360 : 0), anchor: .center)
                .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
                .onAppear {
                    self.sun = true
                }
        }.frame(height: 700)
        .rotationEffect(.degrees(sun ? 0 : -360), anchor: .center)
        .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
        .onAppear {
            self.sun = true
        }
    }
}
struct Cloud1: View {
    
    @State var cloud1 = false
    
    var body: some View {
        HStack {
            Image("cloud 1")
                .resizable()
                .rotationEffect(.degrees(-90))
                .frame(width: 60, height: 40)
            
            Spacer()
        }
        .frame(width: 380, height: 100)
        .rotationEffect(.degrees(cloud1 ? 0 : -360), anchor: .center)
        .animation(Animation.linear(duration: 11).repeatForever(autoreverses: false))
        .onAppear {
            self.cloud1 = true
        }
    }
}
struct Cloud2: View {
    
    @State var cloud2 = false
    
    var body: some View {
        HStack {
            Image("cloud 2")
                .resizable()
                .rotationEffect(.degrees(-90))
                .frame(width: 60, height: 40)
            
            Spacer()
        }
        .frame(width: 360, height: 100)
        .rotationEffect(.degrees(cloud2 ? 0 : -360), anchor: .center)
        .animation(Animation.linear(duration: 13).repeatForever(autoreverses: false))
        .onAppear {
            self.cloud2 = true
        }
    }
}
struct Cloud3: View {
    
    @State var cloud3 = false
    
    var body: some View {
        HStack {
            Spacer()
            Image("cloud 3")
                .resizable()
                .rotationEffect(.degrees(90))
                .frame(width: 60, height: 40)
            
            
        }
        .frame(width: 390, height: 100)
        .rotationEffect(.degrees(cloud3 ? 0 : -360), anchor: .center)
        .animation(Animation.linear(duration: 17).repeatForever(autoreverses: false))
        .onAppear {
            self.cloud3 = true
        }
    }
}
