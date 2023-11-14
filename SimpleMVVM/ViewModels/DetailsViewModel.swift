//
//  DetailsViewModel.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 14.11.2023.
//

import Foundation

class DetailsViewModel{
    
    let name: String
    let password:String
    let role:String
    
    init(user: User){
        self.name = user.userName
        self.password = user.password
        self.role = user.role
    }
}
