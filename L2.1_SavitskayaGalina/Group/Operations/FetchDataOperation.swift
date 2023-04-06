//
//  FetchDataOperation.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 29.01.2023.
//

import Foundation

//class FetchDataOperation: AsyncOperation {
//
//    var request: URLRequest
//    var outputData: Data?
//
//    init(request: URLRequest) {
//        self.request = request
//    }
//
//    private var dataTask: URLSessionDataTask?
//
//    override func cancel() {
//        guard outputData == nil else { return }
//        dataTask?.cancel()
//        super.cancel()
//    }
//
//    override func main() {
//        dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, _, _ in
//            self?.outputData = data
//            self?.state = .finished
//        }
//        dataTask?.resume()
//    }
//}

