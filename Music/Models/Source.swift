//
//  Source.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import Foundation

import UIKit

struct Gallery {
    var image: UIImage?
    var type: String
}
    
struct Source {
    static func setImage() ->[Gallery] {
            [
                .init(image: UIImage(named: "image1"), type: "nature"),
                .init(image: UIImage(named: "image2"), type: "city"),
                .init(image: UIImage(named: "image10"), type: "rain"),
                .init(image: UIImage(named: "image4"), type: "weather"),
                .init(image: UIImage(named: "image8"), type: "nature"),
                .init(image: UIImage(named: "image6"), type: "city"),
                .init(image: UIImage(named: "image7"), type: "rain"),
                .init(image: UIImage(named: "image5"), type: "weather"),
                .init(image: UIImage(named: "image9"), type: "nature"),
                .init(image: UIImage(named: "image3"), type: "city"),
                .init(image: UIImage(named: "image21"), type: "rain"),
                .init(image: UIImage(named: "image18"), type: "weather"),
                .init(image: UIImage(named: "image26"), type: "nature"),
                .init(image: UIImage(named: "image15"), type: "city"),
                .init(image: UIImage(named: "image20"), type: "weather"),
            ]
        }
    }

