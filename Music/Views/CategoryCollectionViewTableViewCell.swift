//
//  CategoryCollectionViewTableViewCell.swift
//  Music
//
//  Created by Aksaule on 26.11.2022.
//

import UIKit
import SnapKit

class CategoryCollectionViewTableViewCell: UITableViewCell {
    let songsByGroup = Playlist.makingGroup()
    let artists = ["The Weeknd" , "Chase Atlantic" , "Adele" , "Rihanna"]
    let photoArtists = ["weeknd" , "chase" , "adele" , "rihanna"]
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Albums"
        label.font = UIFont(name: "GillSans", size: 20)
        return label
    }()
    
    lazy private var songsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 130, height: 185)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.CategoryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        songsCollectionView.dataSource = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = songsCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.CategoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15
        cell.setUpSongs(playlist: songsByGroup[indexPath.row][indexPath.row])
        cell.setUpInfos(artist:artists[indexPath.row], image:photoArtists[indexPath.row])
        return cell
    }
}

extension CategoryCollectionViewTableViewCell {
    func setUpViews() {
        contentView.addSubview(title)
        contentView.addSubview(songsCollectionView)
    }
    
    func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.trailing.leading.equalToSuperview().inset(30)
            make.bottom.equalTo(songsCollectionView.snp.top)
        }
        
        songsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(20)
        }
    }
}
