//
//  MainCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
  
    static let identifier = "MainCollectionViewCell"
    
    private let baseView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = UIColor(white: 1, alpha: 0.15)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(baseView)
        baseView.addSubview(imageView)
        baseView.addSubview(nameLabel)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = contentView.bounds.height
        let width = contentView.bounds.width
        
        baseView.frame = CGRect(x: 0,
                                y: 0,
                                width: width,
                                height: height)
        imageView.frame = CGRect(x: 15/2,
                                  y: 15/2,
                                  width: width-15,
                                 height: width-15)
        nameLabel.frame = CGRect(x: 0,
                                 y: imageView.frame.maxY+5,
                                 width: width,
                                 height: height/5)
    }
    // MARK: public
    public func configure(with model: Character) {
        setupImage(url: model.image)
        nameLabel.text = model.name
    }
    
    private func setupImage(url: String) {
        if let url = URL(string: url) {
            imageView.load(url: url)
        }
    }
    
}

