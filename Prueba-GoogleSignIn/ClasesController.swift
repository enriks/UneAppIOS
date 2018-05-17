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
    var progreso: Float
    
    init?(nombre: String, progres: Float){
        guard !nombre.isEmpty else {
            return nil
        }
        self.nombreClase = nombre
        self.progreso = progres
        print(self.progreso)
    }
}
