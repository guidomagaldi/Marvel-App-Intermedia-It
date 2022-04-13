//
//  HeroTableViewCell.swift
//  Marvel Project
//
//  Created by Guido Mola on 09/04/2022.
//

import UIKit
import SDWebImage


class HeroTableViewCell: UITableViewCell {
    private let identifier = "heroCell"

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroSubtitle: UILabel!
    
    override func layoutSubviews() {
        // Set the width of the cell
        self.cellView.layer.cornerRadius = 4
        self.cellView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroImage.image = nil
    }
    
    func configure(hero: Hero){
        heroName.text = hero.name
        heroSubtitle.text = hero.description ?? "This hero has no description"
        guard let url = hero.thumbnail?.url else {return}
        heroImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))

        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
