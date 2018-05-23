//
//  TableViewController.swift
//  EsquemaApp
//
//  Created by Manuel Coto on 27/3/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //MARK: Propiedades
    var noticias = [Noticias]()
    
    @IBAction func esto(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed{
            let transicion = sender.translation(in: self.view).y
            if transicion > 0 {
                Tools().mostarQR(ventana: self)
                print("swipe arriba∫")
            }
            else{
                print("swipe arribas∫")
            }
        }
    }
    
    //Mark: Metodos Privados
    private func cargarNoticiasejemplo(){
        let foto1 = UIImage(named:"4mWsrz1")
        let foto2 = UIImage(named: "67057-1")
        let foto3 = UIImage(named: "c26")
        
        guard let noticia1 = Noticias(nombre: "Burger king foot letuce", foto: foto1, descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tincidunt ex et iaculis tincidunt. Cras nec orci blandit, mollis augue et, consequat ligula. Morbi in ornare ex. In blandit suscipit diam id vestibulum. Curabitur rutrum enim mi, ut euismod diam laoreet in. Curabitur bibendum vehicula finibus. Praesent egestas erat id pulvinar ultricies. Quisque eget purus ultricies, consectetur lectus a, porta ipsum. Mauris quis ante iaculis, mollis risus vitae, pellentesque nibh. Sed non lorem sagittis, vestibulum ex eget, faucibus enim. Vestibulum ultricies odio sed lectus faucibus, et tempor orci venenatis.") else {
            fatalError("No se pudo instanciar la noticia1")
        }
        guard let noticia2 = Noticias(nombre: "La noticia mas importante", foto: foto2, descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tincidunt ex et iaculis tincidunt. Cras nec orci blandit, mollis augue et, consequat ligula. Morbi in ornare ex. In blandit suscipit diam id vestibulum. Curabitur rutrum enim mi, ut euismod diam laoreet in. Curabitur bibendum vehicula finibus. Praesent egestas erat id pulvinar ultricies. Quisque eget purus ultricies, consectetur lectus a, porta ipsum. Mauris quis ante iaculis, mollis risus vitae, pellentesque nibh. Sed non lorem sagittis, vestibulum ex eget, faucibus enim. Vestibulum ultricies odio sed lectus faucibus, et tempor orci venenatis.") else {
            fatalError("No se pudo instanciar la noticia 2")
        }
        
        guard let noticia3 = Noticias(nombre:"No hay mas noticias rip", foto: foto3, descripcion: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tincidunt ex et iaculis tincidunt. Cras nec orci blandit, mollis augue et, consequat ligula. Morbi in ornare ex. In blandit suscipit diam id vestibulum. Curabitur rutrum enim mi, ut euismod diam laoreet in. Curabitur bibendum vehicula finibus. Praesent egestas erat id pulvinar ultricies. Quisque eget purus ultricies, consectetur lectus a, porta ipsum. Mauris quis ante iaculis, mollis risus vitae, pellentesque nibh. Sed non lorem sagittis, vestibulum ex eget, faucibus enim. Vestibulum ultricies odio sed lectus faucibus, et tempor orci venenatis.") else {
            fatalError("No se pudo instaciar la noticia 3")
        }
        noticias += [noticia1,noticia2,noticia3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarNoticiasejemplo()
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
        return noticias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //las celdas del table view son reusadas y deberian ser adecuadas y por eso se usa un identificador
        let identificadorCelda = "CardsTableView"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identificadorCelda, for: indexPath) as? CardsTableViewCell else{
            fatalError("La celda no es adecuada para la instancia de la celda del table view")
        }
        
        //asocia la noticia apropiada al layout
        let noticia = noticias[indexPath.row]
        
        // Configure the cell...
        cell.NombreCard.text = noticia.nombre
        cell.fotoImageView.image = noticia.foto
        cell.noticiasTextView.text = noticia.descripcion
        
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
