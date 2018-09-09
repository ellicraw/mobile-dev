//
//  PhotoDetailsViewController.swift
//  tumblr_feed
//
//  Created by Ellis Crawford on 9/9/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit



class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoUrl = URL(string: urlString)
        photoImageView.af_setImage(withURL: photoUrl!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
