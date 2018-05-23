//
//  TableHorarioCell.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 18/4/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class TableHorarioCell: UITableViewCell {

    
    @IBOutlet weak var Aula: UILabel!
    @IBOutlet weak var Profesor: UILabel!
    @IBOutlet weak var HoraComienzo: UILabel!
    @IBOutlet weak var HoraFin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
