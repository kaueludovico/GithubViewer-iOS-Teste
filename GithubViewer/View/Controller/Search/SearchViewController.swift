//
//  ViewController.swift
//  GithubViewer
//
//  Created by Kaue Ludovico on 01/02/23.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    
    typealias CustomView = SearchScreenView
    let customView = SearchScreenView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customView.searchButton.addTarget(self, action: #selector(getDataAlamofire), for: .touchUpInside)
    }
    
    @objc func getDataAlamofire() {
        guard let baseUrl = URL(string: "https://api.github.com/users/\(customView.searchTextField.text ?? "")") else { return }
        
        AF.request(baseUrl, method: .get).response { response in
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try? jsonDecoder.decode(User.self, from: response.data ?? Data())
            
            print(json as Any, ">>>>>>>>>>>>>>> RETORNO COM DADOS")
        }
    }
    
    @objc func getData() {
        guard let baseUrl = URL(string: "https://api.github.com/users/\(customView.searchTextField.text ?? "")") else { return }
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let response = response as! HTTPURLResponse
            if response.statusCode < 400 {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let json = try? jsonDecoder.decode(User.self, from: data)
                    print(json as Any, ">>>>>>>>>>>>>>> RETORNO COM DADOS")
                }
            } else {
                print(error as Any, ">>>>>>>>>>> ERRO")
            }
        }
        task.resume()
    }
}

