//
//  cameraView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI

struct cameraView: View {
    @State private var isShow = false
    @State private var image: Image = Image(systemName: "person.fill.badge.plus")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    self.isShow.toggle()
                    self.sourceType = .camera
                } label: {
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 170, height: 150)
                        .padding()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isShow) {
            AccessCamera(isShow: self.$isShow, myImage: self.$image, mySourceType: self.$sourceType)
        }
    }
}

struct cameraView_Previews: PreviewProvider {
    static var previews: some View {
        cameraView()
    }
}
