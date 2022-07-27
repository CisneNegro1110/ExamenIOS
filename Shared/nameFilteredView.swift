//
//  nameFilteredView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI
import Combine

struct nameFilteredView: View {
    @Binding var name: String
    var body: some View {
        TextField("Name", text: $name)
            .autocapitalization(.words)
            .disableAutocorrection(true)
            .onReceive(Just(name)) { value in
                let filtered = value.filter {$0.isLetter || $0.isWhitespace}
                if filtered != value {
                    self.name = "\(filtered)"
                }
            }
    }
}
