//
//  Registros.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 15/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import Foundation

class Registros{
    var nombreClase: String
    var fecha: String
    
    init?(clase: String, fecha: String) {
        guard !clase.isEmpty else{
            return nil
        }
        guard !fecha.isEmpty else {
            return nil
        }
        self.nombreClase = clase
        self.fecha = fecha
    }
}
