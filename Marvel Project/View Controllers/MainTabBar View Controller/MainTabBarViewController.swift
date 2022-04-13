//
//  MainTabBarViewController.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//
import UIKit

class MainTabBarController: UITabBarController {
    
    let characterNavigationController : UINavigationController
    let dataNavigationController: UINavigationController
    
    init(characterNavigationController: UINavigationController, dataNavigationController: UINavigationController) {
        self.characterNavigationController = characterNavigationController
        self.dataNavigationController = dataNavigationController
        super.init(nibName: nil , bundle: nil )
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        

//        characterNavigationController.navigationItem.largeTitleDisplayMode = .always
//        dataNavigationController.navigationItem.largeTitleDisplayMode = .always
  
        //Character Controllers Setup
//        characterNavigationController.title = "Character"
        characterNavigationController.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(named: "icon-superhero-off")?.withRenderingMode(.alwaysOriginal), tag: 1)
        characterNavigationController.tabBarItem.selectedImage = UIImage(named: "icon-superhero-on")?.withRenderingMode(.alwaysOriginal)
        
//        characterNavigationController.navigationBar.prefersLargeTitles = true
       
        //Data Controllers Setup
//        dataNavigationController.title = "Events"
        dataNavigationController.tabBarItem = UITabBarItem(title: "Events", image: UIImage(named: "icon-calendar-off")?.withRenderingMode(.alwaysOriginal), tag: 1)
        dataNavigationController.tabBarItem.selectedImage =  UIImage(named: "icon-calendar-on")?.withRenderingMode(.alwaysOriginal)
        
        
        setViewControllers([characterNavigationController, dataNavigationController], animated: false)
        
    }
    
    
    private func setupUI(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(r: 38.0, g: 38.0, b: 38.0)
        UINavigationBar.appearance().tintColor = .white
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 20)!
          ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        
    }
}

