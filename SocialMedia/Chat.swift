//
//  Chat.swift
//  LifeBeats
//
//  Created by User on 8/8/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//


//struct ContentView: View {
//    let colors: [Color] = [.red, .green, .blue]
//
//    var body: some View {
//        ScrollView {
//            ScrollViewReader { value in
//                Button("Jump to #8") {
//                    value.scrollTo(8, anchor: .top)
//                }
//                .padding()
//
//                ForEach(0..<100) { i in
//                    Text("Example \(i)")
//                        .font(.title)
//                        .frame(width: 200, height: 200)
//                        .background(colors[i % colors.count])
//                        .id(i)
//                }
//            }
//        }
//        .frame(height: 350)
//    }
//}


import SwiftUI
import FirebaseAnalytics
import Firebase
import NaturalLanguage


class ChatSingleton
{
    static let sharedInstance = ChatSingleton()
    var blocked = false
    var lastWritten = " "
    var finalText = " "
    var blockedID = " "
    var blockedTxt = " "
    var popUp = false
}
struct ChatText : View, Identifiable
{
    var id = UUID()
    var chatTxt : String
    var userID : String
    var chatImg : String
    var chatName : String
   // var rept : Bool? = true
    //let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   // @State var timeRemaining = 0
  @State var showFace : Bool = false
    @State var popup : Bool = false
   // @State var start = true
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            if(showFace == true)
            {
            MemberFace(imageName: self.chatImg)
            }
            VStack(alignment: .leading)
        {
                Text(self.chatTxt).foregroundColor(.white)
                    .font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false))
        }
            Button(action:{ChatSingleton.sharedInstance.popUp = true; ChatSingleton.sharedInstance.blockedID = userID; ChatSingleton.sharedInstance.blockedTxt = chatTxt  })
            {
        Image(systemName: "ellipsis").resizable().frame(width: 25, height: 5)
            }
//            Button(action:{ChatSingleton.sharedInstance.blocked = true})
//            {
//                Text("Block").font(Font.custom("Nexa Bold", size: 11))
//            }.padding(.leading,5)
//            Button(action:{print("report")})
//            {
//                Text("Report").font(Font.custom("Nexa Bold", size: 11))
//            }.padding(.leading,5)
//            if(self.popup == false)
//            {
//                Button(action:{self.popup = true; print("112233")})
//                {
//            Image(systemName: "ellipsis").resizable().frame(width: 25, height: 5)
//                }
//            }
//            else
//            {
//                HStack
//                {
//                                Button(action:{ChatSingleton.sharedInstance.blocked = true})
//                                {
//                                    Text("Block").font(Font.custom("Nexa Bold", size: 10)).foregroundColor(.white)
//                                }
//                    Text("|").font(Font.custom("Nexa Bold", size: 10))
//                                Button(action:{print("report")})
//                                {
//                                    Text("Report").font(Font.custom("Nexa Bold", size: 10)).foregroundColor(.white)
//                                }
//                    Text("|").font(Font.custom("Nexa Bold", size: 10))
//                    Button(action:{self.popup = false})
//                                {
//                                    Text("x").font(Font.custom("Nexa Bold", size: 10)).foregroundColor(.white)
//                                }
//                }.clipShape(FeelingBubble())
//            }
        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)//.padding()
            Text(self.chatName).font(Font.custom("Nexa Bold", size: 10)).padding(.leading, 10).padding(.top, -20)
        }

    }
}

