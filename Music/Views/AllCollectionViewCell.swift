//
//  AllCollectionViewCell.swift
//  Music
//
//  Created by Aksaule on 28.11.2022.
//

import UIKit
import SnapKit

class AllCollectionViewCell: UICollectionViewCell {
      lazy var pictures: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    lazy var desc: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 10)
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
    
    func setImage(str: String) {
        pictures.image = UIImage(named: str)
    }
}

extension AllCollectionViewCell {
    func setUpViews() {
        self.addSubview(pictures)
        self.addSubview(desc)
    }
    
    func setUpConstraints() {
        pictures.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        desc.snp.makeConstraints { make in
            make.top.equalTo(pictures.snp.bottom).inset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
