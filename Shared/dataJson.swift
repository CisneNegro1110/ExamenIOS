//
//  DataJson.swift
//  ExamenIOS (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 22/07/22.
//

import Foundation

struct dataJson: Decodable {
    let reporte: [Reporte]
    let empresas: [Empresas]
}
struct Reporte: Decodable, Hashable {
    let valor: String
    let cantidad: String
}
struct Empresas: Decodable, Hashable {
    let nombre: String
    let porcentaje: Int
}

