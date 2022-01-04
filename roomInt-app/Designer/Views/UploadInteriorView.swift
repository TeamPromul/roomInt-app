//
//  UploadInteriorView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct UploadInteriorView: View {
    @StateObject private var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showImagePicker: Bool = false
    @State private var showActionSheet = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isPresented = false
    
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
                if viewModel.image == [] {
                    Image(systemName: "square.dashed.inset.filled")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.bottom, 10.0)
                        .foregroundColor(Color.primaryColor)
                } else {
                    if let image = viewModel.image {
                        Image(uiImage: image[0])
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding(.bottom, 10.0)
                    }
                }
                uploadButton()
            }
            
            Button {
                viewModel.placeOrder()
                self.isPresented.toggle()
            }label: {
                Text("Upload")
                    .padding(.horizontal, 80)
            }
            .buttonStyle(PrimaryButtonStyle())
            .fullScreenCover(isPresented: $isPresented, onDismiss: {
                presentationMode.wrappedValue.dismiss()
            }) {
                SuccedModalView()
            }
        }
    }
    
    @ViewBuilder func uploadButton() -> some View {
        Button("Unggah"){
            self.showActionSheet.toggle()
        }
        
        .sheet(isPresented: $showImagePicker) {            ImagePickerHelper(sourceType: sourceType, pickerResult: $viewModel.image)
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Choose mode"),
                message: Text("Please choose your preferred mode to set your profile image"),
                buttons: [
                    .default(Text("Camera")) {
                        self.showImagePicker.toggle()
                        self.sourceType = .camera
                    },
                    .default(Text("Photo Library")) {
                        self.showImagePicker.toggle()
                        self.sourceType = .photoLibrary
                    },
                    .cancel()
                ]
            )
        }
    }
    
}


struct UploadInteriorView_Previews: PreviewProvider {
    static var previews: some View {
        UploadInteriorView()
    }
}
