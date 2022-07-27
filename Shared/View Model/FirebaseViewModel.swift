//
//  FirebaseViewModel.swift
//  ExamenIOS
//
//  Created by Jesús Francisco Leyva Juárez on 25/07/22.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI
class FirebaseViewModel: ObservableObject {
    
    func saveImage(image:UIImage?, nombre: String) {
        let storage = Storage.storage().reference()
        let metadata = StorageMetadata()
        let directorio = storage.child("\(nombre)")
        metadata.contentType = "image/png"
        if nombre == "" {
            print("Nombre Vacio")
            return
        }
        if image != nil {
            guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
            directorio.putData(imageData, metadata: metadata) { metadata, err in
                if let err = err {
                    print(err, "ERROR")
                    return
                }
            }
        } else {
            print("No se ha seleccionado ninguna imagen")
            return
        }
    }
}
