//
//  PlayingSongCell.swift
//  Music
//
//  Created by Aksaule on 03.12.2022.
//

import UIKit
import SnapKit
import AVFoundation

class PlayingSongCell: UITableViewCell {
    var player = AVAudioPlayer()
    lazy private var touch = 0
    lazy private var count = 0
    
    lazy private var playButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "play.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for: .normal)
        return bt
    }()
    
    lazy private var songName: UILabel = {
        let label = UILabel()
        label.text = "Love Me Harder"
        label.font = UIFont(name: "GillSans", size: 17)
        return label
    }()
    
    lazy private var singer: UILabel = {
        let label = UILabel()
        label.text = "The Weeknd"
        label.font = UIFont(name: "GillSans", size: 11)
        label.textColor = .systemGray
        return label
    }()
    
    lazy private var sliderSong: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 200, height:23)
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.minimumTrackTintColor = UIColor(red: 232/255, green: 79/255, blue: 79/255, alpha: 1.0)
        let imageIcon = UIImage(systemName: "circle.fill")?.withTintColor(UIColor(red: 232/255, green: 79/255, blue: 79/255, alpha: 1.0), renderingMode: .alwaysOriginal)
        slider.setThumbImage(imageIcon, for: .normal)
        return slider
    }()
    
    lazy private var likeButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for: .normal)
        return bt
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        sliderSong.addTarget(self, action:  #selector(changeSlider), for: .valueChanged)
        playButton.addTarget(self, action: #selector(playSong), for: .touchUpInside)
//        var timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        var _ = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        likeButton.addTarget(self, action: #selector(changeLikeButton), for: .touchUpInside)
        setUpViews()
        setUpConstraints()
    }
    
    @objc func playSong(sender: UIButton) {
        let imageIcon1 = UIImage(systemName: "play.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageIcon2 = UIImage(systemName: "pause.circle")?.withTintColor(.red, renderingMode: .alwaysOriginal)
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
    
    @objc func updateSlider() {
        sliderSong.value = Float(player.currentTime)
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == sliderSong {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @objc func changeLikeButton() {
        let imageIcon1 = UIImage(systemName: "heart.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let imageIcon2 = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        if likeButton.isTouchInside {
            touch += 1
        }
        
        if touch % 2 == 0 {
            likeButton.setImage(imageIcon1, for: .normal)
        } else {
            likeButton.setImage(imageIcon2, for:.normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(playlist:PlayList) {
        songName.text = playlist.songName
        singer.text = playlist.artist
    }
    
    func setUpSongs(playlist:PlayList) {
        do {
            if let audioPath = Bundle.main.path(forResource: playlist.songName, ofType:"mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath:audioPath))
                sliderSong.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    }
}

extension PlayingSongCell {
    func setUpViews() {
        contentView.addSubview(playButton)
        contentView.addSubview(songName)
        contentView.addSubview(singer)
        contentView.addSubview(sliderSong)
        contentView.addSubview(likeButton)
    }
    
    func setUpConstraints() {
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(-8)
            make.bottom.equalTo(sliderSong.snp.top)
            make.trailing.equalTo(songName.snp.leading).inset(20)
        }
        
        songName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalTo(likeButton.snp.leading).inset(-10)
            make.width.equalTo(200)
        }
        
        singer.snp.makeConstraints { make in
            make.top.equalTo(songName.snp.bottom)
            make.leading.equalTo(playButton.snp.trailing).inset(18)
            make.trailing.equalTo(likeButton.snp.leading)
            make.bottom.equalTo(sliderSong.snp.top)
        }

        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(songName.snp.trailing).offset(100)
            make.bottom.equalTo(sliderSong.snp.top)
            make.trailing.equalToSuperview().inset(50)
        }
        
        sliderSong.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(23)
//            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
