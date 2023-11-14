//
//  MainViewController + TableView.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 13.11.2023.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCell(){
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell else{return UITableViewCell()}
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSource = viewModel.dataSource else{return}
        presentDetailsViewController(user: dataSource[indexPath.row])
        
    }
}
