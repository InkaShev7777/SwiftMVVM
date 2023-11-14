//
//  DetailsViewController.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 14.11.2023.
//

import UIKit

class DetailsViewController:UIViewController{
    
    private let nameLable = UILabel()
    private let passwordLable = UILabel()
    private let roleLable = UILabel()
    
    private var labelesStackView = UIStackView()
    
    let detailsViewModel:DetailsViewModel
    
    init(_ detailViewModel:DetailsViewModel){
        self.detailsViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        displayUserInfo()
    }
    
    private func setupViews(){
        title = "User Details"
        view.backgroundColor = .white
        
        labelesStackView = UIStackView(arrangedSubviews: [nameLable,passwordLable,roleLable])
        labelesStackView.axis = .vertical
        labelesStackView.spacing = 2
        labelesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelesStackView)
        
    }
    
    private func displayUserInfo(){
        nameLable.text = "UserName: \(detailsViewModel.name)"
        passwordLable.text = "Password: \(detailsViewModel.password)"
        roleLable.text = "Role: \(detailsViewModel.role)"
    }
}

//MARK: - set constraints
extension DetailsViewController{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            labelesStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
