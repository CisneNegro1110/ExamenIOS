//
//  cameraView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI

struct cameraView: View {
    @State private var isShow = false
    @Binding var image: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @StateObject var storageVM = FirebaseViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    self.isShow.toggle()
                    self.sourceType = .camera
                } label: {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                                .scaledToFit()
                                .frame(width: 170, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .foregroundColor(.blue)
                    } else {
                        Image(systemName: "person.badge.plus")
                            .resizable()
                                .scaledToFit()
                                .frame(width: 170, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .foregroundColor(.blue)
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isShow) {
            AccessCamera(isShow: self.$isShow, myImage: self.$image, mySourceType: self.$sourceType)
        }
    }
}
