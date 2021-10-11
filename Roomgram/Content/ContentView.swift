//
//  ContentView.swift
//  Roomgram
//
//  Created by СОВА on 09.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var webViewToogle = false
    @State var buttom = "Пропустить"
    var body: some View {
        if webViewToogle {
            WebViewContent(url: "https://roomgram.com").ignoresSafeArea()
        } else {
            ZStack{
                
                Color.hex("3791c6")
                            .ignoresSafeArea()
                TabView {
                    Animation1()
                    Animation2()
                    Animation3(but: $buttom)
                    Animation4(buttom: $buttom)
                }.tabViewStyle(PageTabViewStyle())
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.webViewToogle.toggle()
                        }){
                            Text(buttom)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .padding()
                                .multilineTextAlignment(.center)
                                
                        }
                    }
                    Spacer()
                }
                VStack {
                    Image("mylogo1")
                        .padding(.top, 60)
                    Spacer()
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
