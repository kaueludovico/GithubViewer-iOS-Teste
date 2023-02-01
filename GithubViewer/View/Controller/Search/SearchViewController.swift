//
//  ViewController.swift
//  GithubViewer
//
//  Created by Kaue Ludovico on 01/02/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    typealias CustomView = SearchScreenView
    let customView = SearchScreenView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customView.searchButton.addTarget(self, action: #selector(getData), for: .touchUpInside)
    }
    
    @objc func getData() {
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.github.com/users/\(customView.searchTextField.text ?? "")")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            
            let resp = response as? HTTPURLResponse
            print(resp?.statusCode as Any, ">>>>>>>>>>>>>>>>>")
            
            print(String(data: data, encoding: .utf8)!, "FUNCIONA")
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
}

