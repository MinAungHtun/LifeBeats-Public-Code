//
//  Febe2.swift
//  LifeBeats
//
//  Created by User on 11/22/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import FirebaseAnalytics
import Firebase

class FebeSingleton
{
    static let sharedInstance = FebeSingleton()
    var timeRemaining = 3
    var queue = 0
    
}

struct subFebeText1 : View, Identifiable
{
    var id = UUID()
    var chatTxt : String
    var chatImg : String
    var chatName : String
   // var noOfTxt : Int = 1
    //@State var timeRemaining = 3
   // @State var trigger : Bool = false
    @State var showFace : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            if(showFace == true)
            {
            MemberFace(imageName: self.chatImg)
                
                TypingAnimationWithText(text: self.chatTxt)
            
            }
            else
            {
            Text(
                LocalizedStringKey(self.chatTxt)
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
            }

        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)//.padding()
            Text(self.chatName).font(Font.custom("Nexa Bold", size: 10)).padding(.leading, 10).padding(.top, -20)
        }
        .onReceive(timer) { _ in
            
//            if(self.timeRemaining > 0)
//            {
//            self.timeRemaining -= 1
//                print(self.timeRemaining)
//            }
        }
        .onAppear(perform: {
            //FebeSingleton.sharedInstance.queue -= 1
            print("Toto\(FebeSingleton.sharedInstance.queue)")
        })

    }
}


struct subFebeText2 : View, Identifiable
{
    var id = UUID()
    var chatTxt : String
    var chatImg : String
    var chatName : String
   // var noOfTxt : Int = 1
    //@State var timeRemaining = 3
   // @State var trigger : Bool = false
    @State var showFace : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            if(showFace == true)
            {
            MemberFace(imageName: self.chatImg)
                
                TypingAnimationWithText(text: self.chatTxt)
            
            }
            else
            {
            Text(
                LocalizedStringKey(self.chatTxt)
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
            }

        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)//.padding()
            Text(self.chatName).font(Font.custom("Nexa Bold", size: 10)).padding(.leading, 10).padding(.top, -20)
        }
        .onReceive(timer) { _ in
            
//            if(self.timeRemaining > 0)
//            {
//            self.timeRemaining -= 1
//                print(self.timeRemaining)
//            }
        }
        .onAppear(perform: {
            //FebeSingleton.sharedInstance.queue -= 1
            print("Toto\(FebeSingleton.sharedInstance.queue)")
        })

    }
}

struct subFebeText3 : View, Identifiable
{
    var id = UUID()
    var chatTxt : String
    var chatImg : String
    var chatName : String
   // var noOfTxt : Int = 1
    //@State var timeRemaining = 3
   // @State var trigger : Bool = false
    @State var showFace : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            if(showFace == true)
            {
            MemberFace(imageName: self.chatImg)
                
                TypingAnimationWithText(text: self.chatTxt)
            
            }
            else
            {
            Text(
                LocalizedStringKey(self.chatTxt)
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
            }

        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)//.padding()
            Text(self.chatName).font(Font.custom("Nexa Bold", size: 10)).padding(.leading, 10).padding(.top, -20)
        }
        .onReceive(timer) { _ in
            
//            if(self.timeRemaining > 0)
//            {
//            self.timeRemaining -= 1
//                print(self.timeRemaining)
//            }
        }
        .onAppear(perform: {
            //FebeSingleton.sharedInstance.queue -= 1
            print("Toto\(FebeSingleton.sharedInstance.queue)")
        })

    }
}

struct subFebeText4 : View, Identifiable
{
    var id = UUID()
    var chatTxt : String
    var chatImg : String
    var chatName : String
   // var noOfTxt : Int = 1
    //@State var timeRemaining = 3
   // @State var trigger : Bool = false
    @State var showFace : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            if(showFace == true)
            {
            MemberFace(imageName: self.chatImg)
                
                TypingAnimationWithText(text: self.chatTxt)
            
            }
            else
            {
            Text(
                LocalizedStringKey(self.chatTxt)
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
            }

        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)//.padding()
            Text(self.chatName).font(Font.custom("Nexa Bold", size: 10)).padding(.leading, 10).padding(.top, -20)
        }
        .onReceive(timer) { _ in
            
//            if(self.timeRemaining > 0)
//            {
//            self.timeRemaining -= 1
//                print(self.timeRemaining)
//            }
        }
        .onAppear(perform: {
            //FebeSingleton.sharedInstance.queue -= 1
            print("Toto\(FebeSingleton.sharedInstance.queue)")
        })

    }
}


struct FebeText : View, Identifiable
{
    var id = UUID()
    var chatTxt : String
    var chatImg : String
    var chatName : String
   // var noOfTxt : Int = 1
    //@State var timeRemaining = 3
   // @State var trigger : Bool = false
    @State var showFace : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            if(showFace == true)
            {
            MemberFace(imageName: self.chatImg)
                
                TypingAnimationWithText(text: self.chatTxt)
            
            }
            else
            {
            Text(
                LocalizedStringKey(self.chatTxt)
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
            }

        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)//.padding()
            Text(self.chatName).font(Font.custom("Nexa Bold", size: 10)).padding(.leading, 10).padding(.top, -20)
        }
        .onReceive(timer) { _ in
            
//            if(self.timeRemaining > 0)
//            {
//            self.timeRemaining -= 1
//                print(self.timeRemaining)
//            }
        }
        .onAppear(perform: {
            //FebeSingleton.sharedInstance.queue -= 1
            print("Toto\(FebeSingleton.sharedInstance.queue)")
        })

    }
}






