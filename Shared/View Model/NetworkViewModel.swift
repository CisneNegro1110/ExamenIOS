//
//  Network.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 25/07/22.
//

import Foundation

class NetworkViewModel: ObservableObject {
    @Published var reporte = [Reporte]()
    @Published var empresas = [Empresas]()
    @Published var cantDouble = [Double]()

    @MainActor
    func fetchData() async {
        let urlString = "https://s3.amazonaws.com/dev.structure.files/examen/ios/test.json"
        guard let url = URL(string: urlString) else {
            print("Error con el URL!")
            return
        }
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decode = try? JSONDecoder().decode(dataJson.self, from: data)
        self.reporte = decode?.reporte ?? [Reporte(valor: "", cantidad: "")]
        self.empresas = decode?.empresas ?? [Empresas]()
        chartData()
    }
    func chartData() {
        empresas.forEach { empresa in
            let cantPorcentaje = Double(empresa.porcentaje)
            self.cantDouble.append(cantPorcentaje)
        }
        print("\(cantDouble)")
    }
}
