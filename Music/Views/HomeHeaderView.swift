//
//  HomeHeaderView.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import UIKit
import SnapKit

class HomeHeaderView: UITableViewHeaderFooterView {
    let allInfo = Source.setImage()
    static var filteredData = [Gallery]()
    static var searching = false
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Wallpapers"
        label.textColor = UIColor(red: 232/255, green: 79/255, blue: 79/255, alpha: 1.0)
        label.font = UIFont(name: "GillSans", size: 30)
        return label
    }()
    
    lazy private var searchBar: UISearchBar = {
       let bar = UISearchBar()
       bar.backgroundImage = UIImage()
       bar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search People, Moods, Fashion", attributes: [
        .foregroundColor: UIColor.lightGray,
        .font: UIFont.boldSystemFont(ofSize: 10.0)
    ])
       return bar
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        searchBar.delegate = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        HomeHeaderView.filteredData = []
        if searchText == "" {
            HomeHeaderView.filteredData = allInfo
        }
        
        for d in allInfo {
            if d.type.uppercased().contains(searchText.uppercased()) {
                HomeHeaderView.filteredData.append(d)
            }
        }
        
        HomeHeaderView.searching = true
        AllCollectionTableViewCell.allCollectionView.reloadData()
    }
}

extension HomeHeaderView {
    func setUpViews() {
        contentView.addSubview(title)
        contentView.addSubview(searchBar)
    }
    
    func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(30)
        }
    }
}
