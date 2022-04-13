//
//  CharacterCoordinator.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//

import Foundation
import UIKit

class CharacterCoordinator: Coordinator, CharacterViewControllerDelegate {
    
    private let characterViewController: CharacterViewController
    private let characterViewModel: CharacterViewModel

    
    var didUserLogOut: (()->(Void))?
    
    public override init(router: RouterType) {
        characterViewModel = CharacterViewModel()
        characterViewController = CharacterViewController(characterViewModel: characterViewModel)
        super.init(router: router)
        self.characterViewController.delegate = self
    }
    
    override func toPresentable() -> UIViewController {
        return characterViewController
    }
    
    override func start() {
        router.setRootModule(characterViewController, hideBar: false)
    }
    
    func didSelectCell(hero: Hero) {
        let charactersDetailViewController = CharacterDetailViewController(hero: hero )
        router.push(charactersDetailViewController, animated: true, completion: nil)
    }
    
    func didLogOutUser() {
        didUserLogOut?()
    }
}