struct Chat: View {
    
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    @State var text1:String = " "
    @State var conversationArr: [ChatText] = []
    @State var blockedID: [String] = []
    @State var tempBlock : String = " "
    let groupName = "Lifebeats"
    @State var mainText = " "
    @State var mainName = " "
    @State var mainID = " "
    //@State var lastID = " "
    @State var isMember:Bool = true
    let tagger = NLTagger(tagSchemes: [.lexicalClass])
    let txt = "I am net."
    @State var result = " "
    @State var dangerLvl:Int = 0
    @State var lastText:String = " "
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 0
    @State var count = 0
    @State var stopFetching = false
    @State var showGuide = false
    @State var load : Bool = false
    @State var totalLoaded : Int = 0
    @State var arrayCount : Int = 3
    @State var lastID  = " "
    @State var popup : Bool = false
    @State var firstLoad : Bool = false
    @State var lastPadding : CGFloat = -1
    @State var separateBannedWords: [String] = ["have sex","soy boy","right wing","left wing","orange man","proud boys","neck beard","red neck","ching chong","Have sex","Have Sex","Soy boy","Right wing","Left wing","Orange man","Neck beard","Red neck","Ching chong","N word","N Word","tin-foil head","Tin-foil Head","tin foil head","tin-foil head","Mother Fucker","Mother fucker","mother fucker"]//Nobody writes more than 100 dialogs in 30 mins
    @State var yellowDanger: [String] = ["come","cunt","Cunt","cunts","CUNTS","use","join","try","end","kill","die","hang","our","another","to","leave","other","visit","Come","Use","End","Join","Try","Our","Another","Kill","Die","Hang","To","Other","Visit","Leave","COME","END","USE","JOIN","TRY","OUR","ANOTHER","TO","OTHER","VISIT","LEAVE","KILL","DIE","HANG"]
    @State var oneBannedWord: [String] = ["anal","Anal","anus","Anus","Doggy","doggy","bitch","Bitch","titty","Titty","Titts","tits","titts","ginger","Ginger","nword","NWord","whore","Whore","Chingchong","Cunt","Shit","Shitty","Dick","Pussy","Vagina","Ginger","Wanker","Ass","Sucks","Arse","Faggot","Penis","Idiot","Zealot","Bigot","Nutjob","Tits","Boobs","n-word","N-word","Redneck","Rightwing","Leftwing","Pedo","Orangeman","Fuck","Nigga","shag","SHAG","Negro","Proud boys","fucker","fcker","fuker","ching","chong","Proudboys","proudboys","Motherfucker","MotherFucker","motherfucker","Motherfcker","motherfcker","Motherfuck","motherfuck","MotherFuck","Motherfck","motherfck","Motherfuk","motherfuk","MotherFuk","Nazi","Hitler","Neckbeard","Vegay","Libtard","Soyboy","Tits","Boobs","chingchong","cunt","shit","Shitty","dick","pussy","vagina","ginger","wanker","ass","sucks","arse","faggot","penis","idiot","zealot","bigot","nutjob","redneck","proudboys","neckbeard","orangeman","fuck","nigga","negro","rightwing","leftwing","pedo","vegay","libtard","soyboy","fck","Fck","Fuck","fuk","Fuk","App","APP","FUCK","FUK","FCK","ANAL","ANUS","ANUS","DOGGY","DOGGY","BITCH","BITCH","TITTY","TITTY","TITTS","TITS","TITTS","GINGER","GINGER","NWORD","NWORD","WHORE","WHORE","CHINGCHONG","CUNT","SHIT","SHITTY","DICK","PUSSY","VAGINA","GINGER","WANKER","ASS","SUCKS","ARSE","FAGGOT","PENIS","IDIOT","ZEALOT","BIGOT","NUTJOB","TITS","BOOBS","N-WORD","N-WORD","REDNECK","RIGHTWING","LEFTWING","PEDO","ORANGEMAN","FUCK","NIGGA","NEGRO","PROUD BOYS","SHAG","PROUDBOYS","PROUDBOYS","MOTHERFUCKER","MOTHERFUCKER","MOTHERFUCKER","MOTHERFCKER","MOTHERFCKER","MOTHERFUCK","MOTHERFUCK","MOTHERFUCK","MOTHERFCK","MOTHERFCK","MOTHERFUK","MOTHERFUK","MOTHERFUK","NAZI","HITLER","NECKBEARD","VEGAY","LIBTARD","SOYBOY","TITS","BOOBS","CHINGCHONG","CUNT","SHIT","SHITTY","DICK","PUSSY","VAGINA","GINGER","WANKER","ASS","SUCKS","ARSE","FAGGOT","PENIS","IDIOT","ZEALOT","BIGOT","NUTJOB","REDNECK","PROUDBOYS","NAZI","HITLER","NECKBEARD","ORANGEMAN","FUCK","NIGGA","NEGRO","RIGHTWING","LEFTWING","PEDO","VEGAY","LIBTARD","SOYBOY","FCK","FCK","FUCK","FUK","FUK","APP","APP"]
    @State var dialogueLimit:Int = 0
    
