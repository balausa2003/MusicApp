//
//  HomeViewController.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    lazy private var homeTableView: UITableView = {
        let tableView  = UITableView()
        tableView.tableHeaderView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 130))
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = 60
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner , .layerMaxXMaxYCorner]
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 232/255, green: 79/255, blue: 79/255, alpha: 1.0)
        self.modalPresentationStyle = .fullScreen
        homeTableView.dataSource = self
        homeTableView.delegate = self
        setUpViews()
        setUpConstraints()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 195
        default:
            return 600
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = GalleryCollectionViewTableViewCell()
            return cell
        case 1:
            let cell = AllCollectionTableViewCell()
            cell.backgroundColor = .systemBackground
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController {
    func setUpViews() {
        view.addSubview(homeTableView)
    }
    
    func setUpConstraints() {
        homeTableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
}
