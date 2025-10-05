//
//  SUTutorial.swift
//  LifeBeats
//
//  Created by User on 10/31/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SUTutorial: View {
    
    @State var timeRemaining = 16
    @State var slide:Int = 1
    @State var imageName : String = "S1SU"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var finished:Bool? = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
//        if(self.finished == false)
//        {
        ZStack{
            if(self.slide == 1)
            {
        VStack{
            Text("Let our chatbot guide you on \n what to use in our app").font(Font.custom("Nexa Bold", size: 16)).padding().background(Color.gray).clipShape(TutorialBubble(chat: false))
        }.padding(.top, UIScreen.main.bounds.height - 300).padding(.trailing, UIScreen.main.bounds.width - 450)
                
                VStack
                {
                    Image("Febe")
                        .resizable()
                         .renderingMode(.original)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,lineWidth: 3))
                        .shadow(radius: 20)
                        .accessibility(label: Text("Bot"))
                        .frame(width: 40.0, height: 40.0)
                }.padding(.top, UIScreen.main.bounds.height - 211).padding(.trailing, UIScreen.main.bounds.width - 185)
            }
            
            else if (self.slide == 2)
            {
        VStack{
        Text("Manage your settings and \n browse your insights").font(Font.custom("Nexa Bold", size: 16)).padding().background(Color.gray).clipShape(TutorialBubble(chat: true))
        }.padding(.top, UIScreen.main.bounds.height - 300).padding(.leading, UIScreen.main.bounds.width - 420)
                
                VStack
                {
                    Image("user1")
                        .resizable()
                         .renderingMode(.original)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,lineWidth: 3))
                        .shadow(radius: 20)
                        .accessibility(label: Text("Profile"))
                        .frame(width: 40.0, height: 40.0)
                }.padding(.top, UIScreen.main.bounds.height - 210).padding(.leading, UIScreen.main.bounds.width - 175)
            }
            else if (self.slide == 3)
            {
        VStack{
        Text("Browse the Lifebeats library here and \n discover various sessions").font(Font.custom("Nexa Bold", size: 16)).padding().background(Color.gray).clipShape(Bubble(chat: true))
        }.padding(.bottom, 100)
            
        VStack
        {
            Image("S3").resizable().frame(width: UIScreen.main.bounds.width - 7 , height: 380)
        }.padding(.top, 410).padding(.leading, 10)
            }
            else if (self.slide == 4)
            {
        VStack{
        Text("Engage with other Lifebeats users \n and share experiences").font(Font.custom("Nexa Bold", size: 16)).padding().background(Color.gray).clipShape(TutorialBubble(chat: true))
        }
        .padding(.top, UIScreen.main.bounds.height - 400)//.padding(.leading, UIScreen.main.bounds.width - 620)
            
        VStack
        {
            Image("Com")
                .resizable()
                 .renderingMode(.original)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 3))
                .shadow(radius: 20)
                .accessibility(label: Text("Community Board"))
                .frame(width: 40.0, height: 40.0)
        }.padding(.top, UIScreen.main.bounds.height - 211).padding(.leading, UIScreen.main.bounds.width - 355)
            }
            else if (self.slide == 5)
            {
                VStack{
                Text("Earn badges by completing \n features of Lifebeats").font(Font.custom("Nexa Bold", size: 16)).padding().background(Color.gray).clipShape(TutorialBubble(chat: true))
                }
                .padding(.top, 100).padding(.leading, 10)
                    
                VStack
                {
                    Image("badgesSU").resizable().frame(width: UIScreen.main.bounds.width , height: 200)
                }.padding(.bottom, 250).padding(.leading, 10)
            }
            else if (self.slide == 6)
            {
        VStack{
        Text("View your usage trends on your profile page").font(Font.custom("Nexa Bold", size: 16)).padding().background(Color.gray).clipShape(Bubble(chat: true))
        }
        .padding(.bottom, 200)
        .padding(.leading, 10)
            
        VStack
        {
            Image("trendsSU").resizable().frame(width: UIScreen.main.bounds.width  , height: 200)
        }.padding(.top, 50)
        .padding(.leading, 10)
            }
            
            
        }
        .onTapGesture {
            if (self.slide < 7)
            {
            self.slide = self.slide + 1
                print(self.slide)
                if(self.slide == 2)
                {
                    self.timeRemaining = 13
                }
                else if(self.slide == 3)
                {
                    self.timeRemaining = 10
                }
                else if(self.slide == 4)
                {
                    self.timeRemaining = 7
                }
                else if(self.slide == 5)
                {
                    self.timeRemaining = 4
                    self.imageName = "settingsSU"
                }
                else if(self.slide == 6)
                {
                    self.timeRemaining = 0
                }
            }
            else
            {
            //self.slide = 0
            self.timeRemaining = 0
            UserDefaults.standard.set(true, forKey: "introFinished")
            }
            print(self.slide)
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                if(self.timeRemaining == 13)
                {
                    self.slide = 2
                }
                else if(self.timeRemaining == 10)
                {
                    self.slide = 3
                }
                else if(self.timeRemaining == 7)
                {
                    self.slide = 4
                }
                else if(self.timeRemaining == 4)
                {
                    self.slide = 5
                    self.imageName = "settingsSU"
                }
                else if(self.timeRemaining == 3)
                {
                    self.slide = 6
                }
            
            }
            else if self.timeRemaining == 0
            {
                UserDefaults.standard.set(true, forKey: "introFinished")
            }
        }
        .background(Image(self.imageName).resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea()
                        .blur(radius: 3.0)
        )
        //}
//        else if(self.finished == true)
//        {
//            CategoryHome().environmentObject(UserData()).environment(\.colorScheme, .dark)
//        }
    }
}


struct TutorialBubble:Shape
{
    var chat:Bool
    func path(in rect: CGRect) -> Path {
        let path=UIBezierPath(roundedRect: rect, byRoundingCorners: [ .topRight, .topLeft, chat ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}

struct SUTutorial_Previews: PreviewProvider {
    static var previews: some View {
        SUTutorial()
    }
}
