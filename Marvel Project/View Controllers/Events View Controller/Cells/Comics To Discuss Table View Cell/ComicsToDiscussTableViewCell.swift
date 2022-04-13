//
//  ComicsToDiscussTableViewCell.swift
//  Marvel Project
//
//  Created by Guido Mola on 12/04/2022.
//

import UIKit

class ComicsToDiscussTableViewCell: UITableViewCell {
    @IBOutlet weak var comicName: UILabel!
    private let identifier = "comicsToDiscussCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(eventComic: EventComicData){
        comicName.text = eventComic.name
    }
    
}