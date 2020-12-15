//
//  SongsViewController.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController {

    // Album Image
    @IBOutlet weak var imageOutlet: UIImageView!
    // Album Name
    @IBOutlet weak var nameLabelOutlet: UILabel!
    // Album Artist
    @IBOutlet weak var artistLabelOutlet: UILabel!
    // Album Genre
    @IBOutlet weak var genreLabelOutlet: UILabel!
    
    
    @IBOutlet weak var songsTableView: UITableView!
    
    //Array of songs in Album
    var massOfSongs: [Song] = []
    
    //struct of current Album
    var album: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        songsTableView.delegate = self
        imageOutlet.image = album?.image
        nameLabelOutlet.text = album?.name
        artistLabelOutlet.text = album?.artist
        genreLabelOutlet.text = album?.genre
        
        //Get request
        LoadedData.loadSongs(id: album!.collectionId, completion: { songs in
            self.massOfSongs = songs
            self.songsTableView.reloadData() })
        
    }
}

//Table View data source and delegate extension
extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    //Function returns number of cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massOfSongs.count
    }
    
    //Function returns cells information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongsTableViewCell
        
        cell.numberLabelOutlet.text = String(indexPath.row + 1)
        cell.nameLabelOutlet.text = massOfSongs[indexPath.row].name
        cell.artistLabelOutlet.text = massOfSongs[indexPath.row].artist
        
        return cell
    }
}

