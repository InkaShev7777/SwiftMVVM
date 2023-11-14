//
//  NetworkRequest.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 13.11.2023.
//

import Foundation
class NetworkRequest{
    static let shared = NetworkRequest()
    
    private init(){}
    
    func getData(comletionHandler: @escaping (Result<Data,NetworkError>) -> Void){
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil{
                    comletionHandler(.failure(.urlError))
                }else{
                    guard let data else{return}
                    comletionHandler(.success(data))
                }
            }
           
        }
    }
}
