//
//  UserViewModel.swift
//  Decode,UrlSession,Alamofire,Codable
//
//  Created by Adwait Barkale on 23/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import Alamofire

class UserViewModel
{
    var vc: ViewController?
    var arrUsers = [UserModel]()
    
    func getAllUsersDataAF()
    {
        AF.request("https://jsonplaceholder.typicode.com/todos/").response { response in
            if let data = response.data{
                do{
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    //print(userResponse)
                    //                        for users in userResponse{
                    //                            self.arrUsers.append(users)
                    //                        }
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tableView.reloadData()
                    }
                    print(self.arrUsers)
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    func getAllUsersData()
    {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error) in
            if error == nil{
                if let data = data{
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        //print(userResponse)
                        //                        for users in userResponse{
                        //                            self.arrUsers.append(users)
                        //                        }
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                        print(self.arrUsers)
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
}
