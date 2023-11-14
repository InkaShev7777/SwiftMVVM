//
//  EndPoint.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 13.11.2023.
//

import Foundation

struct EndPoint{
    var path:String
}
extension EndPoint{
    //http://inkamonitor29-001-site1.ftempurl.com/Admin/GetAllListUsers
    var url:URL{
        var componets = URLComponents()
        componets.scheme = "http"
        componets.host = "inkamonitor29-001-site1.ftempurl.com"
        componets.path = "/" + path
        
        guard let url = componets.url else{
            preconditionFailure("Invalid URL components: \(componets)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET" // Set the appropriate HTTP method
            
        let atsPolicy = ATSConfigurator()
        atsPolicy.configureATS(for: &urlRequest)
        
        return url
    }
}

class ATSConfigurator{
    func configureATS(for request: inout URLRequest) {
        let atsSettings: [String: Any] = [
            "NSAppTransportSecurity": [
                "NSAllowsArbitraryLoads": true
            ]
        ]
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: atsSettings, options: [])
    }
}

extension EndPoint{
    static var users : Self{
        EndPoint(path: "Admin/GetAllListUsers")
    }
}
