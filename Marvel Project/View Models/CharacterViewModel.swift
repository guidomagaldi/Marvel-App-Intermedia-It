//
//  CharacterViewModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 08/04/2022.
//

import Foundation

protocol CharacterViewModelDelegate: AnyObject{
    func didFetchAllCharacters()
    func didLogOutUser()
}

class CharacterViewModel{
    var heros : [Hero] = []
    weak var delegate: CharacterViewModelDelegate?
    let apiCaller = APICaller()
    
    func heroCount() -> Int{
        return heros.count
    }
    
    func getAllCharacters(){
        apiCaller.getHerosList { data in
            DispatchQueue.main.async {
                self.heros = data
//                print("View Model imprime esta data \(data)")
                self.delegate?.didFetchAllCharacters()

            }
        }
    }
    
    func logOutUser(){
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: UserDefaultAuthKey.isLoggedIn.rawValue)
        delegate?.didLogOutUser()

    }

    
    func getHero(at index: IndexPath) -> Hero {
        return self.heros[index.row]
    }
    
}



