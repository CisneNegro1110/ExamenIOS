//
//  ContentView.swift
//  Shared
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm : NetworkViewModel
    var body: some View {
        NavigationView {
            VStack {
                BarChartView(data:
                                ChartData(values: [("Si",60),("No",40)]),
                             title: "Sucursal limpia",
                             cornerImage: Image(systemName: "trash.square"))
//                ForEach(vm.reporte, id: \.self) { data in
//                    HStack {
//                        Text(data.valor)
//                        Text(data.cantidad)
//                    }
//                }
                BarChartView(data:
                                ChartData(values:
                                            [("Electra",30),("Banco Azteca",15),("Neto",15),("UPAX",25),("Dragon",10),("Otro",5)]),
                             title:"Medidas de seguridad",
                             cornerImage:Image(systemName: "lock.shield.fill"))
//                ForEach(vm.empresas, id: \.self) { data in
//                    HStack {
//                        Text(data.nombre)
//                        Spacer()
//                        Text("\(data.porcentaje)%")
//                    }
//                }
            }
        }
    }
}
