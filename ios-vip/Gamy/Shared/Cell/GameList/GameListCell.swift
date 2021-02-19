//
//  GameListCell.swift
//  Gamy
//
//  Created by Ariel on 08/11/20.
//

import UIKit

class GameListCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func setupAppearance() {
        
    }
    
    func setupGame(data: Game) {
        label.text = data.name
    }
}
