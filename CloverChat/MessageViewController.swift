//
//  MessageViewController.swift
//  CloverChat
//
//  Created by D&M on 01.12.2017..
//  Copyright © 2017. Dunja Sasic. All rights reserved.
//

import UIKit
import Alamofire

class MessageViewController: UIViewController {

    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendTapped(_ sender: Any) {
        sendMessage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func sendMessage() {
        let parameters: [String : String] = [
            "targetType" : "3",
            "messageType" : "1",
            "target" : "5a05ccd4829e64fd1dcd7732",
            "message" : messageText.text
        ]
        let urlString = "https://spika.chat/api/v3/messages"
        let headers: HTTPHeaders = [
            "apikey" : "GMUwQIHielm7b1ZQNNJYMAfCC508Giof",
            "Content-Type": "application/json; charset=utf-8",
            "access-token" : "Q6A7TlbPC3PHNP1u"
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
    }
}


