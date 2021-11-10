//
//  HomeController.swift
//  21
//
//  Created by Brandon Dowless on 11/5/21.
//

import UIKit

let reuseidentifier = "Controller"

class HomeController: UICollectionViewController {
    var pokemons = [PokemonObject]() {
        didSet { collectionView.reloadData() }
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        configureCollectionView()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // API

    func fetchData() {
        AuthService.shared.fetchData { (data) in
            self.pokemons = data
            print("DEBUG: Data has returned \(data)")
        }
    }
    
    
    //MARK: Helpers
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reuseidentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
}
extension HomeController: UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as! PokemonCell
        cell.pokemon = pokemons[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
