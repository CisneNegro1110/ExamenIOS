//
//  principalView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI

struct principalView: View {
    @State private var btnGraficas = false
    @StateObject var vm = NetworkViewModel()
    @State private var image: UIImage?
    @StateObject var storageVM = FirebaseViewModel()
    @State private var nombre = ""
   
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Section("") {
                    nameFilteredView(name: $nombre)
                }
                Section("") {
                    cameraView(image: $image)
                }
                Section("") {
                    
                    Button("Graficas") {
                        
                        self.storageVM.saveImage(image: image, nombre: nombre)
                        self.btnGraficas.toggle()
                    }.buttonStyle(.bordered)
                }
                Spacer()
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .navigationTitle("Prueba")
        }
        .sheet(isPresented: $btnGraficas) {
            ChartView(vm: vm)
        }
        .task {
            await vm.fetchData()
        }
    }
}

struct principalView_Previews: PreviewProvider {
    static var previews: some View {
        principalView()
    }
}

