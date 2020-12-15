//
//  SortAlbum.swift
//  EvalutionTest
//
//  Created by Александр on 16.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

//Sort Function For Albums

func albumSort(albums: [Album]) -> [Album]{
      return albums.sorted { $0.name < $1.name }
}
