//
//  Marvel.swift
//  Marvel Project
//
//  Created by Guido Mola on 12/04/2022.
//

import Foundation
import Moya
import SwiftHash


public enum Marvel {
    
    static private let publicKey = "3a783b25c80e1c44875356dd363f272d"
    static private let privateKey = "aa1141953df8c088f39a97de10008578e834580f"
    
    
    case characters
    case events
}


extension Marvel: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public")!
    }
    
    
    public var path: String {
        switch self {
     
            case .characters: return "/characters"
            case .events: return "/events"
        }
    }
    
    
    public var method: Moya.Method {
        return .get
        
    }
    
    
    public var sampleData: Data {
        return Data()
    }
    
    
    public var task: Task {
        let ts = 1
        
        let hash = MD5("\(ts)\(Marvel.privateKey)\(Marvel.publicKey)")
        
        
//        let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash] as [String : Any]
        
        switch self {
            case .events:
                // 3
                return .requestParameters(
                    parameters: [
                        "apikey": Marvel.publicKey,
                        "ts": ts,
                        "hash": hash,
                        "orderBy": "startDate",
                        "limit": 25] ,
                    encoding: URLEncoding.default)
                
            case .characters:
                return .requestParameters(
                    parameters: [
                        "apikey": Marvel.publicKey,
                        "ts": ts,
                        "hash": hash,
                        "orderBy": "startDate",
                        "limit": 15] ,
                    encoding: URLEncoding.default)
                
        }
    }
    
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    

    public var validationType: ValidationType {
        return .successCodes
    }
}
