//
//  AccesCamera.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import Foundation
import UIKit
import SwiftUI

struct AccessCamera: UIViewControllerRepresentable {
    @Binding var isShow: Bool
    @Binding var myImage: UIImage?
    @Binding var mySourceType: UIImagePickerController.SourceType
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<AccessCamera>) {
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AccessCamera>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mySourceType
        obj.delegate = context.coordinator
        return obj
    }
    
    func makeCoordinator() -> CoordinatorCamara {
        return CoordinatorCamara(isShow: $isShow, myImage: $myImage)
    }
    
}
