//
//  Playlist.swift
//  Music
//
//  Created by Aksaule on 09.12.2022.
//

import Foundation
import UIKit

struct PlayList {
    var songName: String
    var artist: String
}

struct Playlist {
    static func setSongs() ->[PlayList] {
        [
            .init(songName:"Blinding Lights", artist: "The Weeknd"),
            .init(songName:"Call Out My Name", artist: "The Weeknd"),
            .init(songName:"The Hills", artist: "The Weeknd"),
            .init(songName:"Starboy", artist: "The Weeknd"),
            .init(songName:"Beauty in death", artist: "Chase Atlantic"),
            .init(songName:"Church", artist: "Chase Atlantic"),
            .init(songName:"Swim", artist: "Chase Atlantic"),
            .init(songName:"Tidal Wave", artist: "Chase Atlantic"),
            .init(songName:"Easy on me", artist: "Adele"),
            .init(songName:"Hello", artist: "Adele"),
            .init(songName:"Rolling in the deep", artist: "Adele"),
            .init(songName:"Someone like you", artist: "Adele"),
            .init(songName:"Diamonds", artist: "Rihanna"),
            .init(songName:"Love On The Brain", artist: "Rihanna"),
            .init(songName:"Rehab", artist: "Rihanna"),
            .init(songName:"Where Have You Been", artist: "Rihanna"),
        ]
    }
    
    static func makingGroup() -> [[PlayList]] {
        let theweekend = setSongs().filter {$0.artist == "The Weeknd" }
        let chaseAtlantic = setSongs().filter {$0.artist == "Chase Atlantic"}
        let adele = setSongs().filter {$0.artist == "Adele"}
        let rihanna = setSongs().filter {$0.artist == "Rihanna"}
        return [theweekend,chaseAtlantic,adele,rihanna]
    }
}
