//
//  nameFilteredView.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI
import Combine

struct nameFilteredView: View {
    @State private var name = ""
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

struct nameFilteredView_Previews: PreviewProvider {
    static var previews: some View {
        nameFilteredView()
    }
}
