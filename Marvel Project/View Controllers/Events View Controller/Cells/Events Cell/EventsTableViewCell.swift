//
//  EventsTableViewCell.swift
//  Marvel Project
//
//  Created by Guido Mola on 10/04/2022.
//

import UIKit
import SDWebImage

class EventsTableViewCell: UITableViewCell {
    private let identifier = "eventCell"

    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(event:Event){
        eventTitle.text = event.title
//        guard let date = event.start?.toDate(.isoDateTimeSec) else {return}
        
        guard let isoStr = event.modified else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: isoStr) {
            dateFormatter.dateFormat = "d' de 'MMMM', 'yyyy"
            let resultString = dateFormatter.string(from: date)
            eventDate.text = resultString
        }
        guard let url = event.thumbnail?.url else {return}
        eventImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
        
    }

    
}
