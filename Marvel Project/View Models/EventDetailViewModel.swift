//
//  EventDetailViewModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 12/04/2022.
//

import Foundation

class EventDetailViewModel{
    
    let comics: [EventComicData] = []
    
    
    
    func getComic(at index: IndexPath) -> EventComicData{
        return self.comics[index.row]
    }
    
    func getCount(eventComics: Event) -> Int {
        guard let available = eventComics.comics?.available else { return 0 }
        return available
    }
    
}
