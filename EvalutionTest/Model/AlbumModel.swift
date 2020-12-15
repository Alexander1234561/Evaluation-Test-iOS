//
//  AlbumModel.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import UIKit

// Struct Album for albums
struct Album{
    // Name of album
    var name: String
    // Name and Surname of album artist
    var artist: String
    // Genre of album
    var genre: String
    // Album Image
    var image: UIImage?
    // Album id, we can find songs with it
    var collectionId: Int
}
