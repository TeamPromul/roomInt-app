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
            Button {
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Kembali ke halaman utama")
                    .padding(.horizontal)
            }.buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct SuccedModalView_Previews: PreviewProvider {
    static var previews: some View {
        SuccedModalView()
    }
}
