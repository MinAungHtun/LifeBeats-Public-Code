//
//  GoogleAppleSignIn.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.

//  Created by User on 4/8/20.
/* https://lifebeats-1.firebaseapp.com/__/auth/handler *///apple sign inx

import SwiftUI
import GoogleSignIn
import AuthenticationServices
import Firebase


struct GoogleAppleSignIn: View {
    @State var coordinator : AppleSignInCoordinator?
    @State var showPrivacy : Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
        VStack{
            Image("logo_bigger").renderingMode(.original).clipShape(Circle()).overlay(Circle().stroke(Color.black,lineWidth: 1)).padding(.bottom, 10)
            HStack
            {
                Text("Welcome to Lifebeats")
                    .font(Font.custom("Nexa Bold", size: 23))
                    .fontWeight(.bold)
            }.padding(.bottom, 50).padding(.top, 30)
            //HStack
            //{
                Text("Sign in to experience")
                    .font(Font.custom("Nexa Bold", size: 23))
                    .fontWeight(.semibold)
            Text("the best of Lifebeats")
                .font(Font.custom("Nexa Bold", size: 23))
                .fontWeight(.semibold)
            //}
//            FaceBookLoginView().frame(width: 120, height: 50).padding(.trailing, 80).padding().padding(.leading, 80).padding(.top, 20)
            
            signInWithAppleButton().frame(width: 200, height: 50)
                .padding().onTapGesture {
                    print("Apple Tapped")
                    self.coordinator = AppleSignInCoordinator()
                    if let coordinator = self.coordinator{
                    coordinator.startSignInWithAppleFlow
                    {
                        print("Apple Success")
                    }
                }
                }
            
            Text("(Or)")
                .font(Font.custom("Nexa Bold", size: 18))
                .fontWeight(.bold)
            //ZStack{
        google()
            .frame(width: 200, height: 100)
            //.padding(.trailing, 125)
            //.padding(.leading, 74)
            .padding()
            
            
            VStack
            {
                Text("By creating an account you agree to our").font(Font.custom("Nexa Bold", size: 16))
                Button(action: {self.showPrivacy.toggle()})
                    {
                    Text("Privacy Policy, Terms of Use").font(Font.custom("Nexa Bold", size: 16))
                }
            }.padding()
        }.onAppear(perform: {
            UserDefaults.standard.set("User", forKey: "userName")
        })
        .sheet(isPresented: $showPrivacy)
            {
            PrivacyTerm1()
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleAppleSignIn()
    }
}

struct google : UIViewRepresentable {
    

    func makeUIView(context: UIViewRepresentableContext<google>) -> GIDSignInButton {
        
        let button = GIDSignInButton()
        button.colorScheme = .dark
        button.style = .wide

        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<google>) {
        
    }
}

struct signInWithAppleButton : UIViewRepresentable
{

    func makeUIView(context: Context) ->  ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type:.continue ,style: .whiteOutline)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}

