//
//  LottieTest.swift
//  LifeBeats
//
//  Created by User on 3/22/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Lottie
import Firebase

struct LottieTest: View {
    
    @State var badges : String
    var body: some View {
        
        
        VStack{
//            Button (action:{print("1")})
//                {
//                Text("X").foregroundColor(.white).frame(width: 50)
//            }.padding(.leading, 300)
            ZStack{
            LottieView()
                if(self.badges == "lifebeatsLite")
                {
            Image("Lifebeats Lite").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "lifebeatsPro")
                {
            Image("Lifebeats Pro").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "mindfulBeginner")
                {
            Image("Mindful Beginner").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "mindfulVeteran")
                {
            Image("Mindful Veteran").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "lullaby")
                {
            Image("Lullaby").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "zenMaster")
                {
            Image("Zen Master").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "inTheZone")
                {
            Image("In The Zone").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "curiosity")
                {
            Image("Curiosity").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "loveThyself")
                {
            Image("Love Thyself").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "officeMaestro")
                {
            Image("Office Maestro").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "aceThatTest")
                {
            Image("Ace That Test").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "dailyCheckIn")
                {
            Image("Daily Check in").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "sleepyHead")
                {
            Image("Sleepyhead").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                else if(self.badges == "firstSteps")
                {
            Image("First Steps").resizable().frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
            }.frame(height: 300)
            Text("Congratulations! You have received").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy)
            Text("a new badge").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy)
            
            if(self.badges == "lifebeatsLite")
            {
            Text("Lifebeats Lite").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Logged into app for the first time").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "lifebeatsPro")
            {
            Text("Lifebeats Pro").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Logged in 30 days in a row").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "mindfulBeginner")
            {
            Text("Mindful Beginner").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Complete first meditation session").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "mindfulVeteran")
            {
            Text("Mindful Veteran").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Complete 60 minutes of meditation").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "zenMaster")
            {
            Text("Zen Master").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Complete 180 minutes of meditation").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "lullaby")
            {
            Text("Lullaby").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Complete first sleep session").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "curiosity")
            {
            Text("Curiosity").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Accessed and completed every therapy in Lifebeats").font(Font.custom("Nexa Bold", size: 16))
                Text("Lifebeats").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "inTheZone")
            {
            Text("In The Zone").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
            Text("Complete 3 Deep Focus sessions").font(Font.custom("Nexa Bold", size: 16))//.padding(.top, 20)
            }
            else if(self.badges == "loveThyself")
            {
                Text("Love Thyself").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
                Text("Complete all Self Love sessions").font(Font.custom("Nexa Bold", size: 16))
            }
            else if(self.badges == "officeMaestro")
            {
                Text("Office Maestro").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
                Text("Complete all Mindfulness at Work sessions").font(Font.custom("Nexa Bold", size: 16))
            }
            else if(self.badges == "aceThatTest")
            {
                Text("Ace that Test").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
                Text("Complete all Student Living sessions").font(Font.custom("Nexa Bold", size: 16))
            }
            else if(self.badges == "dailyCheckIn")
            {
                Text("Daily Check In").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
                Text("Track mood on chat bot for 7 days in a row").font(Font.custom("Nexa Bold", size: 16))
            }
            else if(self.badges == "sleepyHead")
            {
                Text("Sleepy Head").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
                Text("Set Sleep Reminder").font(Font.custom("Nexa Bold", size: 16))
            }
            else if(self.badges == "firstSteps")
            {
                Text("First Steps").font(Font.custom("Nexa Bold", size: 17)).fontWeight(.heavy).padding()
                Text("Set Mindfulness Reminder").font(Font.custom("Nexa Bold", size: 16))
            }
            NavigationLink(destination:  AllBadges()){Text("View All Badges").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(.white).frame(width: 150)}.padding()
        }.padding(.bottom, 150)
        
        
        .onAppear(perform: {
            let db = Firestore.firestore()
            let uid = UserDefaults.standard.string(forKey: "UID")
            
            let ref = db.collection("Users").document(uid!).setData([ "\(self.badges)Celebrated" : true ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                        }
                    }
        })
        
        
    }
}

struct LottieTest_Previews: PreviewProvider {
    static var previews: some View {
        LottieTest(badges: "lifebeatsLite")
    }
}


struct LottieView : UIViewRepresentable
{
    typealias UIViewType = UIView
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = AnimationView()
        let animation = Animation.named("37723-confetti-partyyy")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo: view.widthAnchor), animationView.heightAnchor.constraint(equalTo: view.heightAnchor)])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
    
    
}


