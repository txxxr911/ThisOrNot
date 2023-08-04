//
//  SelectedViewCell.swift
//  ThisOrThat
//
//  Created by Victor on 05.05.2022.
//

import Foundation
import UIKit

class SelectedPlayerCell: UITableViewCell {
    
    private let background = UIImageView()
    private let playerName = UITextField()
    private let playerIcon = UIImageView()
    private let scoreRect = UIImageView()
    private let scoreLabel = UILabel()
    private var player: Player?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(player: Player) -> SelectedPlayerCell {
        
        background.image = UIImage(named: "select_row_background")
        
        self.player = player
        playerName.text = player.name
        playerName.textColor = .white
        playerName.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 17)
        
        playerIcon.image = UIImage(named: player.image)
        playerIcon.cornerRadius = 7.5
        
        scoreLabel.text = String(+1)
        scoreLabel.textColor = .gray
        scoreLabel.font = UIFont(name: "YannoneKaffeesatz-Bold", size: 17)
        
        return self
    }
    
    
    fileprivate func layout() {
        layoutBackground()
        layoutPlayerIcon()
        layoutPlayerName()
        layoutScoreLabel()
        layoutScoreRect()
    }
    
    fileprivate func layoutBackground() {
        contentView.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func layoutPlayerIcon() {
        contentView.addSubview(playerIcon)
        playerIcon.cornerRadius = 20
        
        playerIcon.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }
        
    }
    
    fileprivate func layoutPlayerName() {
        contentView.addSubview(playerName)
        
        playerName.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(15)
            make.centerY.equalToSuperview()
            make.left.equalTo(playerIcon.snp.right).inset(5)
        }
    }
    
    fileprivate func layoutScoreRect() {
        contentView.addSubview(scoreRect)
        scoreRect.image = UIImage(named: "+1_button")
        
        scoreRect.snp.makeConstraints { make in
            make.width.equalTo(44)
            make.height.equalTo(42)
            make.right.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
    }
    
    fileprivate func layoutScoreLabel() {
        contentView.addSubview(scoreLabel)
        
        scoreLabel.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(5)
        }
    }
}
