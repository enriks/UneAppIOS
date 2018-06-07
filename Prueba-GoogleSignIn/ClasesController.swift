//
//  ClasesController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 14/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class Clases{
    
    var nombreClase: String
    var idClase : Int32
    var progreso: Float
    
    init?(nombre: String, progres: Float, id: Int32){
        guard !nombre.isEmpty else {
            return nil
        }
        self.nombreClase = nombre
        self.progreso = progres
        self.idClase = id
        print(self.progreso)
    }
}
