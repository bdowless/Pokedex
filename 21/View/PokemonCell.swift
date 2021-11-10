//
//  PokemonCell.swift
//  21
//
//  Created by Brandon Dowless on 11/5/21.
//

import UIKit
import Kingfisher

class PokemonCell: UICollectionViewCell {
    
    var pokemon: Pokemon? {
        didSet {
            guard let pokemon = pokemon else { return }
            let imUrl = pokemon.imageUrl
            let url = URL(string: imUrl)
            backgroundImage.kf.setImage(with: url)
            textLabel.text = pokemon.name
        }
    }
    //MARK: Properties
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokemon"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()
    
    let cellColor: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemBlue
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helepers
    
    func configureUI() {
        contentView.addSubview(cellColor)
        cellColor.widthAnchor.constraint(equalTo: widthAnchor) .isActive = true
        cellColor.heightAnchor.constraint(equalTo: heightAnchor) .isActive = true
        cellColor.centerXAnchor.constraint(equalTo: centerXAnchor) .isActive = true
        
        cellColor.addSubview(backgroundImage)
        backgroundImage.heightAnchor.constraint(equalTo: cellColor.heightAnchor) .isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: cellColor.widthAnchor) .isActive = true
        
        cellColor.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: cellColor.topAnchor, constant: 10) .isActive = true
        textLabel.leftAnchor.constraint(equalTo: cellColor.leftAnchor, constant: 5) .isActive = true
    }
}
