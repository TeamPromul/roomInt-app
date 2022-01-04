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
        Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 100))
                .foregroundColor(Color.primaryColor)
        Text("Design Berhasil Diupload")
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Kembali ke halaman utama")
                    .font(.system(size: 17))
                    .padding(.horizontal)
            }.buttonStyle(PrimaryButtonStyle())
        }.padding()
    }
}

struct SuccedModalView_Previews: PreviewProvider {
    static var previews: some View {
        SuccedModalView()
    }
}
