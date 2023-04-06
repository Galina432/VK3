//
//  UIImageView.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 07.08.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func showImage(with url: URL?) {
        guard let url = url else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else {
                return
            }
            
            let image = UIImage(data: data)
            self?.image = image
        }.resume()
    }
}

//let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 100))
//imageView.showImage(with: .init(string: "https://tdi.spb.ru/images/countries/Monako/monaco_2.jpg"))
