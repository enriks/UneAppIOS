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
    
    func prueba(){
        
            
            //print(path)
            let baseDeDatos = FMDatabase(path: "/Users/manuelcoto/Documents/GitHub/UneAppIOS/Prueba-GoogleSignIn/UneAppDatabase.db")
            if baseDeDatos.open(){
                print("bieen")
                do {
                    let result: FMResultSet? = try baseDeDatos.executeQuery("select * from Eventos", values: nil)
                    
                    while result?.next() == true {
                        print("nomames",result?.string(forColumn: "nombreEvento"))
                    }
                }catch{
                    
                }
            }else{
                print("mal")
            }
        
            
            //print(archivo)
        
        
    }
}
