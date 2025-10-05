//
//  ChatTextField.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 4/2/20.


import SwiftUI

struct ChatTextField: View {
    let sendAction: (String) -> Void
    
    @State private var messageText = ""

    private func sendButtonTapped() {
      sendAction(messageText)
      messageText = ""
    }
    
    var body: some View {
        HStack {
          TextField("Your Name...", text: $messageText)
            .frame(height: 60).padding(.leading, 20)
          
          Button(action: sendButtonTapped) {
            //Image("send_message")
              //.resizable()
                Text("OK").frame(width: 25, height: 25).padding(.trailing, 25)
          }
        }.frame(width: UIScreen.main.bounds.width)
        .padding([.leading, .trailing])
        .background(Color.black)
    }
}

struct SearchTextField: View {
    let sendAction: (String) -> Void
    
    @State private var messageText = ""

    private func sendButtonTapped() {
      sendAction(messageText)
      messageText = ""
    }
    var body: some View {
        HStack {
            TextField("Song...", text: $messageText)
            .frame(height: 60).padding(.leading, 20)
          
          Button(action: sendButtonTapped) {
            //Image("send_message")
              //.resizable()
                Text("Search").frame(width: 100, height: 50).padding(.trailing, 25)
          }
        }.frame(width: UIScreen.main.bounds.width/1.05)
        .padding([.leading, .trailing])
        //.background(Color.black)
        .environment(\.colorScheme, .dark)
    }
}

struct GroupChatTextField: View {
    let sendAction: (String) -> Void
    
    @State private var messageText = ""

    private func sendButtonTapped() {
      sendAction(messageText)
      messageText = ""
    }
    var body: some View {
        HStack {
            TextField("Message", text: $messageText)
            .frame(height: 60).padding(.leading, 20)
          
          Button(action: sendButtonTapped) {
            //Image("send_message")
              //.resizable()
                Text("Send").frame(width: 100, height: 50).padding(.trailing, 25)
          }
        }.frame(width: UIScreen.main.bounds.width/1.05)
        .padding([.leading, .trailing])
        //.background(Color.black)
        .environment(\.colorScheme, .dark)
    }
}

//struct ExchangeTextField: View {
//    let sendAction: (String) -> Void
//    
//    @State private var messageText = ""
//
//    private func sendButtonTapped() {
//      sendAction(messageText)
//      messageText = ""
//    }
//    var body: some View {
//        HStack {
//            TextField(".....", text: $messageText)
//            .frame(height: 100).padding(.leading, 20)
//          
//          Button(action: sendButtonTapped) {
//            //Image("send_message")
//              //.resizable()
//                Text("Send").frame(width: 100, height: 50).padding(.trailing, 25)
//          }
//        }.frame(width: UIScreen.main.bounds.width/1.05)
//        .padding([.leading, .trailing])
//        //.background(Color.black)
//        .environment(\.colorScheme, .dark)
//    }
//}

struct ChatTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
          Spacer()
          ChatTextField(sendAction: { _ in })
        }.previewLayout(.fixed(width: 300, height: 80))
    }
}
