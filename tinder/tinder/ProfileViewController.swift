//
//  ProfileViewController.swift
//  tinder
//
//  Created by Ellis Crawford on 10/29/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var profileImage: UIImage!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.image = profileImage

    }
    
    @IBAction func didTapDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
