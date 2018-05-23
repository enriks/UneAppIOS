//
//  CardsTableViewCell.swift
//  EsquemaApp
//
//  Created by Manuel Coto on 26/3/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class CardsTableViewCell: UITableViewCell {

    //MARK: Propiedades
    @IBOutlet weak var NombreCard: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var noticiasTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
