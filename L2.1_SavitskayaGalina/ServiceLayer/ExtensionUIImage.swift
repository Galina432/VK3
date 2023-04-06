//
//  ExtensionUIImage.swift
//  L2.1_SavitskayaGalina
//
//  Created by emil kurbanov on 11.08.2022.
//
import Foundation
import UIKit

// загурзка картинок по URL
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func loadImage(_ imageUrl: String) {
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else {
                print("error", error?.localizedDescription ?? "not localizedDescription")
                return
            }
            
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}


