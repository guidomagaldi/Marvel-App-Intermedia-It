//
//  CharacterViewController.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//

import UIKit

protocol CharacterViewControllerDelegate: AnyObject{
    func didSelectCell(hero: Hero)
    func didLogOutUser()
}

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let characterViewModel: CharacterViewModel
    weak var delegate: CharacterViewControllerDelegate?
    
    
    init(characterViewModel: CharacterViewModel) {
        
        self.characterViewModel = characterViewModel
        super.init(nibName: .none, bundle: .none)
        self.characterViewModel.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Marvel App"
        

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "heroCell")
        addLogoutButton()
        characterViewModel.getAllCharacters()
    }
    
    private func addLogoutButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOutTapped))
    }
    
    @objc func logOutTapped(){
        characterViewModel.logOutUser()
    }
    
 
}



extension CharacterViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = characterViewModel.heroCount()
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell",
                                                       for: indexPath) as? HeroTableViewCell else { return UITableViewCell() }
        let hero = characterViewModel.getHero(at: indexPath)
        cell.configure(hero: hero)
        return cell
        }
       
    }

extension CharacterViewController: UITableViewDelegate{
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let hero = characterViewModel.getHero(at: indexPath)
         delegate?.didSelectCell(hero: hero)
    }
}

extension CharacterViewController: CharacterViewModelDelegate{
    func didFetchAllCharacters() {
                tableView.reloadData()
    }
    func didLogOutUser() {
        delegate?.didLogOutUser()
    }
}
