//
//  SongsTypesCollectionViewCell.swift
//  Music
//
//  Created by Aksaule on 01.12.2022.
//

import UIKit
import SnapKit

class SongsTypesCollectionViewCell: UICollectionViewCell {
    lazy private var songCategory: UILabel = {
       let label = UILabel()
        label.text = "Favorites"
        label.font = UIFont(name: "GillSans", size: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func configure(title: String) {
        songCategory.text = title
    }
}

extension SongsTypesCollectionViewCell {
    func setUpViews() {
        contentView.addSubview(songCategory)
    }
    
    func setUpConstraints() {
        songCategory.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()
        }
    }
}
