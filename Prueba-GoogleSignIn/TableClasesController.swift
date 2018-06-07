//
//  TableClasesController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 14/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit
import os.log
import FMDB

class TableClasesController: UITableViewController {
    var clases = [Clases]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        cargarClases()
    }
    func cargarClases(){
        print("estoy aca")
        let basededatos = FMDatabase(path: AppDelegate.Usuario.path)
        print(AppDelegate.Usuario.path)
        if basededatos.open(){
            do {
                let resultado: FMResultSet? = try basededatos.executeQuery("select Eventos._id id, Eventos.nombreEvento nombre, progreso_asistencia.horasAlumno horasAlumno, progreso_asistencia.horasEvento horasEvento from Eventos, registros, progreso_asistencia where Eventos._id = registros.idEvento and progreso_asistencia.idEvento=registros.idEvento", values: nil)
                var progreso: Float
                var horasalumno: Double
                var horasevento: Double
                while resultado?.next() == true{
                    horasalumno = (resultado?.double(forColumn: "horasAlumno"))!
                    horasevento = (resultado?.double(forColumn: "horasEvento"))!
                    progreso = (Float(horasalumno/horasevento))
                    print(progreso)
                    clases += [Clases(nombre: (resultado?.string(forColumn: "nombre"))!, progres:progreso,id: (resultado?.int(forColumn: "id"))!)!]
                    print("estoy aca")
                }
            }catch{
                print("error en la query")
            }
        }else{
            print("mal no se abrio la base de datos")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identificadorCelda = "ClasesCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identificadorCelda, for: indexPath) as? TableViewClasesCellController else {
            fatalError("jadiansdasodjnas")
        }
        // Configure the cell...
        let clase = clases[indexPath.row]
        cell.nombreClaselbl.text = clase.nombreClase
        print(clase.progreso)
        cell.progresoAlumno.setProgress(clase.progreso, animated: true)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "VerRegistrosClase"{
            os_log("Viendo registros", log: OSLog.default,type: .debug)
            guard let claseRegistrosViewController = segue.destination as? TableRegistrosViewController else{
                fatalError("Destinacion inesperada: \(segue.destination)")
            }
            guard let claseSeleccionadaDeCelda = sender as? TableViewClasesCellController else{
                fatalError("el enviado es inesperado: \(segue.destination)")
            }
            guard let indexPath = tableView.indexPath(for: claseSeleccionadaDeCelda) else{
                fatalError("La celda seleccionada no puede ser mostrada")
            }
            
            let claseSeleccionada = clases[indexPath.row]
            
            claseRegistrosViewController.clase = claseSeleccionada
        }else{
            fatalError("Mal identificador; \(segue.identifier)")
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
