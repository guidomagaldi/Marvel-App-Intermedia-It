//
//  DataCoordinator.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//

import Foundation
import UIKit

class EventCoordinator: Coordinator, EventViewControllerDelegate {
   
    
    
    private let eventViewController: EventsViewController
    
    public override init(router: RouterType) {
        let eventsViewModel = EventsViewModel()
        eventViewController = EventsViewController(eventsViewModel: eventsViewModel)
        super.init(router: router)
        eventViewController.delegate = self
        
    }
    
    override func toPresentable() -> UIViewController {
        return eventViewController
    }
    
    override func start() {
        router.setRootModule(eventViewController, hideBar: false)
    }
    
    func didSelectEventCell(event: Event) {
        let eventDetailViewController = EventDetailViewController(event: event)
        router.present(eventDetailViewController, animated: true)
    }
}

