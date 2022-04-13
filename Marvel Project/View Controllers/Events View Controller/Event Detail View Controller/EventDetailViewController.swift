//
//  EventDetailViewController.swift
//  Marvel Project
//
//  Created by Guido Mola on 12/04/2022.
//

import UIKit

class EventDetailViewController: UIViewController {
    let event: Event
    let eventDetailViewModel: EventDetailViewModel
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var comicToDiscussLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    init(event: Event){
        self.event = event
        eventDetailViewModel = EventDetailViewModel()
        super.init(nibName: .none, bundle: .none)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ComicsToDiscussTableViewCell", bundle: nil), forCellReuseIdentifier: "comicsToDiscussCell")
        configure()
        
    }
    
    func configure(){

        guard let isoStr = event.modified else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: isoStr) {
            dateFormatter.dateFormat = "d' de 'MMMM', 'yyyy"
            let resultString = dateFormatter.string(from: date)
            eventDate.text = resultString
        }
        comicTitle.text = event.title
        let appearsUppercased = comicToDiscussLabel.text?.uppercased()
        comicToDiscussLabel.text = appearsUppercased
        guard let url = event.thumbnail?.url else {return}
        comicImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

extension EventDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comicsToDiscussCell",
                                                       for: indexPath) as? ComicsToDiscussTableViewCell else { return UITableViewCell() }
        if (event.comics?.returned)! > indexPath.row{
            guard let comic = event.comics?.items?[indexPath.row] else { return UITableViewCell()}
            cell.configure(eventComic: comic)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let availableEvents = event.comics?.available else { return 0 }
        return availableEvents
    }
    
    
}
extension EventDetailViewController: UITableViewDelegate{

}
