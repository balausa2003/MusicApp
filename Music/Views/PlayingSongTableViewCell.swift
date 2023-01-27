//
//  PlayingSongTableViewCell.swift
//  Music
//
//  Created by Aksaule on 03.12.2022.
//

import UIKit
import SnapKit

class PlayingSongTableViewCell: UITableViewCell {
    let songs = Playlist.setSongs()
    lazy private var playSongTableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        playSongTableView.dataSource = self
        playSongTableView.delegate = self
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension PlayingSongTableViewCell: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PlayingSongCell()
        cell.configure(playlist: songs[indexPath.row])
        cell.setUpSongs(playlist: songs[indexPath.row])
        return cell
    }
}

extension PlayingSongTableViewCell {
    func setUpViews() {
        contentView.addSubview(playSongTableView)
    }
    
    func setUpConstraints() {
        playSongTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
