//
//  ViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 05.04.2022.
//

import UIKit

//class ViewController: UIViewController {
//    
//    //let session = Session.instance //синглтон для хранения данных о текущей сессии
//   
//    @IBOutlet weak var imageVK: UIImageView!
//    
//    @IBOutlet weak var textHello: UILabel!
//    
//    @IBOutlet weak var login: UILabel!
//    
//    @IBOutlet weak var textLogin: UITextField!
//        
//    @IBOutlet weak var password: UILabel!
//    
//    @IBOutlet weak var textPassword: UITextField!
//    
//    @IBOutlet weak var butOpenVK: UIButton!
//    
//    @IBOutlet weak var scrollView: UIScrollView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
//        view.addGestureRecognizer(tapGR)
//    }
//    
//    @objc func hideScreen() {
//        view.endEditing(true)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(willShowKeyboard(_:)),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
//        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(willHideNotification(_:)),
//                                               name: UIResponder.keyboardWillHideNotification,
//                                               object: nil)
//        
//        // navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//    
//    @objc func willShowKeyboard(_ notification: Notification) {
//        
//        guard let info = notification.userInfo as NSDictionary?,
//              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else
//        {return}
//        
//        let keyboradHeight = keyboardSize.cgRectValue.size.height
//        
//        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboradHeight, right: 0)
//    }
//    
//    @objc func willHideNotification(_ notification: Notification) {
//        scrollView.contentInset = .zero
//    }
//    
//    
//    
//    @IBAction func tapButton(_ sender: Any) {
//        
//        guard let login = textLogin.text,
//              let password = textPassword.text,
//              login == "",
//              password == "" else {
//            show(message: "Введены неверные данные пользователя")
//            return
//        }
//        
//        performSegue(withIdentifier: "Login", sender: nil)
//    }
//}
//extension ViewController {
//    func show(message: String) {
//        
//        let alertVC = UIAlertController(title: "ОШИБКА",
//                                        message: message,
//                                        preferredStyle: .alert)
//        
//        let okAction = UIAlertAction(title: "OK",
//                                     style: .default,
//                                     handler: nil)
//        alertVC.addAction(okAction)
//        
//        present(alertVC, animated: true, completion: nil)
//    }
//}
//
