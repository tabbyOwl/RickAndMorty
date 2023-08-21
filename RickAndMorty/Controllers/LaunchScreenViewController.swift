//
//  LaunchScreenViewController.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 18.08.2023.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    
    private var characters: [Character] = []
    
    private var baseView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "stars")
        return imageView
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "galaxy")
        return imageView
    }()
    
    private var labelView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "label")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(baseView)
        baseView.addSubview(labelView)
        baseView.addSubview(imageView)
        view.backgroundColor = .black
        fetchCharacters()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        baseView.frame = CGRect(x: 0,
                                y: 0,
                                width: view.bounds.width,
                                height: view.bounds.height)
        let width: CGFloat = 140
        let heigth: CGFloat = 40
        
        labelView.frame = CGRect(x: view.frame.midX - width/2,
                                 y: view.frame.minY + view.bounds.height/4,
                                 width: width,
                                 height: heigth)
        let labelWidth: CGFloat = 140
        let labelHeigth: CGFloat = 228
        
        imageView.frame = CGRect(x: view.frame.midX - width/2,
                                 y: labelView.frame.maxY + heigth/2,
                                 width: labelWidth,
                                 height: labelHeigth)
    }
    
    //MARK: private
    private func fetchCharacters() {
        DataService().loadCharacters { [weak self] result in
            self?.characters = result
            DispatchQueue.main.async {
                self?.dataLoadedSuccessfully()
                
            }
        }
    }
    
    private func dataLoadedSuccessfully() {
        let vc = MainScreenViewController(characters: characters)
        vc.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
