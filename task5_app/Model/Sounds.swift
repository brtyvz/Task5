//
//  Sounds.swift
//  task5_app
//
//  Created by Berat Yavuz on 3.09.2023.
//

import Foundation
import UIKit

struct Sound {
    var id: UUID = UUID()
    var name: String
    var description: String
}

struct Playlist {
    var id: UUID = UUID()
    var name: String
    var image: UIImage
    var songNumber: Int
}

struct Song {
    var id: UUID = UUID()
    var title: String
    var artist: String
}


struct MockData {
    static let sounds: [Sound] = [
        Sound(name: "Sound 1", description: "Description for Sound 1"),
        Sound(name: "Sound 2", description: "Description for Sound 2"),
        Sound(name: "Sound 3", description: "Description for Sound 3")
    ]
    
    static let songs: [Song] = [
        Song(title: "Song 1", artist: "Artist 1"),
        Song(title: "Song 2", artist: "Artist 2"),
        Song(title: "Song 3", artist: "Artist 3")
    ]
    
    
    static func createImage(named imageName: String) -> UIImage {
        
        if let image = UIImage(named: imageName) {
            return image
        } else {
            
            return UIImage()
        }
    }
    
    static let playlists: [Playlist] = [
        Playlist(name: "Playlist 1", image: createImage(named: "playlist1"), songNumber: 2),
        Playlist(name: "Playlist 2", image: createImage(named: "playlist2"), songNumber: 3),
        Playlist(name: "Playlist 3", image: createImage(named: "playlist3"), songNumber: 1)
    ]
}





