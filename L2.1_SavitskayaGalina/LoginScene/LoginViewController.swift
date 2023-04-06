//
//  LoginViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 07.06.2022.
//

import WebKit
import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            self.webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAuth()
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        print(params)
        if let token = params["access_token"], let userId = params["user_id"] {
            Session.instance.token = token
            Session.instance.userId = Int(userId)!
            print(token)
            print(userId)
            decisionHandler(.cancel)
            
            performSegue(withIdentifier: "Login", sender: self)
        }
    }
}
 
   private extension LoginViewController {
    func loadAuth() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8185992"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "friends, groups, photos, wall"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "0")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        print(request)
    
        webView.load(request)
    }
}

