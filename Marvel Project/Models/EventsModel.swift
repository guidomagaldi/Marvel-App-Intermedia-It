//
//  EventsModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 10/04/2022.
//

import Foundation

struct EventInfo: Codable {
    let code:Int
    let status:String
    let data:EventData
}

struct EventData: Codable {
    let offset:Int
    let limit:Int
    let total:Int
    let count:Int
    let results:[Event]
}

struct Event: Codable {
    let id:Int?
    var title:String?
    let description:String?
    let thumbnail:EventThumbnail?
    let urls: [EventURL]?
    let modified: String?
    let comics: EventComic?

}




struct EventThumbnail: Codable {
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct EventURL:Codable {
    let type:String
    let url:String
}

struct EventComic: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [EventComicData]?
    let returned: Int?
}

// MARK: - Comics
struct EventComicData: Codable {
    let resourceURI: String?
    let name: String?
}