struct Febe2: View {
    @State var category:String?
    @State var txt1:String = " "
    @State var txt2:String = " "
    @State var txt3:String = " "
    @State var txt4:String = " "
    @State var txt5:String = " "
    @State var noOfTxt:Int = 0
    @State var therapyDurationIndex: Int = 11
    @State var secondFeeling: String = " "
    @State var therapy: String = " "
    @State var secondFeelingReply = 0
    @State var showTherapy = 0
    @State var therapyIndex = 0
    @State var reply2 = 0
    @State var inputBar = 0
    @State var showGoogle = 0
    @State var replyCount = 0
    @State var durationReply = 0
    @State var before6pm : Bool?
    @State var after6pm : Bool?
    @State var after9pm : Bool?
    @State var before9pm : Bool?
    @State var arrayCount : Int = 1
    @State var startCounting : Bool = false
    @State var morning : Bool?
    @State var afternoon : Bool?
    @State var evening : Bool?
    @State var feelingReply = 0
    @State var feeling: String = " "
    @State var greeting: String = " "
    @State var therapyPlaying : Bool? = false
    @State var isStudent : Bool = false
    @State var singleLine : Bool = false
    @State var isEmployed : Bool = false
    @State var flag1 : Bool = false
    @State var flag2 : Bool = false
    @State var flag3 : Bool = false
    @State var tabooAlert : Bool = false
    @State var userName : String = " "
    @State var occu : String = " "
    @State var searchWord : String = "of xbox"
    @State var positiveReply : String = " "
    @State var negativeReply : String = " "
    @State var finalReply : String = " "
    @State var lastPadding : CGFloat = -1
    @EnvironmentObject var userData: UserData
    @State var conversationArr: [FebeText] = []
    @State private var fetch = GoogleManager()
    @State var keyWordsArr: [String] = []
    @State var keyWords: [String] = ["sad","calm","grateful","angry","anxious","tired","stressed","depressed","demotivated","happy","motivated","nap","fatigued","fixate","recharge","dose","nervous","snooze","siesta","anger","pissed","agony","relief","physical","provoked","quiet","pondering","breathe","chill","afraid","fear","worry","rest","pumped","training","sport","sports","listen","attention","fail","memory","work","productivity","distraction","improved","envy","jealous","disgust","discontent","spite","bitterness","keynote","presentation","desk", "concentration","concentrate","fail","time","management","prioritization","irritated","vexed","exasperated","gratitude","thankful","exercise","conscious","life","zone","slumber","commute","travel","transit","boundaries","complete","galled","resent","resentful","wink","uneasy","unwind","peace","dream","solo","reflection","meditation","mindfulness","sleep","social","introvert","awkward","concentrate","alternative","body","scan","zone","gracious","gratitude","destress","relief","stress","exam","study","clear","mind","public","speaking","positive","affirm","fresh","air","unguided","anxiety","guided","self","relect","eyes","fast","deep","breathing","distressed","uneasy","distress","displease","displeased","aggrieved","aggrieve","go","love","yourself","myself"]
    @State var questionWords: [String] = ["can","could","shall","do","should","will","would","may","might","what"]
    @State var botVerb: String = " "
    @State var botSub: String = " "
    @State var keyWord: String = " "
    @State var firstkeyWord: String = " "
    @State var secondkeyWord: String = " "
    @State var thirdkeyWord: String = " "
    @State var fourthkeyWord: String = " "
    @State var fifthkeyWord: String = " "
    @State var keyWordCount:Int = 0
    @State var lineCount:Int = 0
    @State var timeRemaining:Int = 0
    @State var subject: [String] = ["i", "you"]
    @State var search: [String] = ["about", "of", "think", "search", "tell", "look", "know"]
    @State var taboo: [String] = ["kill", "suicide", "rope", "rape", "theft", "steal", "lie", "cheat", "fuck", "rob", "mob", "murder"]
    
    var tenMinMed: [String] = ["meditation","mindfulness","peace","stress","anxiety","relax","breathe","calm","reflect","concentration","quiet","pondering","guided"]
    var unguidedMinMed: [String] = ["meditation","mindfulness","peace","stress","anxiety","relax","breathe","calm","reflect","concentration","quiet","pondering","unguided","solo","self","reflection"]
    var fifteenSleep: [String] = ["tired","sleep","fatigued","nap","dream","rest","eyes","relax","doze","snooze","slumber","siesta","wink","recharge"]
    var tenMinFocus: [String] = ["attention","focus","concentrate","concentration","study","fixate","distraction"]
    var thirtyMinFocus: [String] = ["attention","focus","concentrate","concentration","study","fixate","distraction"]
    var studyBreak: [String] = ["study","stress","break","rest","recharge","clear","mind"]
    var onTheGo: [String] = ["breathe","walk","stress","clear","mind","fresh","air","fast","deep","breathing"]
    var destress: [String] = ["stress","destress","breathe","relief","distressed","distress","afraid"]
    var anxRelief: [String] = ["anxiety","relief","breathe","scared","anxious","fear","worry","uneasy","jitters","concerned","distress","distressed","afraid","nervous"]
    var midDayDestress: [String] = ["stress","destress","stressed","destressed","breathe","relief","distressed","distress","afraid"]
    var endOfDayUnwind: [String] = ["stressed","stress","relief","unwind","relax","end","day","chill","reflect"]
    var angerManangement: [String] = ["anger","pissed","annoyed","irritated","vexed","exasperated","resentful","displeased","displease","provoked","aggrieved","galled"]
    var postStudy: [String] = ["study","stress","stressed","break","rest","recharge","clear","mind","unwind","reflect"]
    var dayWithGrat: [String] = ["gratitude","gracious","thankful","affirm","positive"]
    var preWorkout: [String] = ["workout","exercise","zone","pumped","physical","training","sport"]
    var deadline: [String] = ["anxious","deadline","productivity","work","complete"]
    var socialEve: [String] = ["anxious","social","introvert","awkward","nervous"]
    var improveFocus: [String] = ["attention","focus","concentrate","concentration","study","fixate","distraction","improve"]
    var examStress: [String] = ["exam","stress","fail","anxious","focus","concentrate","concentration","memory","nervous"]
    var seekBalance: [String] = ["balance","time","management","prioritization"]
    var largePresentation: [String] = ["anxious","presentation","nervous","public","speaking","key","note"]
    var mindfulListen: [String] = ["listen","mindful","attention","memory","conscious"]
    var settingBound: [String] = ["time","management","prioritization","balance","boundaries","work","life"]
    var deskMed: [String] = ["meditation","mindfulness","peace","stress","anxiety","relax","breathe","calm","reflect","concentration","quiet","pondering","guided","desk","working"]
    var mindfulCommute: [String] = ["meditation","mindfulness","travel","commute","transit","go","relax"]
    var qckBodyScan: [String] = ["meditation","body","scan","mindful","alternative"]
    var selfAccept: [String] = ["acceptance","anxiety","love","yourself","depressed","depress","myself"]
    var physicalPain: [String] = ["pain","hurt","relief","agony","physical"]
    var envy: [String] = ["envy","jealous","disgust","desire","resent","discontent","spite","bitterness"]

