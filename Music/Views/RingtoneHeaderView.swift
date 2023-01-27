//
//  RingtomeHeaderView.swift
//  Music
//
//  Created by Aksaule on 26.11.2022.
//

import UIKit
import SnapKit

class RingtoneHeaderView: UITableViewHeaderFooterView {
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Ringtones"
        label.textColor = UIColor(red: 232/255, green: 79/255, blue: 79/255, alpha: 1.0)
        label.font = UIFont(name: "GillSans", size: 30)
        return label
    }()
        
    lazy private var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.backgroundImage = UIImage()
        bar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search Artists, Moods, Songs", attributes: [
        .foregroundColor: UIColor.lightGray,
        .font: UIFont.boldSystemFont(ofSize: 10.0)
    ])
        return bar
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RingtoneHeaderView {
    func setUpViews() {
        contentView.addSubview(title)
        contentView.addSubview(searchBar)
    }
        
    func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
        }
            
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(10)
        }
    }
}
