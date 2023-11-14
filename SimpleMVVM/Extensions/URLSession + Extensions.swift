//
//  URLSession + Extensions.swift
//  SimpleMVVM
//
//  Created by Ilya Schevchenko on 13.11.2023.
//

import Foundation

extension URLSession{
    typealias Handler = (Data?, URLResponse?,Error?)-> Void
    
    @discardableResult
    func request(_ endPoint: EndPoint, handler: @escaping Handler) -> URLSessionDataTask{
        let task = dataTask(with: endPoint.url,completionHandler: handler)
        task.resume()
        return task
    }
}
