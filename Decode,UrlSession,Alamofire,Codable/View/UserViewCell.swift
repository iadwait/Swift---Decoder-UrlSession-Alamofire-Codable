//
//  UserViewCell.swift
//  Decode,UrlSession,Alamofire,Codable
//
//  Created by Adwait Barkale on 23/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    var modelUser: UserModel?{
        didSet{
            userConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func userConfiguration()
    {
        lblID.text = "\(modelUser?.id ?? -1)"
        lblTitle.text = modelUser?.title ?? "NA"
        let status = modelUser?.getStatusAndColor()
        lblStatus.text = status?.0
        backgroundColor = status?.1
    }
    
}