    var body: some View {
        VStack(spacing: 2.0){
            ZStack{
                

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
                
            }
//                        .onAppear(perform: {
//                            value.scrollTo(conversationArr.last?.id)
//                        })
//                        .onTapGesture {
//                            value.scrollTo(conversationArr.last?.id)
//                        }
                        .onReceive (timer){ _ in
                            
                            self.arrayCount = conversationArr.count
                            value.scrollTo(conversationArr[self.arrayCount-1].id)
                        }
        }

            }
        }//.padding(.top, -lastPadding) //test this
            
                
                
            if(self.popup == true)
            {
                            VStack
                            {
                                Button(action:{print(ChatSingleton.sharedInstance.blockedID);
                                    self.block(id: ChatSingleton.sharedInstance.blockedID); ChatSingleton.sharedInstance.popUp = false;
                                })
                                            {
                                                Text("   Block  ").font(Font.custom("Nexa Bold", size: 11)).foregroundColor(.white)
                                            }.padding()
                                Text("_").font(Font.custom("Nexa Bold", size: 10))
                                Button(action:{print("report"); self.report(id: ChatSingleton.sharedInstance.blockedID, txt: ChatSingleton.sharedInstance.blockedTxt); ChatSingleton.sharedInstance.popUp = false;})
                                            {
                                                Text("  Report  ").font(Font.custom("Nexa Bold", size: 11)).foregroundColor(.white)
                                            }.padding()
                                Text("_").font(Font.custom("Nexa Bold", size: 10))
                                Button(action:{ChatSingleton.sharedInstance.popUp = false})
                                            {
                                                Text("  Cancel  ").font(Font.custom("Nexa Bold", size: 11)).foregroundColor(.white)
                                }.padding()
                            }.clipShape(FeelingBubble()).background(Color.black).frame(width: 350, height: 350, alignment: .trailing)
            }
            }
            HStack{
                GroupChatTextField(sendAction: newLine)
                    .frame(alignment: .topLeading)
            }.frame(alignment: .topLeading)
        }
       // .navigationBarTitle("LifebeatsMain")
        .onAppear(perform: {
            //lastRead()
            //memberValidation()
            //loadText()
            UIApplication.shared.applicationIconBadgeNumber = 0
            DispatchQueue.main.async {


            loadBlocked()
            }

            Analytics.setScreenName("Chat", screenClass: "Community")
        })
