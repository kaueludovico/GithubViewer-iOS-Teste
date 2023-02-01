//
//  SearchScreenView.swift
//  GithubViewer
//
//  Created by Kaue Ludovico on 01/02/23.
//

import UIKit

class SearchScreenView: BaseView {
    
    lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var gitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "giticon")
        return imageView
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome de usuário"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buscar", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func addSubview() {
        addSubview(background)
        background.addSubview(gitImageView)
        background.addSubview(searchTextField)
        background.addSubview(searchButton)
    }
    
    override func setConstraints() {
        
        background.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: bounds.width, height: bounds.height))
        
        gitImageView.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 100, left: 0, bottom: 0, right: 0),
            size: .init(width: 180, height: 180))
        
        gitImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        searchTextField.anchor(
            top: gitImageView.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 80, left: 16, bottom: 0, right: 16),
            size: .init(width: 333, height: 40))
        
        searchTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        searchButton.anchor(
            top: searchTextField.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 50, left: 0, bottom: 0, right: 0),
            size: .init(width: 100, height: 40))
        
        searchButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
