//
//  InfoTableViewCell.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    
    static let identifier = "InfoTableViewCell"
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 1, alpha: 0.2)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.opacity = 0.8
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "Species:"
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.opacity = 0.8
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "Type:"
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.opacity = 0.8
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "Gender:"
        return label
    }()
    
    private let typeValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let speciesValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let genderValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.tintColor = .black
        contentView.clipsToBounds = true
        contentView.addSubview(baseView)
        baseView.addSubviews(speciesLabel, typeLabel, genderLabel, speciesValueLabel, typeValueLabel, genderValueLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: public
    public func configure(with model: Character) {
        speciesValueLabel.text = model.species
        var type = model.type
        if type.isEmpty {
            type = "None"
        }
        typeValueLabel.text = type
        genderValueLabel.text = model.gender
    }
    //MARK: private
        private func setupConstraints() {
            let inset:CGFloat = 15
            baseView.translatesAutoresizingMaskIntoConstraints = false
            speciesLabel.translatesAutoresizingMaskIntoConstraints = false
            typeLabel.translatesAutoresizingMaskIntoConstraints = false
            genderLabel.translatesAutoresizingMaskIntoConstraints = false
            speciesValueLabel.translatesAutoresizingMaskIntoConstraints = false
            typeValueLabel.translatesAutoresizingMaskIntoConstraints = false
            genderValueLabel.translatesAutoresizingMaskIntoConstraints = false
    
            NSLayoutConstraint.activate([
                baseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
                baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
                baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
                baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
    
                speciesLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: inset),
                speciesLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: inset),
                speciesValueLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: inset),
                speciesValueLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -inset),
    
                typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: inset),
                typeLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: inset),
                typeValueLabel.topAnchor.constraint(equalTo: speciesValueLabel.bottomAnchor, constant: inset),
                typeValueLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -inset),
    
                genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: inset),
                genderLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: inset),
                genderValueLabel.topAnchor.constraint(equalTo: typeValueLabel.bottomAnchor, constant: inset),
                genderValueLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -inset),
            ])
        }
    
}
