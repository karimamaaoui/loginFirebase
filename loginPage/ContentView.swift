//
//  ContentView.swift
//  loginPage
//
//  Created by Tekup-mac-3 on 20/4/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State private var selectedIdx = 0
    @State private var options = ["Login", "Create Account"]
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    
    
    init() {
        FirebaseApp.configure()

    }
    
    var body: some View {
        NavigationStack {
            ScrollView  {
                
                Picker(selection: $selectedIdx, label: Text("I'm a Picker in a Form")) {
                    ForEach(0 ..< options.count) {
                        Text(self.options[$0])
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if selectedIdx != 0 {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                }
                
                Spacer()
                VStack(spacing :16) {
                    TextField("Email", text: $emailTextField)
                        .padding()
                        .background(Color("blueSecond"))
                        .cornerRadius(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12))
                    
                    
                    SecureField("Password", text: $passwordTextField)
                        .padding()
                        .background(Color("blueSecond"))
                        .cornerRadius(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12))
                }.padding()
                
                
                Button {
                    selectedIdx == 0 ? login() : register()
                    
                } 
            
            label: {
                    
                    Text(selectedIdx == 0 ? "Login":"Create Account").foregroundColor(.white).font(.system(size: 20 , weight: .semibold))
                }
                
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color(.blue))
                .cornerRadius(12)
                .padding(.horizontal)
                
                
               
                
            }.background(Color.init(UIColor(white: 0, alpha: 0.05)))
                .navigationTitle(selectedIdx == 0 ? "Login":"Create Account")
                
        }
    }
    
    
    func login() {
        Auth.auth().signIn(withEmail: emailTextField, password: passwordTextField) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success login")
            }
        }
    }
    
    
    func register() {
        Auth.auth().createUser(withEmail: emailTextField, password: passwordTextField) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success registration")
            }
        }
    }
}

#Preview {
    ContentView()
}


