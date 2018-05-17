//
//  TableViewClasesCellController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 14/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class TableViewClasesCellController: UITableViewCell {

    @IBOutlet weak var progresoAlumno: UIProgressView!
    @IBOutlet weak var nombreClaselbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
