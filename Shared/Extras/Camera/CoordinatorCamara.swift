//
//  CoordinatorCamara.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import Foundation
import SwiftUI
import UIKit

class CoordinatorCamara: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var isShow: Bool
    @Binding var myImage: UIImage?
    init(isShow: Binding<Bool>, myImage: Binding<UIImage?>) {
        _isShow = isShow
        _myImage = myImage
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        myImage = info[.originalImage] as? UIImage
        isShow = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShow = false
    }
}
