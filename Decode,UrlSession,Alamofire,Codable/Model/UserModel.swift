//
//  ViewController.swift
//  Decode,UrlSession,Alamofire,Codable
//
//  Created by Adwait Barkale on 23/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation
import UIKit

struct UserModel : Codable {
	let userId : Int?
	let id : Int?
	let title : String?
	let completed : Bool?

	enum CodingKeys: String, CodingKey {

		case userId = "userId"
		case id = "id"
		case title = "title"
		case completed = "completed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
	}
    
    func getStatusAndColor() -> (String,UIColor)
    {
        if completed == true
        {
            return ("COMPLETED", UIColor.green)
        }else{
            return ("NOT COMPLETED", UIColor.red)
        }
    }

}
