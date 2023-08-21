//
//  HeaderTableView.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import UIKit

class HeaderTableView: UITableViewHeaderFooterView {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
         imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let statusLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textAlignment = .center
        label.textColor = .green
       label.numberOfLines = 1
       return label
   }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubviews(imageView, nameLabel, statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: Character) {
        setupImage(url: model.image)
        nameLabel.text = model.name
        statusLabel.text = model.status
        
    }
    
    private func setupImage(url: String) {
        if let url = URL(string: url) {
            imageView.load(url: url)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let width:CGFloat = 150
        let height:CGFloat = 150

        imageView.frame = CGRect(x: contentView.frame.width/2 - width/2,
                                y: 5,
                                width: width,
                                height: height)

        nameLabel.frame = CGRect(x: 0,
                                 y: imageView.bottom + 5,
                                 width: contentView.width,
                                 height: 20)
        statusLabel.frame = CGRect(x: 0,
                                   y: nameLabel.bottom + 5,
                                width: contentView.width,
                                 height: 15)
    }
}
    



