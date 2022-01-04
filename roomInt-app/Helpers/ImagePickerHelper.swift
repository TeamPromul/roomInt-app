//
//  ImagePickerHelper.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import SwiftUI
import UIKit

struct ImagePickerHelper: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var pickerResult: [UIImage]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerHelper>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerHelper>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePickerHelper

        init(_ parent: ImagePickerHelper) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.pickerResult.append(image)
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

    }

}
