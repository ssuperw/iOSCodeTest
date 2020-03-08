//  PopularMovieCell.swift
//  iOSCodeTest
//
//  Created by Simón Aparicio on 07/03/2020.
//  Copyright © 2020 iPon.es. All rights reserved.
//

import UIKit
import AlamofireImage

// TODO: The cell protocol for actions to pass data from cell to ViewController if needed (like mark as favourite feature)

protocol PopularMovieCell {
    func configure(id: Int, title: String, posterUrl: String, releaseDate: String, overview: String)
}

class PopularMovieCellImpl: UITableViewCell, PopularMovieCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    // This occurs when the xib is ready
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .white
    }
    
    func configure(id: Int, title: String, posterUrl: String, releaseDate: String, overview: String) {
        
        idLabel.text = String(format: "id: %@", String(id))
        titleLabel.text = title
        releaseDateLabel.text = releaseDate
        overviewLabel.text = overview
        
        // Load poster images from url
        guard let url = URL(string: posterUrl) else {
            return
        }
        posterImage.af.setImage(withURL: url)
    }
    
}
