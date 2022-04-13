//
//  CharacterDetailViewModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 10/04/2022.
//

import Foundation

class CharacterDetailViewModel{
    
    let comics: [ComicData] = []
    
    func getComic(at index: IndexPath) -> ComicData{
        return self.comics[index.row]
    }
    
    func getCount(hero: Hero) -> Int {
        guard let returned = hero.comics?.returned else { return 0 }
            return returned
        }
    
}


//func getHero(at index: IndexPath) -> Hero {
//    return self.heros[index.row]
//    }
