//
//  ChatCell.swift
//  parse_chat
//
//  Created by Ellis Crawford on 9/26/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var messages : PFObject! {
        didSet {
            messageLabel.text = messages.object(forKey: "text") as? String
            if let user = messages.object(forKey: "user") as? PFUser {
                self.usernameLabel.text = user.username
            } else {
                self.usernameLabel.text = "🤖"
            }

        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
