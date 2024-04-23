//
//  SplashView.swift
//  loginPage
//
//  Created by Tekup-mac-3 on 23/4/2024.
//

import SwiftUI
import Lottie

struct SplashView: View {
    @State var isActive: Bool = false
    @State var email = UserDefaults.standard.string(forKey: "email")
    
    var body: some View {
        ZStack {
                   if self.isActive {
                       if self.email == nil {
                           ContentView()
                       }
                       else {
                           HomeView()
                       }
                       
                   } 
            else {
        VStack {
            LottieView(animationFileName: "animation", loopMode: .loop)
                .frame(width: 200, height: 200)
        }
                       
    }
                           }
                           .onAppear {
                               DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                   withAnimation {
                                       self.isActive = true
                                   }
                               }
                           }
    }
}

#Preview {
    SplashView()
}
