//
//  DetailsTableViewController.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import UIKit

final class DetailsTableViewController: UIViewController {
    
    private var character: Character
    private var origin: Origin?
    private var episodesId: Set<Int> = []
    private var episodes: [Episode] = []
    private var allEpisodes: [Episode] = [] {
        didSet {
            setEpisodes()
          
            DispatchQueue.main.async { [self] in
                self.tableView.reloadData()
                if !episodes.isEmpty {
                    self.tableView.isHidden = false
                    activityIndicator.stopAnimating()
                    activityIndicator.isHidden = true
                }
            }
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.isHidden = true
        return tableView
    }()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
   
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeEpisodesIdForCharacter()
        setupTableView()
        setupHeaderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchOrigin()
        fetchEpisodes()
        setupActivityIndicator()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
  
    private func setupActivityIndicator() {
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func setupTableView() {
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: OriginTableViewCell.identifier)
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.identifier)
        tableView.backgroundColor = .black
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupHeaderView() {
        let view = HeaderTableView()
        view.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: UIScreen.main.bounds.height/4)
        view.configure(with: character)
        tableView.tableHeaderView = view
    }
    
    private func setEpisodes() {
        for episode in allEpisodes {
            if episodesId.contains(episode.id) {
                episodes.append(episode)
            }
        }
    }
    
    private func fetchEpisodes() {
        let urls = DataService.urlsForAllEpisodes
        for url in urls {
            DataService().loadEpisodes(url: url) { [weak self] result in
                self?.allEpisodes.append(contentsOf: result)
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func makeEpisodesIdForCharacter() {
        for episode in character.episode {
            if let lastSlashIndex = episode.lastIndex(of: "/") {
                let charsAfterLastSlash = episode[episode.index(after: lastSlashIndex)...]
                if let id = Int(charsAfterLastSlash) {
                    episodesId.insert(id)
                }
            }
        }
    }
    
    private func fetchOrigin() {
        DataService().loadOrigin(url: character.origin.url) { [weak self] result in
            self?.origin = result
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - Table view data source

extension DetailsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.identifier) else { return UITableViewCell() }
            (cell as? EpisodeTableViewCell)?.configure(with: episodes[indexPath.row])
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OriginTableViewCell.identifier) else { return UITableViewCell() }
            (cell as? OriginTableViewCell)?.configure(name: character.origin.name, type: origin?.type ?? "Unknown")
                return cell
        } else if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier) else { return UITableViewCell() }
            (cell as? InfoTableViewCell)?.configure(with: character)
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        } else {
            return episodes.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        } else {
            return 130
        }
    }
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        if section == 0 {
            return "Info"
        } else if section == 1 {
            return "Origin"
        } else if section == 2 {
            return "Episodes"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
}

