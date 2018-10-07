//
//  MovieCell.swift
//  flix
//
//  Created by Ellis Crawford on 8/31/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    var movie: Movie! {
        willSet(movie) {
            self.titleLabel.text = movie.title
            self.overviewLabel.text = movie.overview
            self.posterImageView.af_setImage(withURL: movie.posterURL!)
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

}
