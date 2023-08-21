//
//  OriginTableViewCell.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import UIKit

final class OriginTableViewCell: UITableViewCell {
    
    static let identifier = "OriginTableViewCell"
    
    private let viewForPicture: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.4
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let pictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(named: "planet")
        return imageView
    }()
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 1, alpha: 0.2)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Unknown"
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.tintColor = .black
        contentView.clipsToBounds = true
        viewForPicture.addSubview(pictureView)
        contentView.addSubview(baseView)
        baseView.addSubviews(viewForPicture, nameLabel, typeLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: public
    public func configure(name: String, type: String) {
        if let index = name.firstIndex(of: "(") {
            nameLabel.text = String(name.prefix(upTo: index))
        }
        typeLabel.text = type
    }
    //MARK: private
    private func setupConstraints() {
        let inset:CGFloat = 15
        baseView.translatesAutoresizingMaskIntoConstraints = false
        viewForPicture.translatesAutoresizingMaskIntoConstraints = false
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            viewForPicture.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 5),
            viewForPicture.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 5),
            viewForPicture.widthAnchor.constraint(equalTo: baseView.heightAnchor, constant: -5),
            viewForPicture.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            
            pictureView.centerYAnchor.constraint(equalTo: viewForPicture.centerYAnchor),
            pictureView.centerXAnchor.constraint(equalTo: viewForPicture.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: viewForPicture.trailingAnchor, constant: inset),
            nameLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: inset),
            
            typeLabel.leadingAnchor.constraint(equalTo: viewForPicture.trailingAnchor, constant: inset),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: inset)
        ])
    }
}