//        .onDisappear(perform: {
//            self.recordLastRd()
//        })
        .onReceive(timer) { _ in
            self.count = self.count + 1
            if(self.stopFetching == false && self.count%2 == 0 && self.firstLoad == true)
            {
                DispatchQueue.main.async {
           updateChat()
                }
            }
            if(self.timeRemaining > 0)
            {
            self.timeRemaining = self.timeRemaining - 1
            }
            if(ChatSingleton.sharedInstance.popUp == true)
            {
                self.popup = true
            }
            if(ChatSingleton.sharedInstance.popUp == false)
            {
                self.popup = false
            }
//            if(ChatSingleton.sharedInstance.blocked == true)
//            {
//                self.conversationArr.removeAll()
//                self.lastPadding = -1
//                loadText()
//            ChatSingleton.sharedInstance.blocked = false
//            }
        }.sheet(isPresented: $showGuide)
        {
            CommunityGuideline()
        }
        
    }
    
    func block(id:String)
    {
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["totalBlocked"] as? Int ?? 0
                let latestBlocked = old+1
                let ref = self.db.collection("Users").document(uid).setData([ "totalBlocked" : latestBlocked ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added1")
                                    
                                    let ref1 = self.db.collection("Users").document(uid).setData([ "\(latestBlocked)BlockedID" : id ], merge: true){ err in
                                                    if let err = err {
                                                        print("Error adding document: \(err)")
                                                    } else {
                                                        //print("Document added with ID: \(ref!.documentID)")
                                                        print("added2")
                                                        DispatchQueue.main.async {
                                                            
                                                        self.conversationArr.removeAll()
                                                        }
                                                            loadBlocked()
                                                    }
                                                }
                                }
                            }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
//    func recordLastRd()
//    {
//
//        let docRef = db.collection("Groups").document("\(groupName)Queue")
////        print(self.blockedID[0])
//       // print("lala\(blockedID.count)")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let old = docData!["total messages"] as? Int ?? 0
//
//                let ref1 = self.db.collection("Users").document(uid).setData([ "lastRead" : old ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added2")
//
//                                }
//                            }
//
//
//            }
//
//        }
//
//    }
    func report(id:String, txt:String)
    {
        let docRef = db.collection("Groups").document("SusTopics")
        let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["totalReport"] as? Int ?? 0
                
                let ref = self.db.collection("Groups").document("SusTopics").setData([ "\(String(old+1))ReportID" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
                let ref1 = self.db.collection("Groups").document("SusTopics").setData([ "\(String(old+1))ReportText" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
                let ref2 = self.db.collection("Groups").document("SusTopics").setData([ "totalReport" : old+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
            }
        }
    }
    
    private func newLine(key:String)
    {
        DispatchQueue.main.async {
            self.breakString(key: key)
        }
    }
    
    func breakString(key:String)
    {
        if(dialogueLimit < 3)
        {
            self.dialogueLimit = dialogueLimit+1
            self.timeRemaining = 10
            print(key.split(separator: " "))
            let lowercase = key.lowercased()
            print(lowercase)
            self.dangerLvl = 0
            if(key == "")
            {
                return
            }
            let splitted = lowercase.split(separator: " ")
            print(splitted.count)
            if(splitted.count > 100)
            {
                return
            }
            for n in 0...splitted.count-1
            {
                for x in 0...oneBannedWord.count-1
                {
                    if(splitted[n]==oneBannedWord[x])
                    {
                        print("banned")
                        return
                    }
                }
                for x in 0...yellowDanger.count-1
                {
                    if(splitted[n]==yellowDanger[x])
                    {
                        self.dangerLvl = self.dangerLvl+1
                        print("level \(self.dangerLvl)")
                        recordDanger(text: key)
                    }
                }
            }
            let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
            DispatchQueue.main.async {
                
            self.conversationArr.append(ChatText.init(chatTxt: key, userID: uid, chatImg: "user1", chatName : userName))
            }
            self.lastText = key
            recordGroupChat(word: key)
            ChatSingleton.sharedInstance.finalText = key
            lastReadUpdate()
            self.lastPadding = self.lastPadding+100
            self.hideKeyboard()

        }
        else if(dialogueLimit >= 3 && self.timeRemaining == 0)
        {
        self.dialogueLimit = 1
        print(key.split(separator: " "))
        self.dangerLvl = 0
            let lowercase = key.lowercased()
        if(key == "")
        {
            return
        }
        let splitted = lowercase.split(separator: " ")
        print(splitted.count)
        if(splitted.count > 100)
        {
            return
        }
        for n in 0...splitted.count-1
        {
            for x in 0...oneBannedWord.count-1
            {
                if(splitted[n]==oneBannedWord[x])
                {
                    print("banned")
                    return
                }
            }
            for x in 0...yellowDanger.count-1
            {
                if(splitted[n]==yellowDanger[x])
                {
                    self.dangerLvl = self.dangerLvl+1
                    print("level \(self.dangerLvl)")
                    recordDanger(text: key)
                }
            }
        }
        let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
            DispatchQueue.main.async {
                
            
        self.conversationArr.append(ChatText.init(chatTxt: key, userID: uid, chatImg: "user1", chatName : userName))
            }
        self.lastText = key
        recordGroupChat(word: key)
        ChatSingleton.sharedInstance.finalText = key
        lastReadUpdate()
        self.lastPadding = self.lastPadding+100
        self.hideKeyboard()
        }
    }
    
    func lastReadUpdate()
    {
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["lastRead"] as? Int ?? self.totalLoaded
                let latestText = old+1
                ChatSingleton.sharedInstance.lastWritten = uid
                let ref = self.db.collection("Users").document(uid).setData([ "lastRead" : latestText ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
            }
            else {
                print("Document does not exist")
            }
        }
        
    }
    
    func recordDanger(text:String)
    {
        let docRef = db.collection("Groups").document("SusTopics")
        let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["total"] as? Int ?? 0
                
                let ref = self.db.collection("Groups").document("SusTopics").setData([ String(old+1) : text ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
                
                let ref1 = self.db.collection("Groups").document("SusTopics").setData([ "\(String(old+1))Name" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
                let ref2 = self.db.collection("Groups").document("SusTopics").setData([ "\(String(old+1))ID" : uid ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
                let ref3 = self.db.collection("Groups").document("SusTopics").setData([ "total" : old+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
            }
        }
    }
    
    
    func tagString()
    {
        tagger.string = txt
        tagger.enumerateTags(in: txt.startIndex..<txt.endIndex, unit: .word, scheme: .lexicalClass, options: [.omitPunctuation, .omitPunctuation])
        {(tag,range) -> Bool in
            if let lexicalTag = tag
            {
                result += txt[range] + "\(lexicalTag.rawValue)"
            }
return true
        }
        print(result)
    }
    
    func loadBlocked()
    {
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["totalBlocked"] as? Int ?? 0
                let guide = docData!["showedComGuide"] as? Bool ?? false
               // let latestBlocked = old+1
                if(guide == false)
                {
                    self.showGuide = true
                    let ref = self.db.collection("Users").document(uid).setData([ "showedComGuide" : true ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added")
                                    }
                                }
                }
                
                if(old>1)
                {
                    for n in 1...old
                    {
                        self.tempBlock = docData!["\(n)BlockedID"] as? String ?? " "
                        self.blockedID.append(self.tempBlock)
                        if(n == old)
                        {
                            loadText()
                        }
                    }
                }
                else if(old == 1)
                {
                    self.tempBlock = docData!["1BlockedID"] as? String ?? " "
                    self.blockedID.append(self.tempBlock)
                    loadText()
                }
                else
                {
                    loadText()
                }
//
//        let ref = self.db.collection("Users").document(uid).setData([ "totalBlocked" : latestBlocked ], merge: true){ err in
//                        if let err = err {
//                            print("Error adding document: \(err)")
//                        } else {
//                            //print("Document added with ID: \(ref!.documentID)")
//                            print("added")
//
//
//
//
//                        }
//                    }
            }
        }
    }
    
    func loadText()
    {
        let docRef = db.collection("Groups").document("\(groupName)Queue")
//        print(self.blockedID[0])
       // print("lala\(blockedID.count)")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["total messages"] as? Int ?? 0
                let blockedCount  =  self.blockedID.count
                
                let ref = self.db.collection("Users").document(uid).setData([ "lastRead" : old ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added2")

                                }
                            }
                
                self.totalLoaded = old
                if(old <= 100)
                {
                    for n in 1...old
                    {
//                        if(n>6)
//                        {
//                            self.lastPadding = self.lastPadding+50
//                        }
                        docRef.getDocument { (document, error) in
                            if let document = document, document.exists {
                                let docData = document.data()
                              //  DispatchQueue.main.async {
                                    
                                self.mainText = docData![String(n)] as? String ?? "?"
                                self.mainName = docData!["\(String(n))Name"] as? String ?? "?"
                                self.mainID = docData!["\(String(n))ID"] as? String ?? "?"
                                    
                                if(blockedCount == 0)
                                {
                                    ChatSingleton.sharedInstance.lastWritten = docData!["\(String(n))ID"] as? String ?? "0"
                                    ChatSingleton.sharedInstance.finalText = docData![String(n)] as? String ?? "0"
                                    self.conversationArr.append(ChatText.init(chatTxt: self.mainText, userID: self.mainID, chatImg: "user1", chatName : self.mainName))


                                    self.lastText = docData![String(n)] as? String ?? "?"
                                    //self.firstLoad = true
                                }
                                else
                                {
                                    
                                    for x in 0...blockedCount-1
                                    {

                                        if(self.mainID == blockedID[x])
                                        {
                                            return
                                        }
                                        else if(x == blockedCount-1)
                                            {
                                    ChatSingleton.sharedInstance.lastWritten = docData!["\(String(n))ID"] as? String ?? "0"
                                    ChatSingleton.sharedInstance.finalText = docData![String(n)] as? String ?? "0"
                                    self.conversationArr.append(ChatText.init(chatTxt: self.mainText, userID: self.mainID, chatImg: "user1", chatName : self.mainName))
                                

                                    self.lastText = docData![String(n)] as? String ?? "?"
                                        }
                                    }
                                }
                                
                                if(n == old)
                                {
                                    self.firstLoad = true
                                }
                                //}
                                //}
                                
                            }
                            else
                            {
                                print("error")
                            }
                            

                            
                        }
                    }
                }
                else
                {
                    for n in (old-100)...old
                    {
//                        if(n>6)
//                        {
//                            self.lastPadding = self.lastPadding+50
//                        }
                        docRef.getDocument { (document, error) in
                            if let document = document, document.exists {
                                let docData = document.data()
                                
                               // DispatchQueue.main.async {
                                    
                                self.mainText = docData![String(n)] as? String ?? "?"
                                self.mainName = docData!["\(String(n))Name"] as? String ?? "?"
                                self.mainID = docData!["\(String(n))ID"] as? String ?? "?"
                                    
                                if(blockedCount == 0)
                                {
                                    ChatSingleton.sharedInstance.lastWritten = docData!["\(String(n))ID"] as? String ?? "0"
                                    ChatSingleton.sharedInstance.finalText = docData![String(n)] as? String ?? "0"
                                    self.conversationArr.append(ChatText.init(chatTxt: self.mainText, userID: self.mainID, chatImg: "user1", chatName : self.mainName))


                                    self.lastText = docData![String(n)] as? String ?? "?"
                                }
                                else
                                {
                                    
                                    for x in 0...blockedCount-1
                                    {

                                        if(self.mainID == blockedID[x])
                                        {
                                            return
                                        }
                                        else if(x == blockedCount-1)
                                            {
                                    ChatSingleton.sharedInstance.lastWritten = docData!["\(String(n))ID"] as? String ?? "0"
                                    ChatSingleton.sharedInstance.finalText = docData![String(n)] as? String ?? "0"
                                    self.conversationArr.append(ChatText.init(chatTxt: self.mainText, userID: self.mainID, chatImg: "user1", chatName : self.mainName))
                                

                                    self.lastText = docData![String(n)] as? String ?? "?"
                                        }
                                    }
                                }
                                if(n == old)
                                {
                                    self.firstLoad = true
                                }
                                //}
                                //}
                                
                            }
                            else
                            {
                                print("error")
                            }
                            
                        }
                    }
                }
            }
            else {
                print("Document does not exist")
            }
        }
        
    }
    
    func memberValidation()
    {
        let docRef1 = db.collection("Users").document(uid)
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                self.isMember = docData!["isMemberOf\(groupName)"] as? Bool ?? false
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
    func recordChat()
    {
        if(self.isMember == true)
        {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        let hrStr = String(hour)
        let minStr = String(minutes)
        let secStr = String(second)
        
        let ref = db.collection("UsageLog").document(uid).setData([ "\(hrStr)\(minStr)\(secStr)" : self.text1 ], merge: true){ err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        //print("Document added with ID: \(ref!.documentID)")
                        print("added")
                    }
                }
        }
    }
    
    func recordGroupChat(word:String)
    {
        print("reached")
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        //let groupName = "Lifebeats"
        let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
        
        let hrStr = String(hour)
        let minStr = String(minutes)
        let secStr = String(second)
        
        let docRef = db.collection("Groups").document("\(groupName)Queue")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["total messages"] as? Int ?? 0
                
                
                let ref = self.db.collection("Groups").document("\(groupName)Queue").setData([ String(old+1) : word ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    let ref1 = db.collection("Groups").document("LifebeatsLog").setData([ "\(userName)\(day)\(month)\(year)\(hrStr)\(minStr)\(secStr)" : word ], merge: true){ err in
                                                if let err = err {
                                                    print("Error adding document: \(err)")
                                                } else {
                                                    //print("Document added with ID: \(ref!.documentID)")
                                                    print("added1")
                                                }
                                            }
                                }
                            }
                
                
                let ref1 = self.db.collection("Groups").document("\(groupName)Queue").setData([ "\(String(old+1))Name" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added2")
                                    
                                }
                            }
                
                let ref2 = self.db.collection("Groups").document("\(groupName)Queue").setData([ "\(String(old+1))ID" : uid ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
                let ref3 = self.db.collection("Groups").document("\(groupName)Queue").setData([ "total messages" : old+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                }
                            }
                
            }
            else {
                print("Document does not exist")
            }
        }
        
    }
    
    func lastRead()
    {
        //let docRef = db.collection("Groups").document("\(groupName)Queue")
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["lastRead"] as? Int ?? self.totalLoaded
                
                let docRef1 = db.collection("Groups").document("\(groupName)Queue")
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                self.lastText = docData![String(old)] as? String ?? "0"
                        ChatSingleton.sharedInstance.lastWritten = docData!["\(String(old))ID"] as? String ?? "0"
                        ChatSingleton.sharedInstance.finalText = docData![String(old)] as? String ?? "0"
                let latestText = old+1
                let ref = self.db.collection("Users").document(uid).setData([ "lastRead" : latestText ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.stopFetching = false
                                }
                            }
                    }
                    
                }
                
            }
            else {
                print("Document does not exist")
            }
        }
        
    }
    
    func updateChat()
    {
        self.stopFetching = true
        let docRef = db.collection("Groups").document("\(groupName)Queue")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["total messages"] as? Int ?? 0
                
                let oldTxt = docData![String(old)] as? String ?? "??"
                let ID = docData!["\(String(old))ID"] as? String ?? "?"
                let name = docData!["\(String(old))Name"] as? String ?? "?"
                if(self.lastText != oldTxt)
                {
                    
                DispatchQueue.main.async
                {
                    self.conversationArr.append(ChatText.init(chatTxt: oldTxt, userID: ID, chatImg: "user1", chatName : name))
                    self.lastPadding = self.lastPadding+100
                }
                 lastRead()
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
}

//struct Chat_Previews: PreviewProvider {
//    static var previews: some View {
//        Chat()
//    }
//}
