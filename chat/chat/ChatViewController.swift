//
//  ChatViewController.swift
//  chat
//
//  Created by Ellis Crawford on 9/20/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    class Message: PFObject, PFSubclassing {
        override class func initialize() {
            self.registerSubclass()
        }
        // properties/fields must be declared here
        // @NSManaged to tell compiler these are dynamic properties
        // See https://stackoverflow.com/questions/31357564/what-does-nsmanaged-do
        @NSManaged var text: String
        @NSManaged var username: String
        
        // returns the Parse name that should be used
        class func parseClassName() -> String {
            return "Message"
        }
    }

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatMessageField: UITextField!
    
    var messages: [PFObject] = []
    var refresher:UIRefreshControl!
    let chatMessage = PFObject(className: "Message")

    @IBAction func onSend(_ sender: Any) {
        
        chatMessage["text"] = chatMessageField.text ?? ""
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Auto size row height based on cell autolayout constraints
        tableView.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        tableView.estimatedRowHeight = 50
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(getMessages), for: .valueChanged)
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getMessages), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let singleMessage = self.messages[indexPath.row] as! Message
        let messageString = singleMessage.text
//        let usernameString = singleMessage.username
        cell.messageLabel.text = messageString
//        cell.usernameLabel.text = usernameString
        
        if let user = chatMessage["username"] as? PFUser {
            // User found! update username label with username
            cell.usernameLabel.text = user.username
        } else {
            // No user found, set default username
            cell.usernameLabel.text = "🤖"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func getMessages() {
        let predicate = NSPredicate(format: "text != ''")
        let query = Message.query(with: predicate)
        query?.addAscendingOrder("createdAt")
        
        query?.findObjectsInBackground { (msgs: [PFObject]?, error: Error?) in
            if let msgs = msgs {
                self.messages = msgs
                self.tableView.reloadData()
            } else {
                print("Error retrieving messages")
            }
        }
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
