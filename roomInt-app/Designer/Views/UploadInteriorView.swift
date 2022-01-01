//
//  UploadInteriorView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct UploadInteriorView: View {
    @State var title = ""
    @State var category = Category.livingRoom.rawValue
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: Text("Design Interior")) {
                    TextField("Title",text: $title)
                    Picker(selection: $category, label: Text("Select Category")) {
                        ForEach(Category.allCases, id: \.id) { categories in
                            Text(categories.rawValue.capitalized)
                        }
                    }
                }
            }
        }
    }
}

struct UploadInteriorView_Previews: PreviewProvider {
    static var previews: some View {
        UploadInteriorView()
    }
}
