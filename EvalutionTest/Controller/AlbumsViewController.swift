//
//  AlbumsViewController.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

// Class for the innitial Controller
class AlbumsViewController: UIViewController {

    //Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    
    //Array of Album struct
    var massOfAlbums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.albumsCollectionView.delegate = self
    }
    
    //Segue to the next Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? SongsViewController, let cell = sender as? AlbumsCollectionViewCell{
            dvc.album = cell.album
        }
    }
    
    //Unwind to main Controller
    @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
    }
}


//Collection View data source and delegate extension
extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Function returns number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return massOfAlbums.count
    }
    
    //Function returns number of cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    //Function returns cells information
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumsCollectionViewCell
        
        //Cells Data
        cell.nameLabelOutlet.text = massOfAlbums[indexPath.section].name
        cell.artistLabelOutlet.text = massOfAlbums[indexPath.section].artist
        cell.genreLabelOutlet.text = massOfAlbums[indexPath.section].genre
        if let im = massOfAlbums[indexPath.section].image {
            cell.imageOutlet.image = im
        }
        cell.setAlbum(object: massOfAlbums[indexPath.section])
        
        return cell
    }
}


//Search Bar source and delegate extension
extension AlbumsViewController: UISearchBarDelegate {
    
    //When clicked Enter Button, this Function makes request and reload collection view
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            //Change space on plus
            let newStr = String(searchText.map{ $0 == " " ? "+" : $0 })
            LoadedData.loadAlbums(search: newStr, completion: { album in
                self.massOfAlbums = albumSort(albums: album)
                self.albumsCollectionView.reloadData() })
        }
    }
}
