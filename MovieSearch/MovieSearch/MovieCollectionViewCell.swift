//
//  MovieCollectionViewCell.swift
//  MovieSearch
//
//  Created by Deepinderpal Singh on 06/11/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "MovieCollectionViewCell"
    
    static func nib()-> UINib {
        return UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    }
    func configure(with model: Movie) {
        self.titleLabel.text = model.Title
        self.yearLabel.text = model.Year
        let url = model.Poster
        if let data =  try? Data(contentsOf: URL(string:url)!) {
            self.posterImageview.image = UIImage(data: data)
        }
        
    }
}
