//
//  MainCellViewModel.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 14.11.2023.
//

import Foundation

class MainCellViewModel{
    var name: String
    var role: String
    
    init(_ user: User){
        self.name = user.userName
        self.role = user.role
    }
}
