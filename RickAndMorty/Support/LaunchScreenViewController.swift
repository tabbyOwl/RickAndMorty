//
//  LaunchScreenViewController.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 18.08.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
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
    
//    private func setupConstraints() {
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)])
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
