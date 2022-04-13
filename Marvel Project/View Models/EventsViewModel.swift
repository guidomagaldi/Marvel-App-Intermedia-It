//
//  EventsViewModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 09/04/2022.
//

import Foundation

protocol EventsViewModelDelegate: AnyObject{
    func didFetchEventsList()
}

class EventsViewModel{
    var event: [Event] = []
    let apicaller = APICaller()
    weak var delegate: EventsViewModelDelegate?
    
    func getEventList(){
        apicaller.getEventList { events in
            DispatchQueue.main.async {
                self.event = events
                self.delegate?.didFetchEventsList()
            }
        }
    }
    
    func eventCount() -> Int{
        return event.count
    }
    
    func getEvent(at index: IndexPath) -> Event {
        return self.event[index.row]
    }
}
