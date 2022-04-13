//
//  APICaller.swift
//  Marvel Project
//
//  Created by Guido Mola on 08/04/2022.
//

import Foundation
import Alamofire


class APICaller{
    
    let baseUrl = "https://gateway.marvel.com/v1/public"
    
    func getHerosList(completionHandler: @escaping (([Hero]) -> Void)) {
        let clientsUrl = "\(baseUrl)/characters"
        let finalUrl = "\(clientsUrl)?apikey=3a783b25c80e1c44875356dd363f272d&hash=51a3ecf2f92a23817992a2663183325e&ts=1"
        AF.request(finalUrl).responseDecodable(of: HeroInfo.self) { response in
            switch response.result {
                case .success(let clientsResponse):
                    DispatchQueue.main.async {
                    completionHandler(clientsResponse.data.results)
                    print("Validation Successful")
                    }
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    func getEventList(completionHandler: @escaping (([Event]) -> Void)) {
        let clientsUrl = "\(baseUrl)/events"
        let finalUrl = "\(clientsUrl)?apikey=3a783b25c80e1c44875356dd363f272d&hash=51a3ecf2f92a23817992a2663183325e&ts=1"
        AF.request(finalUrl).responseDecodable(of: EventInfo.self) { response in
            switch response.result {
                case .success(let eventResponse):
                    DispatchQueue.main.async {
                        completionHandler(eventResponse.data.results)
                        print("Validation Successful")
                    }
                case let .failure(error):
                    print(error)
            }
        }
    }
}
