//
//  UploadInteriorView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct UploadInteriorView: View {
    @StateObject private var viewModel: ViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Form {
                Section(header: Text("Design Interior")) {
                    TextField("Title",text: $viewModel.title)
                    TextField("Price", text: $viewModel.price)
                    Picker(selection: $viewModel.category, label: Text("Select Category")) {
                        ForEach(Category.allCases, id: \.self) { categories in
                            Text(categories.rawValue.capitalized)
                        }
                    }
                }
            }
            
            Button {
                viewModel.placeOrder { <#DocumentReference#> in
                    <#code#>
                }
            }label: {
                Text("Upload")
                    .padding(.horizontal, 80)
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

//struct UploadInteriorView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadInteriorView(inter: )
//    }
//}
