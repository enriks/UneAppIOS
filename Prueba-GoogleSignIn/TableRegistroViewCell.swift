//
//  TableRegistroViewCell.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 15/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class TableRegistroViewCell: UITableViewCell {

    @IBOutlet weak var fechaClase: UILabel!
    @IBOutlet weak var nombreClase: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
