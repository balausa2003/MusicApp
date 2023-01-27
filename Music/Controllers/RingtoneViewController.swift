//
//  RingtonViewController.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import UIKit
import SnapKit

class RingtoneViewController: UIViewController {
    lazy private var ringTableView: UITableView = {
        let tableView  = UITableView()
        tableView.tableHeaderView = RingtoneHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 130))
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
        ringTableView.dataSource = self
        ringTableView.delegate = self
        setUpViews()
        setUpConstraints()
    }
}

extension RingtoneViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = CategoryCollectionViewTableViewCell()
            return cell
        case 1:
            let cell = SongsTypesCollectionViewTableViewCell()
            return cell
        case 2:
            let cell = PlayingSongTableViewCell()
        
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 70
        case 2:
            return 520
        default:
            return 10
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension RingtoneViewController {
    func setUpViews() {
        view.addSubview(ringTableView)
    }
    
    func setUpConstraints() {
        ringTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
}
