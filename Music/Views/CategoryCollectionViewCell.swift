//
//  CategoryCollectionViewCell.swift
//  Music
//
//  Created by Aksaule on 26.11.2022.
//

import UIKit
import SnapKit
import AVFoundation

class CategoryCollectionViewCell: UICollectionViewCell {
    lazy private var count = 0
    let songByGroup = Playlist.makingGroup()
    var player = AVAudioPlayer()
    let overlay = UIView()
    lazy private var pictures: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "guitar")
        return imageView
    }()
    
    lazy private var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Classical Guitar"
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = .white
        return label
    }()
    
    lazy private var playButton: UIButton = {
        let button = UIButton()
        let imageIcon = UIImage(systemName: "play.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(imageIcon, for: .normal)
        return button
    }()
    
    lazy private var numberRings: UILabel = {
        let label = UILabel()
        label.text = "Ringtones"
        label.font = UIFont(name: "GillSans", size: 10)
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playButton.addTarget(self, action: #selector(playSong), for: .touchUpInside)
        setUpViews()
        setUpConstraints()
        addoverlay()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func playSong(sender: UIButton) {
        let imageIcon1 = UIImage(systemName: "play.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageIcon2 = UIImage(systemName: "pause.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        if playButton.isTouchInside {
            count += 1
        }
        
        if count % 2 == 0 {
            playButton.setImage(imageIcon1, for: .normal)
            player.pause()
        } else {
            playButton.setImage(imageIcon2, for: .normal)
            player.play()
        }
        print(player.currentTime)
    }

    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.5) {
        overlay.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
    }
    
    func setUpSongs(playlist:PlayList) {
        do {
            if let audioPath = Bundle.main.path(forResource:playlist.songName , ofType:"mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath:audioPath))
            }
        } catch {
            print("Error")
        }
    }
    
    func setUpInfos(artist: String , image: String) {
        genreLabel.text = artist
        pictures.image = UIImage(named:image)
    }
}

extension CategoryCollectionViewCell {
    func setUpViews() {
        contentView.addSubview(pictures)
        contentView.addSubview(overlay)
        contentView.addSubview(genreLabel)
        contentView.addSubview(playButton)
        contentView.addSubview(numberRings)
    }
        
    func setUpConstraints() {
        genreLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(30)
        }
        
        numberRings.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(10)
            make.leading.equalTo(playButton.snp.trailing).offset(20)
            make.bottom.equalToSuperview().inset(30)
        }
            
        pictures.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
