//
//  CharacterDetailViewController.swift
//  Marvel Project
//
//  Created by Guido Mola on 10/04/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    let hero: Hero
    let characterDetailViewModel: CharacterDetailViewModel
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroDescription: UILabel!
    @IBOutlet weak var appearsTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    init(hero: Hero){
        self.hero = hero
        characterDetailViewModel = CharacterDetailViewModel()
        super.init(nibName: .none, bundle: .none)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ComicsTableViewCell", bundle: nil), forCellReuseIdentifier: "comicsCell")
        configure()
    }
    
    func configure(){
        heroDescription.text = hero.description
        let appearsUppercased = appearsTitleLabel.text?.uppercased()
        appearsTitleLabel.text = appearsUppercased
        guard let url = hero.thumbnail?.url else {return}
        heroImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

extension CharacterDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comicsCell",
                                                       for: indexPath) as? ComicsTableViewCell else { return UITableViewCell() }
        if (hero.comics?.returned)! > indexPath.row{
            guard let comic = hero.comics?.items?[indexPath.row] else { return UITableViewCell()}
            cell.configure(comic: comic)
           
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let returned = hero.comics?.returned else {return 0}
        return returned
    }
    
    
}

extension CharacterDetailViewController: UITableViewDelegate{
    
}
