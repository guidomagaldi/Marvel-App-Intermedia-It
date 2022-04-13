// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let marvel = try? newJSONDecoder().decode(Marvel.self, from: jsonData)


import Foundation

struct HeroInfo: Codable {
    let code:Int
    let status:String
    let data:HeroData
}

struct HeroData: Codable {
    let offset:Int
    let limit:Int
    let total:Int
    let count:Int
    let results:[Hero]
}

struct Hero: Codable {
    let id:Int?
    let name:String?
    let description:String?
    let thumbnail:Thumbnail?
    let urls: [HeroURL]?
    let comics: Comics?
}

struct Thumbnail: Codable {
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

struct HeroURL:Codable {
    let type:String
    let url:String
}

struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicData]?
    let returned: Int?
}

// MARK: - Item
struct ComicData: Codable {
    let resourceURI: String?
    let name: String?
}

