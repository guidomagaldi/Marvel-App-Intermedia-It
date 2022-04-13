//
//  AppCoordinator.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    private var characterCoordinator: CharacterCoordinator
    private var eventCoordinator: EventCoordinator
    
    
    private var characterRouter = Router(navigationController: UINavigationController())
    private var eventRouter = Router(navigationController: UINavigationController())
    private var characterDetailRouter = Router(navigationController: UINavigationController())
    private var authRouter = Router(navigationController: UINavigationController())
    
    public override init(router: RouterType) {
        
        characterCoordinator = CharacterCoordinator(router: characterRouter)
        eventCoordinator = EventCoordinator(router: eventRouter)
        super.init(router: router)
        setupChildCoordinatorsNavigationControllers()
    }
    
    override func start() {
        let defaults = UserDefaults.standard
        let userLoggedIn = defaults.bool(forKey: UserDefaultAuthKey.isLoggedIn.rawValue)
        if userLoggedIn {
            showMainScreen()
        } else {
            showAuthentication()
        }
    }
    
    // MARK: Private
    
    private func setupChildCoordinatorsNavigationControllers() {
        characterRouter.navigationController.navigationBar.isTranslucent = false
        characterRouter.navigationController.navigationBar.shadowImage = UIImage()
    }
    
    private func showAuthentication(){
        let authCoordinator = AuthCoordinator(router: authRouter)
        authCoordinator.onUserAuthenticated = {
            self.showMainScreen()
            self.removeChild(authCoordinator)
        }
        
        //para logout voy a hacer la inversa
        
        addChild(authCoordinator)
        router.setRootModule(authCoordinator, hideBar: true)
    }
    
    private func showMainScreen() {
        addChild(characterCoordinator)
        addChild(eventCoordinator)
        
        characterCoordinator.didUserLogOut = {
            self.showAuthentication()
            self.removeChild(self.characterCoordinator)
            self.removeChild(self.eventCoordinator)
        }
        
        let tabBarViewController = MainTabBarController(characterNavigationController: characterRouter.navigationController, dataNavigationController: eventRouter.navigationController )
        
        router.setRootModule(tabBarViewController, hideBar: true)
        
        characterCoordinator.start()
        eventCoordinator.start()
    }
    
    
    
    private func initializeNavigationControllers() {
        characterRouter = Router(navigationController: UINavigationController())
        eventRouter = Router(navigationController: UINavigationController())
        authRouter = Router(navigationController: UINavigationController())
    }
    
    private func initializeCoordinators() {
        characterCoordinator = CharacterCoordinator(router: characterRouter)
        eventCoordinator = EventCoordinator(router: eventRouter)
    }
}
