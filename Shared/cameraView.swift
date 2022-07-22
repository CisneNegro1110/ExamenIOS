//
//  cameraView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI

struct cameraView: View {
    @State private var isShow = false
    @State private var image: Image = Image(systemName: "person.badge.plus")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    var body: some View {
            VStack {
                image.resizable()
                          .frame(width: 250, height: 200)
                          .clipShape(Circle())
                          .overlay(Circle().stroke(Color.white, lineWidth: 4))
                          .shadow(radius: 10)
                Button("Camera") {
                    self.isShow.toggle()
                    self.sourceType = .camera
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
