//
//  UploadInteriorView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI
import LoadingButton

struct UploadInteriorView: View {
    @StateObject private var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showImagePicker: Bool = false
    @State private var showActionSheet = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
    
    var style = LoadingButtonStyle(width: .infinity,
                                   height: 50,
                                   cornerRadius: 20,
                                   backgroundColor: Color.secondaryColor,
                                   loadingColor: Color.secondaryColor.opacity(0.5),
                                   strokeWidth: 5,
                                   strokeColor: .white)
    
    var body: some View {
        VStack(alignment: .center) {
            if viewModel.image == [] {
                Image(systemName: "square.dashed.inset.filled")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height/3)
                    .scaledToFill()
                    .padding(.bottom, 10.0)
                    .foregroundColor(Color.primaryColor)
                    .padding()
                
            } else {
                if let image = viewModel.image {
                    Image(uiImage: image[0])
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height/3)
                        .scaledToFill()
                        .padding(.bottom, 10.0)
                }
            }
            uploadButton()
            Form {
                Section(header: Text("Description")) {
                    TextField("Title",text: $viewModel.title)
                    TextField("Price", text: $viewModel.price)
                    Picker(selection: $viewModel.category, label: Text("Select Category")) {
                        ForEach(Category.allCases, id: \.self) { categories in
                            Text(categories.rawValue.capitalized)
                        }
                    }
                }
                
            }
            
            LoadingButton(action: {
                viewModel.placeOrder()
            }, isLoading: $viewModel.doneUpload, style: style) {
                Text("Upload")
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding(.horizontal)
            
            .fullScreenCover(isPresented: $viewModel.isPresented, onDismiss: {
                presentationMode.wrappedValue.dismiss()
            }) {
                SuccedModalView()
            }
        }
    }
    
    @ViewBuilder func uploadButton() -> some View {
        Button("Add Image"){
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
