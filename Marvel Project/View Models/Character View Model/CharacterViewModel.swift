//
//  CharacterViewModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 08/04/2022.
//

import Foundation

class CharacterViewModel{
    
    let apiCaller = APICaller()
    func getAllCharacter() {
        apiCaller.getAllArtists()
    }
}


