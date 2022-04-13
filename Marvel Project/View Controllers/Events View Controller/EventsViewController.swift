//
//  DataViewController.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//

import UIKit

protocol EventViewControllerDelegate: AnyObject{
    func didSelectEventCell(event: Event)
}

class EventsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var eventsViewModel: EventsViewModel
    weak var delegate: EventViewControllerDelegate?
    
    init(eventsViewModel: EventsViewModel) {
        self.eventsViewModel = eventsViewModel
        super.init(nibName: .none, bundle: .none)
        self.eventsViewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Events"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: "eventCell")
        eventsViewModel.getEventList()

        
        // Do any additional setup after loading the view.
    }
}


extension EventsViewController: UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = eventsViewModel.eventCount()
        return count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell",
                                                       for: indexPath) as? EventsTableViewCell else { return UITableViewCell() }
        let event = eventsViewModel.getEvent(at: indexPath)
        cell.configure(event: event)
        return cell
    }
    
}

extension EventsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = eventsViewModel.getEvent(at: indexPath)
        delegate?.didSelectEventCell(event: event)
    }
}

extension EventsViewController: EventsViewModelDelegate{
    func didFetchEventsList() {
        tableView.reloadData()
    }
}
