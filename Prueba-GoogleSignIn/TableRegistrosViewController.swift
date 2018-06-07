//
//  TableRegistrosViewController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 15/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit
import FMDB

class TableRegistrosViewController: UITableViewController {
    @IBOutlet weak var tituloCard: UINavigationItem!
    var clase: Clases?
    var registros = [Registros]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let clase = clase{
            tituloCard.title = clase.nombreClase
            cargarRegistroClase(clase: clase)
            print(clase.nombreClase)
        }
    }
    @IBAction func estohehe(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    func cargarRegistroClase(clase: Clases){
        let baseDeDatos = FMDatabase(path: AppDelegate.Usuario.path)
        if baseDeDatos.open(){
            do {
                let resultado: FMResultSet? = try baseDeDatos.executeQuery("select Eventos.nombreEvento nombre, registros.fecha fecha from Eventos, registros where Eventos._id ='\(clase.idClase)'", values:nil)
                
                while resultado?.next() == true{
                    registros += [Registros(clase: (resultado?.string(forColumn: "nombre"))!, fecha: (resultado?.string(forColumn: "fecha"))!)!]
                }
            }catch{
                print("error en la query2")
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
        return registros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identificador = "RegistrosCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identificador, for: indexPath) as? TableRegistroViewCell else{
            fatalError("No se puedo cargar esa nuerdaxd")
        }

        // Configure the cell...
        let registro = registros[indexPath.row]
        cell.nombreClase.text = registro.nombreClase
        cell.fechaClase.text = registro.fecha
        
        return cell
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
