//
//  ContentView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 09/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.secondaryColor
            Text("Hello, world!")
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
