//
//  principalView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI

struct principalView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    nameFilteredView()
                    cameraView()
                }  
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct principalView_Previews: PreviewProvider {
    static var previews: some View {
        principalView()
    }
}

