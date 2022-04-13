//
//  ComicsTableViewCell.swift
//  Marvel Project
//
//  Created by Guido Mola on 11/04/2022.
//

import UIKit

class ComicsTableViewCell: UITableViewCell {
    @IBOutlet weak var comicName: UILabel!
    private let identifier = "comicsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(comic: ComicData){
        comicName.text = comic.name
    }
    
}
