//
//  HomeView.swift
//  loginPage
//
//  Created by Tekup-mac-3 on 20/4/2024.
//

import SwiftUI

struct HomeView: View {
    @State var isout = false
    var body: some View {
        TabView {
            RedView()
             .tabItem {
                Image(systemName: "house.fill")
                Text("First Tab")
              }
            
           
                BlueView()
              .tabItem {
                 Image(systemName: "tv.fill")
                 Text("Third Tab")
               }
            Button {
                print("success logout")
         UserDefaults.standard.set(nil, forKey: "email")
                 isout = true
            }label: {
            Text("Logout").foregroundColor(.white)
                    .font(.system(size: 20 , weight: .semibold))
        }
        .padding(.vertical)
        .background(Color(.blue))
        .cornerRadius(12)
        .padding(.horizontal)
              .tabItem {
                 Image(systemName: "person.fill")
                 Text("Second Tab")
               }
            
        }

    }
}

#Preview {
    HomeView()
}


struct RedView: View {
    var body: some View {
        Color.red
    }
}
struct BlueView: View {
    var body: some View {
        Color.blue
    }
}
