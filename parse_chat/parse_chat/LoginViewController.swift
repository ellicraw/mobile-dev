//
//  LoginViewController.swift
//  parse_chat
//
//  Created by Ellis Crawford on 9/26/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let alertController = UIAlertController(title: "Error", message: "One or more field(s) is empty", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default)
    func isValid() -> Bool {
        if usernameField.text == "" || passwordField.text == "" {
            present(alertController, animated: true)
            return false
        } else {
            return true
        }
    }
    @IBAction func onSignup(_ sender: Any) {
        let vaild = isValid()
        if !vaild {
            return
        }
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    @IBAction func onLogin(_ sender: Any) {
        let vaild = isValid()
        if !vaild {
            return
        }
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         alertController.addAction(OKAction)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
