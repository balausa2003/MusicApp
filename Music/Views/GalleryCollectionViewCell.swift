//
//  GalleryCollectionViewCell.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import UIKit
import SnapKit

class GalleryCollectionViewCell: UICollectionViewCell {
  var pictures: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(photo: UIImage) {
        pictures.image = photo
    }
}

extension GalleryCollectionViewCell {
    func setUpViews() {
        contentView.addSubview(pictures)
    }
    
    func setUpConstraints() {
        pictures.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
