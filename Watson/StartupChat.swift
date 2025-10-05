////
////  StartupChat.swift
////  LifeBeats
////
////  Created by User on 10/8/20.
////  Copyright © 2020 Life Beats Inc. All rights reserved.
////
//
//import SwiftUI
//
//struct StartupChat: View {
//    
//    @State var name = 0
//    @State var Age = 0
//    @State var occupation = 0
//    @State var inputBar = 0
//    @State var nameReply = 0
//    @State var ageQuestion = 0
//    @State var jobQuestion = 0
//    @State var userName : String = " "
//    @State var age : String = " "
//    @State var job : String = " "
//    @State var ageReply = 0
//    @State var jobReply = 0
//    @State var timeRemaining = 10
//    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    private func sendName(name:String)
//    {
//        print(name)
//        self.timeRemaining = 7
//        self.userName = name
//        self.nameReply = 1
//        self.ageQuestion = 1
//        self.inputBar = 1
//    }
//    
//    var body: some View {
//        VStack{
//            ScrollView(.vertical, showsIndicators: false){
//            LazyVStack{
//                
//                VStack{
//                    if(self.timeRemaining > 8)
//                    {
//                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 120)
//                    }
//                    else{
//                Text("Hello , may we know your name?").padding().foregroundColor(.white).background(Color.gray)
//                    .clipShape(Bubble(chat:false)).padding(.leading, -50)
//                    }
//                }.padding()
//                if(self.nameReply == 1)
//                {
//                    VStack {
//                        
//                Text(
//                            self.userName
//                    ).padding().foregroundColor(.white).background(Color.blue)
//                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
//                            .padding(.leading, -50)
//                    }
//                }
//                if(self.ageQuestion == 1)
//                {
//                    VStack{
//                        if(self.timeRemaining > 5)
//                        {
//                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 120)
//                        }
//                        else{
//                    Text("Please select your age range").padding().foregroundColor(.white).background(Color.gray)
//                        .clipShape(Bubble(chat:false)).padding(.leading, -70)
//                        }
//                    }.padding()
//                }
//                if(self.ageReply == 1)
//                {
//                    
//                    VStack {
//                        
//                Text(
//                            self.age
//                    ).padding().foregroundColor(.white).background(Color.blue)
//                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
//                            .padding(.leading, -50)
//                    }
//                }
//                if(self.jobQuestion == 1)
//                {
//                    VStack{
//                        if(self.timeRemaining > 2)
//                        {
//                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 120)
//                        }
//                        else{
//                    Text("Please select your job description").padding().foregroundColor(.white).background(Color.gray)
//                        .clipShape(Bubble(chat:false)).padding(.leading, -40)
//                        }
//                    }
//                }
//                if(self.jobReply == 1)
//                {
//                    VStack {
//                        
//                Text(
//                            self.job
//                    ).padding().foregroundColor(.white).background(Color.blue)
//                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
//                            .padding(.leading, -45)
//                    }
//
//                    
//                    VStack{
//                        
//                    Text("Thank you. Please enjoy Lifebeats experience :)").padding().foregroundColor(.white).background(Color.gray)
//                        .clipShape(Bubble(chat:false)).padding(.leading, -10)
//                        
//                    }
//                }
//            }
//            }.onReceive(timer) { _ in
//                if self.timeRemaining > 0 {
//                    self.timeRemaining -= 1
//                }
//    }
//            if(inputBar == 0 && self.timeRemaining <= 7)
//            {
//                HStack{
//                    ChatTextField(sendAction: sendName)
//                    
//                }
//
//            }
//            
//            else if(inputBar == 1 && self.timeRemaining < 5)
//            {
//                ScrollView(.vertical, showsIndicators: false)
//                {
//                    VStack(alignment: .leading, spacing: 0){
//                        Button (action: {self.ageReply = 1; self.age = "13-18"; self.timeRemaining = 5; self.inputBar = 2; self.jobQuestion = 1
//                        }){
//                        Text("13-18").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:100) }
//                        Button (action: {self.ageReply = 1; self.age = "18-25"; self.timeRemaining = 5; self.inputBar = 2; self.jobQuestion = 1
//                        }){
//                        Text("18-25").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:100) }
//                        Button (action: {self.ageReply = 1; self.age = "25-45"; self.timeRemaining = 5; self.inputBar = 2; self.jobQuestion = 1
//                        }){
//                        Text("25-45").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:100) }
//                        
//                        Button (action: {self.ageReply = 1; self.age = "45-65"; self.timeRemaining = 5; self.inputBar = 2; self.jobQuestion = 1
//                        }){
//                        Text("45-65").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:100) }
//                        Button (action: {self.ageReply = 1; self.age = "65 and up"; self.timeRemaining = 5; self.inputBar = 2; self.jobQuestion = 1
//                        }){
//                        Text("65 and up").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:150).padding(.leading, -15) }
//                    }.padding(.trailing, UIScreen.main.bounds.width - 150 )
//                }.frame(width: UIScreen.main.bounds.width, height: 280)
//            }
//            
//            else if(inputBar == 2 && self.timeRemaining == 0)
//            {
//                ScrollView(.vertical, showsIndicators: false)
//                {
//                    VStack(alignment: .leading, spacing: 0){
//                        Button (action: {self.jobReply = 1; self.job = "Full time Employed"; self.inputBar = 3
//                        }){
//                        Text("Full time Employed").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Part time Employed"; self.inputBar = 3
//                        }){
//                        Text("Part time Employed").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Full time Student"; self.inputBar = 3
//                        }){
//                        Text("Full time Student").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        
//                        Button (action: {self.jobReply = 1; self.job = "Part time Student"; self.inputBar = 3
//                        }){
//                        Text("Part time Student").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Freelancer"; self.inputBar = 3
//                        }){
//                        Text("Freelancer").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Homemaker"; self.inputBar = 3
//                        }){
//                        Text("Homemaker").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Stay at home parent"; self.inputBar = 3
//                        }){
//                        Text("Stay at home parent").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Retired"; self.inputBar = 3
//                        }){
//                        Text("Retired").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Unemployed"; self.inputBar = 3
//                        }){
//                        Text("Unemployed").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                        Button (action: {self.jobReply = 1; self.job = "Prefer not to say"; self.inputBar = 3
//                        }){
//                        Text("Prefer not to say").padding().foregroundColor(.white).background(Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:250) }
//                    }.padding(.trailing, UIScreen.main.bounds.width - 200 )
//                }.frame(width: UIScreen.main.bounds.width, height: 550)
//            }
//            else if (self.inputBar == 3)
//            {
//                VStack
//                {
//                    Text(" ")
//                }
//            }
//            
//        }.onAppear(perform: {
//            self.name = 0
//            self.Age = 0
//            self.occupation = 0
//            self.inputBar = 0
//            self.nameReply = 0
//            self.ageQuestion = 0
//            self.jobQuestion = 0
//            self.userName = " "
//            self.age = " "
//            self.job = " "
//            self.ageReply = 0
//            self.jobReply = 0
//            self.timeRemaining = 10
//        })
//    }
//}
//
//struct StartupChat_Previews: PreviewProvider {
//    static var previews: some View {
//        StartupChat()
//    }
//}