    @State var tenMinMed1: Int = 0
    @State var unguidedMinMed1: Int = 0
    @State var fifteenSleep1: Int = 0
    @State var tenMinFocus1: Int = 0
    @State var thirtyMinFocus1: Int = 0
    @State var studyBreak1: Int = 0
    @State var onTheGo1: Int = 0
    @State var destress1: Int = 0
    @State var anxRelief1: Int = 0
    @State var midDayDestress1: Int = 0
    @State var endOfDayUnwind1: Int = 0
    @State var angerManangement1: Int = 0
    @State var postStudy1: Int = 0
    @State var dayWithGrat1: Int = 0
    @State var preWorkout1: Int = 0
    @State var deadline1: Int = 0
    @State var socialEve1: Int = 0
    @State var improveFocus1: Int = 0
    @State var examStress1: Int = 0
    @State var seekBalance1: Int = 0
    @State var largePresentation1: Int = 0
    @State var mindfulListen1: Int = 0
    @State var settingBound1: Int = 0
    @State var deskMed1: Int = 0
    @State var mindfulCommute1: Int = 0
    @State var qckBodyScan1: Int = 0
    @State var selfAccept1: Int = 0
    @State var physicalPain1: Int = 0
    @State var envy1: Int = 0
    
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    
    var weekDay : String
        {
            get {
                return (UIApplication.shared.delegate as? AppDelegate)!.dayOftheWeek
            }
        }
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 2.0){
        ScrollView(.vertical, showsIndicators: false){
            ScrollViewReader { value in
                ForEach(conversationArr, id:\.id)
        {result in
                        VStack//(spacing: 10.0)
                        {
                HStack{

                result.body
                    .id(result.id)
                            
                }.padding(.leading, 10)
                
//                            if(self.showGoogle == 1)
//                            {
//                                GoogleSearchView(searchWord: self.searchWord)//.id("a12")
//                            }
                        }
                        .onReceive (timer){ _ in
                            
                            //print("lala")
//                            if(self.showGoogle == 0)
//                            {
                            self.arrayCount = conversationArr.count
                            value.scrollTo(conversationArr[self.arrayCount-1].id)
                            //}
//                            else if(self.showGoogle == 1)
//                            {
//                                value.scrollTo("a12")
//                            }
                            print(self.replyCount)
                            
                            
                                }
        }
                            }
            

            }
        .onReceive(timer1)
            { _ in
                print("lala")
                print("Time = \(timeRemaining)")
                if(self.timeRemaining > 0 && self.singleLine == false && self.startCounting == true)
                {
                    if(noOfTxt == 4)
                    {
                        if(self.timeRemaining == 12 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt1, chatImg: "Febe", chatName: "Febe", showFace: true))
                        }
                        else if(self.timeRemaining == 8 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt2, chatImg: "Febe", chatName: "Febe", showFace: true))
                        }
                        else if(self.timeRemaining == 4 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt3, chatImg: "Febe", chatName: "Febe", showFace: true))
                        }
                        else if(self.timeRemaining == 0 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt4, chatImg: "Febe", chatName: "Febe", showFace: true))
                            //self.noOfTxt = 0
                        }
                    }
                    else if(noOfTxt == 3)
                    {
                        if(self.timeRemaining == 8 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt1, chatImg: "Febe", chatName: "Febe", showFace: true))
                        }
                        else if(self.timeRemaining == 4 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt2, chatImg: "Febe", chatName: "Febe", showFace: true))
                        }
                        else if(self.timeRemaining == 0 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt3, chatImg: "Febe", chatName: "Febe", showFace: true))
                            //self.noOfTxt = 0
                        }
                    }
                    else if(noOfTxt == 2)
                    {
                        if(self.timeRemaining == 4 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt1, chatImg: "Febe", chatName: "Febe", showFace: true))
                        }
                        else if(self.timeRemaining == 0 )
                        {
                            self.conversationArr.append(FebeText(chatTxt: self.txt2, chatImg: "Febe", chatName: "Febe", showFace: true))
                            //self.noOfTxt = 0
                        }

                    }


                    self.timeRemaining -= 1
                }
                else if(self.timeRemaining > 0 && self.singleLine == true)
                {
                self.timeRemaining -= 1
                }
            }
            if(self.showGoogle == 1)
            {
                GoogleSearchView(searchWord: self.searchWord)//.id("a12")
            }
            HStack{
                if(self.timeRemaining == 0 && self.showTherapy == 0)
                {
                GroupChatTextField(sendAction: processString)
                    .frame(alignment: .topLeading)
                }
                else if(self.showTherapy == 1)
                {
                    CustomizedCategoryRow(name: " ",items: [userData.therapies[self.therapyIndex]])
                }
            }.frame(alignment: .topLeading)
        }.onAppear(perform: {
            firstFebeText()
            
        })
    }
    
    
    func processString(key:String)
    {
        print(key)
        self.showGoogle = 0
        self.lineCount = self.lineCount+1
        self.conversationArr.append(FebeText(chatTxt: key, chatImg: "Febe", chatName: " ", showFace: false))
        let lowercase = key.lowercased()
        self.tabooAlert = false
        let splitted = lowercase.split(separator: " ")
        
        for a in 0...questionWords.count-1
        {
            if(String(splitted[0]) == questionWords[a])
            {
                print("How many")
                for n in 0...splitted.count-1
                {
                    
                    for w in 0...taboo.count-1
                    {
                        
                        if(String(splitted[n]) == taboo[w])
                        {
                            self.tabooAlert = true
                                self.flag1 =  false
                                answerQuestions(keyword: String(splitted[n]), sentence: key)
                            break
                        }
                        else if(n == splitted.count-1)
                        {
                            
                                if(self.tabooAlert == false)
                                {
                                self.flag1 =  true
                                answerQuestions(keyword: String(splitted[n]), sentence: key)
                                    break
                                }
                            
                        }
                    }
                    
//                    for k in 0...search.count-1
//                    {
//                        if(String(splitted[n]) == questionWords[k])
//                        {
//                            fetch.fetchGoogle(searchWord: key)
//                            self.conversationArr.append(FebeText(chatTxt: "These are the results I found from Google.", chatImg: "Febe", chatName: "Febe", showFace: true))
//                        }
//
//                    }
                    
                    for y in 0...questionWords.count-1
                    {
                        if(String(splitted[n]) == questionWords[y])
                        {
                            print("ok1")
                            self.botVerb = String(splitted[n])
                            if(y == questionWords.count-1)
                            {
                                self.flag2 =  true
                                //answerQuestions(keyword: String(splitted[n]))
                            }
                        }
                        else
                        {
                            if(y == questionWords.count-1)
                            {
                                self.flag2 =  true
                                //answerQuestions(keyword: String(splitted[n]))
                            }
                        }
                    }
                    
                    for z in 0...subject.count-1
                    {
                        if(String(splitted[n]) == subject[z])
                        {
                            print("ok2")
                            if(subject[z] == "i")
                            {
                                self.botSub = "you"
                                //answerQuestions(keyword: String(splitted[n]))
                            }
                            if(subject[z] == "you")
                            {
                                self.botSub = "I"
                                //answerQuestions(keyword: String(splitted[n]))
                            }
                            if(z == subject.count-1)
                            {
                                self.flag3 =  true
                                //answerQuestions(keyword: String(splitted[n]))
                            }
                        }
                        else
                        {
                            if(z == subject.count-1)
                            {
                                self.flag3 =  true
                                //answerQuestions(keyword: String(splitted[n]))
                            }
                        }
                    }
                    

                }
                
                
                
                
                return
            }
            else if((String(splitted[0]) != questionWords[a]) && (a == questionWords.count-1))
            {
                for n in 0...splitted.count-1
                {
                    
                    
                    
                    for x in 0...keyWords.count-1
                    {
                           if(String(splitted[n]) == keyWords[x])
                        {
                               self.keyWord = String(splitted[n])
                               if(self.keyWordCount == 0)
                               {
                                   self.firstkeyWord = String(splitted[n])
                                   self.determineKeyword(word: String(splitted[n]))
                                   self.keyWordCount = self.keyWordCount+1
                                   processFebeResponse(keyword: String(splitted[n]), sentence: key)
                               }
                               else if(self.keyWordCount == 1)
                               {
                                   self.secondkeyWord = String(splitted[n])
                                   self.determineKeyword(word: String(splitted[n]))
                                   self.keyWordCount = self.keyWordCount+1
                               }
                               else if(self.keyWordCount == 2)
                               {
                                   self.thirdkeyWord = String(splitted[n])
                                   self.determineKeyword(word: String(splitted[n]))
                                   self.keyWordCount = self.keyWordCount+1
                               }
                               else if(self.keyWordCount == 3)
                               {
                                   self.fourthkeyWord = String(splitted[n])
                                   self.determineKeyword(word: String(splitted[n]))
                                   self.keyWordCount = self.keyWordCount+1
                               }
                               else if(self.keyWordCount == 4)
                               {
                                   self.fifthkeyWord = String(splitted[n])
                                   self.determineKeyword(word: String(splitted[n]))
                                   self.keyWordCount = self.keyWordCount+1
                               }
                               
                               //self.keyWord = String(splitted[n])
                               // processFebeResponse(keyword: String(splitted[n]), sentence: key)
                        }
                        else if(n == splitted.count-1)
                        {
                            processFebeResponse(keyword: String(splitted[n]), sentence: key)
                            print("eel")
                            break
                        }
                           // processFebeResponse(keyword: String(splitted[n]))
                    }
                }
            }
            
        }
        
    }
    
    
    func answerQuestions(keyword: String, sentence: String)
    {
        let lowercase = sentence.lowercased()
        let splitted = lowercase.split(separator: " ")
        
        for n in 0...splitted.count-1
        {
            for x in 0...search.count-1
            {
        
                if(splitted[n] == search[x])
                {
                    //fetch.fetchGoogle(searchWord: sentence)
                    self.searchWord = sentence
                    self.conversationArr.append(FebeText(chatTxt: "These are the results I found from Google.", chatImg: "Febe", chatName: "Febe", showFace: true))
                    self.showGoogle = 1
                    break
                }
                else if(n == splitted.count-1 && x == search.count-1)
                {
        if(self.tabooAlert == true)
        {
            print("In")
            self.conversationArr.append(FebeText(chatTxt: "No, \(self.botSub) \(self.botVerb) not", chatImg: "Febe", chatName: "Febe", showFace: true))
                self.flag1 = false
            self.singleLine = true
                self.flag2 = false
                self.flag3 = false
            self.timeRemaining = 5
            //self.tabooAlert = false
        }
        else if(self.flag1 == true && self.flag2 == true && self.flag3 == true)
        {
        self.conversationArr.append(FebeText(chatTxt: "Yes, \(self.botSub) \(self.botVerb)", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "Tell me more about what you are feeling. I'll just listen and take notes", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.flag1 = false
            self.flag2 = false
            self.singleLine = true
            self.timeRemaining = 5
            self.flag3 = false
            self.tabooAlert = false
        }
                }
            }
        }
    }
    
    func determineTherapy()
    {
        let greatest = max(self.tenMinMed1,self.unguidedMinMed1,self.fifteenSleep1,self.tenMinFocus1,self.thirtyMinFocus1,self.studyBreak1,self.onTheGo1,self.destress1,self.anxRelief1,self.midDayDestress1,self.endOfDayUnwind1,self.angerManangement1,self.postStudy1,self.dayWithGrat1,self.preWorkout1,self.deadline1,self.socialEve1,self.improveFocus1,self.examStress1,self.seekBalance1,self.largePresentation1,self.mindfulListen1,self.settingBound1,self.deskMed1,self.mindfulCommute1,self.qckBodyScan1,self.selfAccept1,self.physicalPain1,self.envy1)
        print(greatest)
        
        if(greatest == self.tenMinMed1)
        {
            self.therapyIndex = 18
        }
        else if(greatest == self.unguidedMinMed1)
        {
            self.therapyIndex = 18
        }
        else if(greatest == self.fifteenSleep1)
        {
            self.therapyIndex = 17
        }
        else if(greatest == self.tenMinFocus1)
        {
            self.therapyIndex = 16
        }
        else if(greatest == self.thirtyMinFocus1)
        {
            self.therapyIndex = 16
        }
        else if(greatest == self.studyBreak1)
        {
            self.therapyIndex = 15
        }
        else if(greatest == self.onTheGo1)
        {
            self.therapyIndex = 7
        }
        else if(greatest == self.destress1)
        {
            self.therapyIndex = 14
        }
        else if(greatest == self.anxRelief1)
        {
            self.therapyIndex = 10
        }
        else if(greatest == self.midDayDestress1)
        {
            self.therapyIndex = 8
        }
        else if(greatest == self.endOfDayUnwind1)
        {
            self.therapyIndex = 11
        }
        else if(greatest == self.angerManangement1)
        {
            self.therapyIndex = 15
        }
        else if(greatest == self.postStudy1)
        {
            self.therapyIndex = 13
        }
        else if(greatest == self.dayWithGrat1)
        {
            self.therapyIndex = 21
        }
        else if(greatest == self.preWorkout1)
        {
            self.therapyIndex = 12
        }
        else if(greatest == self.deadline1)
        {
            self.therapyIndex = 19
        }
        else if(greatest == self.socialEve1)
        {
            self.therapyIndex = 20
        }
        else if(greatest == self.improveFocus1)
        {
            self.therapyIndex = 22
        }
        else if(greatest == self.examStress1)
        {
            self.therapyIndex = 25 
        }
        else if(greatest == self.seekBalance1)
        {
            self.therapyIndex = 24
        }
        else if(greatest == self.largePresentation1)
        {
            self.therapyIndex = 26
        }
        else if(greatest == self.mindfulListen1)
        {
            self.therapyIndex = 27
        }
        else if(greatest == self.settingBound1)
        {
            self.therapyIndex = 28
        }
        else if(greatest == self.deskMed1)
        {
            self.therapyIndex = 29
        }
        else if(greatest == self.mindfulCommute1)
        {
            self.therapyIndex = 31
        }
        else if(greatest == self.qckBodyScan1)
        {
            self.therapyIndex = 32
        }
        else if(greatest == self.selfAccept1)
        {
            self.therapyIndex = 33
        }
        else if(greatest == self.physicalPain1)
        {
            self.therapyIndex = 34
        }
        else if(greatest == self.envy1)
        {
            self.therapyIndex = 35
        }
    }
    
    func determineKeyword(word: String)
    {
        for a in 0...tenMinMed.count-1
        {
            if(word == tenMinMed[a])
            {
                self.keyWordsArr.append("tenMinMed")
                self.tenMinMed1 = self.tenMinMed1 + 1
            }
        }
        for b in 0...unguidedMinMed.count-1
        {
            if(word == unguidedMinMed[b])
            {
                self.keyWordsArr.append("unguidedMinMed")
                self.unguidedMinMed1 = self.unguidedMinMed1 + 1
            }
        }
        for c in 0...fifteenSleep.count-1
        {
            if(word == fifteenSleep[c])
            {
                self.keyWordsArr.append("fifteenSleep")
                self.fifteenSleep1 = self.fifteenSleep1 + 1
            }
        }
        for d in 0...tenMinFocus.count-1
        {
            if(word == tenMinFocus[d])
            {
                self.keyWordsArr.append("tenMinFocus")
                self.tenMinFocus1 = self.tenMinFocus1 + 1
            }
        }
        for e in 0...thirtyMinFocus.count-1
        {
            if(word == thirtyMinFocus[e])
            {
                self.keyWordsArr.append("thirtyMinFocus")
                self.thirtyMinFocus1 = self.thirtyMinFocus1 + 1
            }
        }
        for f in 0...studyBreak.count-1
        {
            if(word == studyBreak[f])
            {
                self.keyWordsArr.append("studyBreak")
                self.studyBreak1 = self.studyBreak1 + 1
            }
        }
        for g in 0...onTheGo.count-1
        {
            if(word == onTheGo[g])
            {
                self.keyWordsArr.append("onTheGo")
                self.onTheGo1 = self.onTheGo1 + 1
            }
        }
        for h in 0...destress.count-1
        {
            if(word == destress[h])
            {
                self.keyWordsArr.append("destress")
                self.destress1 = self.destress1 + 1
            }
        }
        for i in 0...anxRelief.count-1
        {
            if(word == anxRelief[i])
            {
                self.keyWordsArr.append("anxRelief")
                self.anxRelief1 = self.anxRelief1 + 1
            }
        }
        for j in 0...midDayDestress.count-1
        {
            if(word == midDayDestress[j])
            {
                self.keyWordsArr.append("midDayDestress")
                self.midDayDestress1 = self.midDayDestress1 + 1
            }
        }
        for k in 0...endOfDayUnwind.count-1
        {
            if(word == endOfDayUnwind[k])
            {
                self.keyWordsArr.append("endOfDayUnwind")
                self.endOfDayUnwind1 = self.endOfDayUnwind1 + 1
            }
        }
        for l in 0...angerManangement.count-1
        {
            if(word == angerManangement[l])
            {
                self.keyWordsArr.append("angerManagement")
                self.angerManangement1 = self.angerManangement1 + 1
            }
        }
        for m in 0...postStudy.count-1
        {
            if(word == postStudy[m])
            {
                self.keyWordsArr.append("postStudy")
                self.postStudy1 = self.postStudy1 + 1
            }
        }
        for n in 0...dayWithGrat.count-1
        {
            if(word == dayWithGrat[n])
            {
                self.keyWordsArr.append("dayWithGrat")
                self.dayWithGrat1 = self.dayWithGrat1 + 1
            }
        }
        for o in 0...preWorkout.count-1
        {
            if(word == preWorkout[o])
            {
                self.keyWordsArr.append("preWorkout")
                self.preWorkout1 = self.preWorkout1 + 1
            }
        }
        for p in 0...deadline.count-1
        {
            if(word == deadline[p])
            {
                self.keyWordsArr.append("deadline")
                self.deadline1 = self.deadline1 + 1
            }
        }
        for q in 0...socialEve.count-1
        {
            if(word == socialEve[q])
            {
                self.keyWordsArr.append("socialEve")
                self.socialEve1 = self.socialEve1 + 1
            }
        }
        for r in 0...improveFocus.count-1
        {
            if(word == improveFocus[r])
            {
                self.keyWordsArr.append("improveFocus")
                self.improveFocus1 = self.improveFocus1 + 1
            }
        }
        for s in 0...examStress.count-1
        {
            if(word == examStress[s])
            {
                self.keyWordsArr.append("examStress")
                self.examStress1 = self.examStress1 + 1
            }
        }
        for t in 0...seekBalance.count-1
        {
            if(word == seekBalance[t])
            {
                self.keyWordsArr.append("seekBalance")
                self.seekBalance1 = self.seekBalance1 + 1
            }
        }
        for u in 0...largePresentation.count-1
        {
            if(word == largePresentation[u])
            {
                self.keyWordsArr.append("largePresentation")
                self.largePresentation1 = self.largePresentation1 + 1
            }
        }
        for v in 0...mindfulListen.count-1
        {
            if(word == mindfulListen[v])
            {
                self.keyWordsArr.append("mindfulListen")
                self.mindfulListen1 = self.mindfulListen1 + 1
            }
        }
        for w in 0...settingBound.count-1
        {
            if(word == settingBound[w])
            {
                self.keyWordsArr.append("settingBound")
                self.settingBound1 = self.settingBound1 + 1
            }
        }
        for x in 0...deskMed.count-1
        {
            if(word == deskMed[x])
            {
                self.keyWordsArr.append("deskMed")
                self.deskMed1 = self.deskMed1 + 1
            }
        }
        for y in 0...mindfulCommute.count-1
        {
            if(word == mindfulCommute[y])
            {
                self.keyWordsArr.append("mindfulCommute")
                self.mindfulCommute1 = self.mindfulCommute1 + 1
            }
        }
        for z in 0...qckBodyScan.count-1
        {
            if(word == qckBodyScan[z])
            {
                self.keyWordsArr.append("qckBodyScan")
                self.qckBodyScan1 = self.qckBodyScan1 + 1
            }
        }
        for aa in 0...selfAccept.count-1
        {
            if(word == selfAccept[aa])
            {
                self.keyWordsArr.append("selfAccept")
                self.selfAccept1 = self.selfAccept1 + 1
            }
        }
        for bb in 0...physicalPain.count-1
        {
            if(word == physicalPain[bb])
            {
                self.keyWordsArr.append("physicalPain")
                self.physicalPain1 = self.physicalPain1 + 1
            }
        }
        for cc in 0...envy.count-1
        {
            if(word == envy[cc])
            {
                self.keyWordsArr.append("envy")
                self.envy1 = self.envy1 + 1
            }
        }
    }
    
    func processFebeResponse(keyword: String, sentence: String)
    {
        print(keyword)
        
        let lowercase = sentence.lowercased()
        let splitted = lowercase.split(separator: " ")
        
        for n in 0...splitted.count-1
        {
            for x in 0...search.count-1
            {
        
                if(splitted[n] == search[x])
                {
                   // fetch.fetchGoogle(searchWord: sentence)
                    self.searchWord = sentence
                    self.conversationArr.append(FebeText(chatTxt: "These are the results I found from Google.", chatImg: "Febe", chatName: "Febe", showFace: true))
                    self.showGoogle = 1
                    print("eel1")
                   break
                }
                else if(n == splitted.count-1 && x == search.count-1 )
                {
        if(self.replyCount == 1)
        {
            self.conversationArr.append(FebeText(chatTxt: "We would like to recommend you this therapy below.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.timeRemaining = 5
            self.showTherapy = 1
            self.singleLine = true
            //print("1")
        }
        else if(keyword == "tired" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "It's normal to feel tired but we can help you.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "Do you want to feel rejuvenated?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.determineTherapy()
           // self.therapyIndex = 17
            self.showTherapy = 1
            self.singleLine = true
            self.timeRemaining = 5
        }
        else if(keyword == "sad" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "I'm sorry to hear that but how we can help you? Want to cheer yourself up?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "Can we uplift your mood?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.singleLine = true
            self.determineTherapy()
            self.showTherapy = 1
            //self.therapyIndex = 18
            self.timeRemaining = 5
        }
        else if(keyword == "calm" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "Great. How we can help you feel better?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "Do you want to do a meditation session?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.singleLine = true
            //self.therapyIndex = 18
            self.showTherapy = 1
            self.determineTherapy()
            self.timeRemaining = 5
        }
        else if(keyword == "grateful" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "Way to go. How we can help you feel better?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "Do you want to feel more focused and productive?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.singleLine = true
            self.showTherapy = 1
            //self.therapyIndex = 16
            self.determineTherapy()
            self.timeRemaining = 5
        }
        else if(keyword == "angry" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "How we can help you calm down? How do you want to feel?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "Can we calm you down?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.singleLine = true
            self.timeRemaining = 5
            //self.therapyIndex = 9
            self.determineTherapy()
        }
        else if(keyword == "anxious" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "Sure. How we can help you clear your mind? Do you want a calm and sound mind?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "How about an anxiety relief?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.singleLine = true
            self.determineTherapy()//self.therapyIndex = 34
            self.timeRemaining = 5
        }
        else if(keyword == "stressed" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "We will help you. Do you want to feel relieved? We can destress you. Do you want to continue?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.singleLine = true
            self.determineTherapy()// self.therapyIndex = 33
            self.timeRemaining = 5
        }
        else if(keyword == "depressed" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "It's very sad to hear that. Can we help you feel happier?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.singleLine = true
            self.determineTherapy()//self.therapyIndex = 18
            self.timeRemaining = 5
        }
        else if(keyword == "demotivated" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "We can help you with your motivation. Ready?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.determineTherapy()// self.therapyIndex = 16
            self.singleLine = true
            self.timeRemaining = 5
        }
        else if(keyword == "motivated" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "Great how we can serve you? Do you want to feel even better?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.singleLine = true
            self.determineTherapy()//self.therapyIndex = 29
            self.timeRemaining = 5
        }
        else if(keyword == "happy" && self.lineCount > 4)
        {
                self.conversationArr.append(FebeText(chatTxt: "It's one of the most soothing feelings how we can help you feel better?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.conversationArr.append(FebeText(chatTxt: "How do you want to feel after the session?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
            self.showTherapy = 1
            self.singleLine = true
            self.determineTherapy()//self.therapyIndex = 25
            self.timeRemaining = 5
        }
        else if(self.lineCount > 4)
        {
            self.timeRemaining = 5
            let random = Int.random(in: 0...11)
            if(random == 0)
            {
            self.conversationArr.append(FebeText(chatTxt: "Sure, we have what's right for you. Shall we start?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
                self.showTherapy = 1
                self.singleLine = true
                self.determineTherapy()//  self.therapyIndex = 16
            }
            else if(random == 1)
            {
            self.conversationArr.append(FebeText(chatTxt: "Sure. I see. Do you want to start the therapy?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
                self.showTherapy = 1
                self.singleLine = true
                        self.determineTherapy()//elf.therapyIndex = 18
            }
            else if(random == 2)
            {
            self.conversationArr.append(FebeText(chatTxt: "Right. Shall we start the therapy?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 1
                self.showTherapy = 1
                self.singleLine = true
                self.determineTherapy()//self.therapyIndex = 35
            }
            else if(random == 3)
            {
            self.conversationArr.append(FebeText(chatTxt: "I get you. Let's start the therapy. ", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 4)
            {
            self.conversationArr.append(FebeText(chatTxt: "Here we go with the therapy.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 5)
            {
            self.conversationArr.append(FebeText(chatTxt: "Thanks for explaining talking with me. Let's start", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 6)
            {
            self.conversationArr.append(FebeText(chatTxt: "That's concludes the diagnosis. Here we go.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 7)
            {
            self.conversationArr.append(FebeText(chatTxt: "That's it. Let's start without further ado.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 8)
            {
            self.conversationArr.append(FebeText(chatTxt: "Shall we begin?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 9)
            {
            self.conversationArr.append(FebeText(chatTxt: "This is what I've got in mind for you", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 10)
            {
            self.conversationArr.append(FebeText(chatTxt: "Thanks for this long conversation. Here is the therapy.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 11)
            {
            self.conversationArr.append(FebeText(chatTxt: "Thank you and this therapy might suit you.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.showTherapy = 1
                self.determineTherapy()//self.therapyIndex = 25
                self.singleLine = true
            }
        }
        else
        {
            self.timeRemaining = 5
            let random = Int.random(in: 0...16)
            if(random == 0)
            {
            self.conversationArr.append(FebeText(chatTxt: "Sure, keep going. Tell me more. Anything else you are feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 16
            }
            else if(random == 1)
            {
            self.conversationArr.append(FebeText(chatTxt: "Got it. Wanna tell me more so that I can recommend you better? If you are bored, you can ask me about other things too.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 18
            }
            else if(random == 2)
            {
            self.conversationArr.append(FebeText(chatTxt: "Right. Do you want to share me more? It makes the therapy more accurate", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 35
            }
            else if(random == 3)
            {
            self.conversationArr.append(FebeText(chatTxt: "I get you. Anything else? You can ask me about things in general too. ", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 4)
            {
            self.conversationArr.append(FebeText(chatTxt: "Right I understand it. Anything more?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 18
            }
            else if(random == 5)
            {
            self.conversationArr.append(FebeText(chatTxt: "You can tell me more. I won't share it with anyone.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 35
            }
            else if(random == 6)
            {
            self.conversationArr.append(FebeText(chatTxt: "I see. We can talk about other things too if you like or at least I can look it up.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 7)
            {
            self.conversationArr.append(FebeText(chatTxt: "We can talk about this further.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 18
            }
            else if(random == 8)
            {
            self.conversationArr.append(FebeText(chatTxt: "Right. Do you have more to share?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
                self.singleLine = true
            //self.therapyIndex = 35
            }
            else if(random == 9)
            {
            self.conversationArr.append(FebeText(chatTxt: "This session has been rewarding. Wanna tell more.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 10)
            {
            self.conversationArr.append(FebeText(chatTxt: "I'm thinking of a therapy for you. Care to elaborate further?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 11)
            {
            self.conversationArr.append(FebeText(chatTxt: "Interesting. Can you explain further?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 12)
            {
            self.conversationArr.append(FebeText(chatTxt: "It would be better if I can know more about this.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 13)
            {
            self.conversationArr.append(FebeText(chatTxt: "Great. Anything else?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 14)
            {
            self.conversationArr.append(FebeText(chatTxt: "May I know more about this please?", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 15)
            {
            self.conversationArr.append(FebeText(chatTxt: "That's interesting. Go on.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 16)
            {
            self.conversationArr.append(FebeText(chatTxt: "You can talk a lot more. Don't stop now. The more you talk the better.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
            else if(random == 17)
            {
            self.conversationArr.append(FebeText(chatTxt: "Trust me to keep the secret. Elaborate further.", chatImg: "Febe", chatName: "Febe", showFace: true))
            self.replyCount = 0
            //self.therapyIndex = 25
                self.singleLine = true
            }
        }
                }
            }
            
        }
        
        
    }
    
 
    
    
    
    
    func firstFebeText()
    {
        let docRef = db.collection("Users").document(uid)
        let number = Int.random(in: 1...5)
        let number1 = Int.random(in: 1...5)
        let number2 = Int.random(in: 1...5)
        let random = Int.random(in: 1...3)
        
        if(random == 1)
        {
            self.timeRemaining = 5
            self.noOfTxt = 2
        }
        else if(random == 2)
        {
            self.timeRemaining = 9
            self.noOfTxt = 3
        }
        else if(random == 3)
        {
            self.timeRemaining = 13
            self.noOfTxt = 4
        }
        

        let finalTxt = "How are you feeling today?"

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                self.occu = docData!["occupation"] as? String ?? " "
            
            }
            else {
                print("Document does not exist")
            }
        }
        
        if(number == 1 && random >= 1)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite1 = "How are things going? Best of luck to you"
                self.txt1 = polite1
                //self.noOfTxt += 1
        //self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
        if(random == 1)
        {
            self.txt2 = finalTxt
            //self.noOfTxt += 1
            self.startCounting = true
            //self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
            FebeSingleton.sharedInstance.queue += 1
        }
            }
            else
            {
                let polite1 = "How are things going?"
                self.txt1 = polite1
                //self.noOfTxt += 1
                //self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                if(random == 1)
                {
                    self.txt2 = "How's are you feeling today?"
                    self.startCounting = true
                    //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                    FebeSingleton.sharedInstance.queue += 1
                }
            }
        }
        else if(number == 2 && random >= 1)
        {
        let polite1 = "Good day to you"
            self.txt1 = polite1
            self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
            FebeSingleton.sharedInstance.queue += 1
            if(random == 1)
            {
                self.txt2 = "How's your mind's weather feeling today?"
                self.startCounting = true
                // self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
        }
        else if(number == 3 && random >= 1)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite1 = "Welcome back. I am Febe. Hope you remember me. What's up?"
                self.txt1 = polite1
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 1)
            {
                self.txt2 = finalTxt
                self.startCounting = true
//                self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite1 = "Welcome back. I am Febe. How can we help you?"
                self.txt1 = polite1
                
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 1)
                    {
                        self.txt2 = "How's your mind's weather feeling today?"
                        self.startCounting = true
                        // self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number == 4 && random >= 1)
        {
        let polite1 = "Nice to have you back"
            self.txt1 = polite1
            //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
            FebeSingleton.sharedInstance.queue += 1
            if(random == 1)
            {
                self.txt2 = "How's your mind's feeling today?"
                self.startCounting = true
                //self.noOfTxt += 1// self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
        }
        else if(number == 5 && random >= 1)
        {
            let rand = Int.random(in: 1...3)
            if(rand == 1)
            {
        let polite1 = "Great meeting you. I am waiting to help you. What can I do for you?"
                self.txt1 = polite1
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 1)
            {
                self.txt2 = "How are you today?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else if(rand == 2)
            {
                let polite1 = "It's a great thing meeting you. What can I do for you?"
                self.txt1 = polite1
                
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 1)
                    {
                        self.txt2 = "How's your mind's weather feeling today?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
            else
            {
                let polite1 = "I've been waiting to help you. How are things going on?"
                self.txt1 = polite1
                // self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite1, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 1)
                    {
                        self.txt2 = finalTxt
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        
        if(number1 == 1 && random >= 2)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite2 = "Hope you are having a good day and we have all the therapies you need. What's up?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 2)
            {
                self.txt3 = finalTxt
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else if(rand == 2)
            {
                let polite2 = "Hope you are having a good day. How are you today?"
                self.txt2 = polite2
               // self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 2)
                    {
                        self.txt3 = "How's your mind's today?"
                        self.startCounting = true// self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number1 == 2 && random >= 2)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
                
        let polite2 = "Great day to enjoy a therapy with us. How's it going?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 2)
            {
                self.txt3 = "How's are you feeling today?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite2 = "It's a great day to enjoy a therapy with us. What's your mood today?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 2)
                    {
                        self.txt3 = "How are you today? How are you feeling?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number1 == 3 && random >= 2)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite2 = "Hope the weather outside is fine and inside of you is too. How's your mood lately?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 2)
            {
                self.txt3 = finalTxt
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite2 = "Hope your mind is in a clear state too. How are you feeling lately?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 2)
                    {
                        self.txt3 = "How's your mind feeling today?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number1 == 4 && random >= 2)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite2 = "It is one fine day to do a mental wellness therapy. What therapy would you like today?"
                self.txt2 = polite2
               // self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 2)
            {
                self.txt3 = "How are you feeling today?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite2 = "It is a great time for a therapy. Which one therapy do you have in mind today?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 2)
                    {
                        self.txt3 = finalTxt
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
                
            }
        }
        else if(number1 == 5 && random >= 2)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite2 = "Are you ready to enjoy a therapy session with us? How's your mood?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 2)
            {
                self.txt3 = "How are you today? How are you feeling?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite2 = "Get ready. How are you today?"
                self.txt2 = polite2
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite2, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 2)
                    {
                        self.txt3 = "How's your mind's today?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How's your mind's weather feeling today?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        
        if(number2 == 1 && random == 3)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite3 = "Without further ado, Let's get started with our therapy. How's your mood?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 3)
            {
                self.txt4 = "How are you today? How are you feeling?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite3 = "Without further ado, Let's start. Which therapy do you have in mind?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 3)
                    {
                        self.txt4 = "How's your mood today? How are you feeling?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number2 == 2 && random == 3)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite3 = "Let me prepare a therapy for you. How are things going on?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 3)
            {
                self.txt4 = "How are you today? Are you fine? How are you feeling?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite3 = "Let me find a therapy perfect for you. Are you in a good mood today?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 3)
                    {
                        self.txt4 = "How are you today? How are you feeling?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number2 == 3 && random == 3)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite3 = "Let me know how you feel so that I will recommend a therapy for you?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 3)
            {
                self.txt4 = "How is everything today? How are you feeling?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite3 = "Let me know how you feel?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 3)
                    {
                        self.txt4 = "How are you today? How are you feeling?"
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number2 == 4 && random == 3)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite3 = "I am ready to help you. Are you ready? How's your mood?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 3)
            {
                self.txt4 = "How are you today? How are you feeling?"
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: "How are you today? How are you feeling?", chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite3 = "I am ready to help you. Which state is your mind currently in?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 3)
                    {
                        self.txt4 = finalTxt
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        else if(number2 == 5 && random == 3)
        {
            let rand = Int.random(in: 1...2)
            if(rand == 1)
            {
        let polite3 = "Let's enjoy a therapy session together. Are you feeling great today?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            if(random == 3)
            {
                self.txt4 = finalTxt
                self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
            }
            }
            else
            {
                let polite3 = "Let's enjoy a session. How are you today?"
                self.txt3 = polite3
                //self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: polite3, chatImg: "Febe", chatName: "Febe", showFace: true))
                FebeSingleton.sharedInstance.queue += 1
                    if(random == 3)
                    {
                        self.txt4 = finalTxt
                        self.startCounting = true//self.noOfTxt += 1//self.conversationArr.append(FebeText(chatTxt: finalTxt, chatImg: "Febe", chatName: "Febe", showFace: true))
                        FebeSingleton.sharedInstance.queue += 1
                    }
            }
        }
        
        

        
    }
    
        
    
    func randomizeResponse()
    {
        self.secondFeeling = " "
        self.therapy = " "
        self.secondFeelingReply = 0
        self.showTherapy = 0
        self.reply2 = 0
        self.inputBar = 0
        self.replyCount = 0
        self.durationReply = 0
        self.feelingReply = 0
        self.lastPadding = -1
        let lang = UserDefaults.standard.string(forKey: "lang") ?? "en"
        self.userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
        self.occu = UserDefaults.standard.string(forKey: "occupation") ?? "User"
        self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
        self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
        self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)
        if(self.morning == true)
        {
            self.greeting = "Good morning"
        }
        else if(self.afternoon == true)
        {
            self.greeting = "Good afternoon"
        }
        else if(self.evening == true)
        {
            self.greeting = "Good evening"
        }
        else
        {
            self.greeting = "Good morning"
        }
        if(self.occu == "Full time Student" || self.occu == "Part time Student")
        {
            self.isStudent = true
        }
        if(self.occu == "Full time Employed" || self.occu == "Part time Employed")
        {
            self.isEmployed = true
        }

        self.before6pm = evaluateTime(from: 6,to: 18, toMinutes: 0, toSeconds: 0)
        self.after6pm = evaluateTime(from: 18,to: 23, toMinutes: 59, toSeconds: 59)
        self.after9pm = evaluateTime(from: 21,to: 23, toMinutes: 59, toSeconds: 59)
        self.before9pm = evaluateTime(from: 6,to: 21, toMinutes: 0, toSeconds: 0)
        //before then after and if both conditions are not met, therapy for after.
        
        Analytics.setScreenName("Watson", screenClass: "Main")
    }
    
    
    func evaluateTime(from: Int, to: Int, toMinutes: Int, toSeconds: Int) -> Bool
    {

    let calendar = Calendar.current
    let now = Date()
    let from_today = calendar.date(
      bySettingHour: from,
      minute: 0,
      second: 0,
      of: now)!

    let to_today = calendar.date(
      bySettingHour: to,
      minute: toMinutes,
      second: toSeconds,
      of: now)!

    if now >= from_today &&
      now <= to_today
    {
        return true
    }
    else
    {
        return false
    }
    }
}


