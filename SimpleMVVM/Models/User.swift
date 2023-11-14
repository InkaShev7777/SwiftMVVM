//
//  Users.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 13.11.2023.
//

import Foundation

struct User: Codable{
    let userName: String
    let password: String
    let role: String
}
//enum Role: String, Codable {
//    case e = "E"
//    case k = "K"
//    case r = "R"
//    case w = "W"
//}
