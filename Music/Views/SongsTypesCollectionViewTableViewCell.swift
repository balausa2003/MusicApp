//
//  SongsTypesCollectionViewTableViewCell.swift
//  Music
//
//  Created by Aksaule on 30.11.2022.
//

import UIKit
import SnapKit

class SongsTypesCollectionViewTableViewCell: UITableViewCell {
    let songTitles = ["Featured", "Trending", "Latest", "Favorites"]
    lazy private var songsTypesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 50)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        collectionView.register(SongsTypesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.SongsTypesCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        songsTypesCollectionView.dataSource = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SongsTypesCollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = songsTypesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.SongsTypesCollectionViewCell, for: indexPath ) as! SongsTypesCollectionViewCell
        cell.configure(title:songTitles[indexPath.row])
        return cell
    }
}

extension SongsTypesCollectionViewTableViewCell {
    func setUpViews() {
        contentView.addSubview(songsTypesCollectionView)
    }
    
    func setUpConstraints() {
        songsTypesCollectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
}
