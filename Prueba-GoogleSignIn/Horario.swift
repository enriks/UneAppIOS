//
//  Horario.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 18/4/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class Horario{
    //MARK: Properties
    var Aula: String
    var Profesor: String
    var HoraComienzo: String
    var HoraFin: String
    
    //MARK: Inicializacion
    init?(aula: String, profesor: String, horaComienzo: String, horaFin: String) {
        //Iniciar debe fallar si no tiene nombre o si no tiene rating lol
        guard !aula.isEmpty else{
            return nil
        }
        guard !profesor.isEmpty else{
            return nil
        }
        guard !horaComienzo.isEmpty else{
            return nil
        }
        guard !horaFin.isEmpty else{
            return nil
        }
        //Inicializando las propiedades guardadas
        self.Aula = aula
        self.Profesor = profesor
        self.HoraFin = horaFin
        self.HoraComienzo = horaComienzo
    }
}
