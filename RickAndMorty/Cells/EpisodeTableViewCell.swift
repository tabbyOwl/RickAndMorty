//
//  EpisodTableViewCell.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import UIKit

final class EpisodeTableViewCell: UITableViewCell {
    
    static let identifier = "EpisodeTableViewCell"

    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 1, alpha: 0.2)
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.opacity = 0.6
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.tintColor = .black
        contentView.clipsToBounds = true
        contentView.addSubview(baseView)
        contentView.addSubviews(nameLabel, episodeLabel, dateLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: public
    public func configure(with model: Episode) {
        nameLabel.text = model.name
        dateLabel.text = model.date
        episodeLabel.text = makeString(inputString: model.episode)
    }
    //MARK: private
    private func makeString(inputString: String) -> String {
        var string = ""
        if let seasonIndex = inputString.firstIndex(of: "S"),
           let episodeIndex = inputString.firstIndex(of: "E"),
            let seasonNumber = Int(inputString[inputString.index(after: seasonIndex)..<episodeIndex]),
           let episodeNumber = Int(inputString[inputString.index(after: episodeIndex)...]) {
             string = "Episode: \(episodeNumber), Season: \(seasonNumber)"
        }
            return string
    }
  
    private func setupConstraints() {
        let inset:CGFloat = 15
        baseView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            nameLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: inset),
            nameLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: inset),
            nameLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            episodeLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -inset),
            episodeLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: inset),
           
            dateLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -inset),
            dateLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -inset),
        ])
    }
}
