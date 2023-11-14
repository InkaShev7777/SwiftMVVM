//
//  MainCell.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 14.11.2023.
//

import UIKit

class MainCell:UITableViewCell{
    
    static var identifier:String{
        "MainCell"
    }
    
    private let nameLable = UILabel()
    private let roleLable = UILabel()
    private var labelesStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        nameLable.font = .systemFont(ofSize: 16)
        roleLable.font = .systemFont(ofSize: 14)
        roleLable.textColor = .gray
        
        labelesStackView = UIStackView(arrangedSubviews: [nameLable, roleLable])
        labelesStackView.axis = .vertical
        labelesStackView.spacing = 2
        labelesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelesStackView)
        
        NSLayoutConstraint.activate([
            labelesStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel){
        nameLable.text = viewModel.name
        roleLable.text = "Role: " + viewModel.role
    }
    
    
}
