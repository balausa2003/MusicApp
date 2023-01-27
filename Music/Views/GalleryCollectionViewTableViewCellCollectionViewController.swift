//
//  GalleryCollectionViewTableViewCellCollectionViewController.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import UIKit
import SnapKit

class GalleryCollectionViewTableViewCell: UITableViewCell {
    var galleries = Source.setImage()
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "My Favourites"
        label.font = UIFont(name: "GillSans", size: 20)
        return label
    }()
    
    lazy private var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 105, height: 175)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.GalleryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        galleryCollectionView.dataSource = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleries.count/5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.GalleryCollectionViewCell, for: indexPath) as! GalleryCollectionViewCell
        cell.pictures.image = galleries[indexPath.row].image
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15
        return cell
    }
}

extension GalleryCollectionViewTableViewCell {
    func setUpViews() {
        contentView.addSubview(title)
        contentView.addSubview(galleryCollectionView)
    }
    
    func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.trailing.leading.equalToSuperview().inset(30)
            make.bottom.equalTo(galleryCollectionView.snp.top)
        }
        
        galleryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(20)
        }
    }
}
