//
//  ConsultView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 27/12/21.
//

import SwiftUI

struct ConsultView: View {
    @State var typingMessage: String = ""
    @ObservedObject private var keyboard = KeyboardResponder()
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(0..<2) { _ in
                    ChatBubble(message: Message.preview)
                }
            }.listStyle(.inset)
            HStack {
                TextField("Message...", text: $typingMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))
                Button {
                   
                }label: {
                    Text("Send")
                }
            }
            .frame(minHeight: CGFloat(50)).padding()
            .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        }.onTapGesture {
            self.endEditing(true)
        }
    }
}

struct ConsultView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultView()
    }
}
