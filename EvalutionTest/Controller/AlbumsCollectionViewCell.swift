//
//  AlbumsCollectionViewCell.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

// Class show Album as Colllection View Cell
class AlbumsCollectionViewCell: UICollectionViewCell {
    // Album Image
    @IBOutlet weak var imageOutlet: UIImageView!
    // Name of album
    @IBOutlet weak var nameLabelOutlet: UILabel!
    // Name and Surname of album artist
    @IBOutlet weak var artistLabelOutlet: UILabel!
    // Genre of album
    @IBOutlet weak var genreLabelOutlet: UILabel!
    // Album Class
    var album: Album?
    
    func setAlbum(object: Album) {
        album = object
    }
}
