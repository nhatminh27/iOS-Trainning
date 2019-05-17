//
//  AlamofireViewController.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class AlamofireViewController: UIViewController {
    
    @IBOutlet weak var listView: UITableView!
    
    let methods = [
        "GET",
        "POST",
        "Multipart Form Data",
        "PUT",
        "PATCH",
        "Download"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Alamofire Demo"
        self.listView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.listView.dataSource = self
        self.listView.delegate = self
    }
    
}

extension AlamofireViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = methods[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.get()
        }
        
        if indexPath.row == 1 {
            self.post()
        }
        
        if indexPath.row == 2 {
            self.multipartFormData()
        }
        
        if indexPath.row == 3 {
    
        }
        
        if indexPath.row == 4 {
         
        }
    }
    
}

extension AlamofireViewController {
    
    func get() {
        let parameters: [String: Any] = [
            "name": "HaoLe",
            "phone": "0123456789",
            "gender": true
        ]
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request("https://httpbin.org/get", method: HTTPMethod.get, parameters: parameters).responseJSON { response in
            MBProgressHUD.hide(for: self.view, animated: true)
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func post() {
        let parameters: [String: Any] = [
            "name": "HaoLe",
            "phone": "0123456789",
            "gender": true
        ]
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters).responseJSON { response in
            MBProgressHUD.hide(for: self.view, animated: true)
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func multipartFormData() {
        let parameters: [String: String] = [
            "name": "HaoLe",
            "phone": "0123456789"
        ]
        let image = UIImage(named: "ic_facebook")
        
        let formDataClosure: (MultipartFormData) -> Void = { formData in
            if let imageData = image?.pngData() {
                formData.append(imageData, withName: "", mimeType: "filename\(Date().timeIntervalSince1970)")
            }
            for (k, v) in parameters {
                formData.append(v.data(using: String.Encoding.utf8)!, withName: k)
            }
        }
        
        let completionHandler: (SessionManager.MultipartFormDataEncodingResult) -> Void = { encodingResult in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.upload(multipartFormData: formDataClosure, to: "https://httpbin.org/post", encodingCompletion: completionHandler)
    }
    
}
