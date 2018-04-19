//
//  TableHorarioController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 18/4/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class TableHorarioController: UITableViewController {

    var horarios = [Horario]()
    
    private func cargarEjemplosHorarios(){
        guard let horario1 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario1")
        }
        guard let horario2 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario2")
        }
        guard let horario3 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario3")
        }
        guard let horario4 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario4")
        }
        guard let horario5 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario5")
        }
        guard let horario6 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario6")
        }
        guard let horario7 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario7")
        }
        guard let horario8 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario8")
        }
        guard let horario9 = Horario(aula: "0,6", profesor: "Lazaro Hernandez", horaComienzo: "12:00", horaFin: "14:00")else{
            fatalError("No se pudo crear horario9")
        }
        
        horarios += [horario1,horario2,horario3,horario4,horario5,horario6,horario7,horario8,horario9]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargarEjemplosHorarios()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return horarios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIDentifier = "TableHorarioCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIDentifier, for: indexPath) as? TableHorarioCell else {
            fatalError("Lo que se esta intanciando no es una instancia de TableHorarioCell")
        }

        let horario = horarios[indexPath.row]
        // Configure the cell...
        cell.Aula.text = horario.Aula
        cell.Profesor.text = horario.Profesor
        cell.HoraComienzo.text = horario.HoraComienzo
        cell.HoraFin.text = horario.HoraFin
        
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
