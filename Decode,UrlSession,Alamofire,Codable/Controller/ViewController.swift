//
//  ViewController.swift
//  Decode,UrlSession,Alamofire,Codable
//
//  Created by Adwait Barkale on 23/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userViewModel.vc = self
        userViewModel.getAllUsersDataAF()
        configureTable()
    }
    
    func configureTable()
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserViewCell", bundle: nil), forCellReuseIdentifier: "userCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserViewCell
        let data = userViewModel.arrUsers[indexPath.row]
        cell.modelUser = data
        //cell.userConfiguration()
        return cell
    }

}

