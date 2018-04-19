//
//  Noticias.swift
//  EsquemaApp
//
//  Created by Manuel Coto on 27/3/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class Noticias{
    //MARK: Properties
    var nombre: String
    var foto: UIImage?
    var descripcion: String
    
    //MARK: Inicializacion
    init?(nombre: String, foto: UIImage?, descripcion: String) {
        //Iniciar debe fallar si no tiene nombre o si no tiene rating lol
        guard !nombre.isEmpty else{
            return nil
        }
        guard !descripcion.isEmpty else{
            return nil
        }
        //Inicializando las propiedades guardadas
        self.nombre = nombre
        self.foto = foto
        self.descripcion = descripcion
    }
    
}
