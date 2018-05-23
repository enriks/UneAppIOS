//
//  DataBaseController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 10/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import Foundation
import SQLite3
import FMDB

class DatabaseController {
    var path: String = "/Users/manuelcoto/Documents/GitHub/UneAppIOS/Prueba-GoogleSignIn/UneAppDatabase.db"
    
    
    func prueba(){
        let baseDeDatos = FMDatabase(path: path)
            
            //print(path)
        
            if baseDeDatos.open(){
                print("bieen")
                do {
                    let result: FMResultSet? = try baseDeDatos.executeQuery("select * from Eventos", values: nil)
                    
                    while result?.next() == true {
                        print("nomames",result?.string(forColumn: "nombreEvento") as Any)
                    }
                }catch{
                    
                }
            }else{
                print("mal")
            }
    }
    
    func ingresoRegistro(idEvento: Int, fecha: String, enviado: Int, estado: Int ){
        let baseDatos = FMDatabase(path: path)
        let insertQuery = "insert into registros(idEvento,fecha,enviado,estado) values (?,?,?,?)"
        let valores = [idEvento,fecha,enviado,estado] as [Any]
        if baseDatos.open(){
            do{
                try baseDatos.executeUpdate(insertQuery, values: valores)
            }catch{
                print("pues no se inserto")
                print(baseDatos.lastErrorMessage())
            }
        }
    }
    
    
}
