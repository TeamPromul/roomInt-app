//
//  SuccedModalView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import SwiftUI

struct SuccedModalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 200))
                    .foregroundColor(Color.primaryColor)
                Text("Uploaded Successfully")
            }
            Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Back to Main Page")
                        .font(.system(size: 17))
                        .padding(.horizontal)
                }
                .buttonStyle(PrimaryButtonStyle())
        }.padding()
    }
}

struct SuccedModalView_Previews: PreviewProvider {
    static var previews: some View {
        SuccedModalView()
    }
}
