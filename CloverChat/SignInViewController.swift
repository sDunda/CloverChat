//
//  SignInViewController.swift
//  CloverChat
//
//  Created by D&M on 01.12.2017..
//  Copyright © 2017. Dunja Sasic. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var responseMessage: UITextView!

    override func viewDidLoad() {
        passwordField.isSecureTextEntry = true
        super.viewDidLoad()
    }

    @IBAction func signInTapped(_ sender: Any) {
        performQuery()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()               
    }
    func performQuery(){
        guard let username = usernameField.text.nilIfEmpty else {
            responseMessage.text = "Please enter username."
            return
        }
        guard let password = passwordField.text.nilIfEmpty else {
            responseMessage.text = "Please enter password."
            return
        }

        if username == "DunjaJobApplicant" && password == "password" {
            let parameters: [String : String] = [
                "organization": "clover",
                "username": username,
                "password": password
            ]
            let urlString = "https://spika.chat/api/v3/signin"
            let headers: HTTPHeaders = [
                "apikey" : "GMUwQIHielm7b1ZQNNJYMAfCC508Giof",
                "Content-Type": "application/json; charset=utf-8"
            ]

            Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON {
                response in
                switch response.result {
                case .success:
                    print(response)
                    break
                case .failure(let error):
                    print(error)
                }
            }
            let messageViewController = MessageViewController(nibName: "MessageViewController", bundle: nil)
            navigationController?.pushViewController(messageViewController, animated: true)
        } else {
            responseMessage.text = "You don't have permission to enter."
        }
    }
}

extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}
