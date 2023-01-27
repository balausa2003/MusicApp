//
//  AllCollectionTableViewCell.swift
//  Music
//
//  Created by Aksaule on 03.12.2022.
//

import UIKit
import SnapKit

class AllCollectionTableViewCell: UITableViewCell {
    let allGallery = Source.setImage()
    
    lazy private var allLabel: UILabel = {
        let label = UILabel()
        label.text = "All Collections"
        label.font = UIFont(name: "GillSans", size: 20)
        return label
    }()

    static var allCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 70, height: 80)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        collectionView.register(AllCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.AllCollectionViewCell)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        AllCollectionTableViewCell.allCollectionView.dataSource = self
        contentView.backgroundColor = .none
        setUpViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AllCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if HomeHeaderView.searching {
            return HomeHeaderView.filteredData.count
        }
        return allGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AllCollectionTableViewCell.allCollectionView.dequeueReusableCell(withReuseIdentifier:Constants.Identifiers.AllCollectionViewCell, for: indexPath) as! AllCollectionViewCell
        if HomeHeaderView.searching {
            cell.pictures.image = HomeHeaderView.filteredData[indexPath.row].image
        } else {
            cell.pictures.image = allGallery[indexPath.row].image
        }
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .none
        return cell
    }
}

extension AllCollectionTableViewCell {
    func setUpViews() {
        self.addSubview(allLabel)
        self.addSubview(AllCollectionTableViewCell.allCollectionView)
    }
    
    func setConstraints() {
        allLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(25)
            make.bottom.equalTo(AllCollectionTableViewCell.allCollectionView.snp.top).inset(-20)
        }
        
        AllCollectionTableViewCell.allCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview()
        }
    }
}
