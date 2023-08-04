//
//  PlayerTableCell.swift
//  ThisOrThat
//
//  Created by Victor on 03.05.2022.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell {
    
    private let playerName = UILabel()
    private let playerIcon = UIImageView()
    private let scoreLabel = UILabel()
    private var player: Player?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func layout() {
        layoutPlayerIcon()
        layoutPlayerName()
        layoutScoreLabel()
    }
    
    fileprivate func layoutPlayerIcon() {
        contentView.addSubview(playerIcon)
        
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
    
    fileprivate func layoutScoreLabel() {
        contentView.addSubview(scoreLabel)
        
        scoreLabel.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(10)
        }
        
    }
    
    func setup(player: Player) -> PlayerCell {
        self.player = player
        playerName.text = player.name
        playerName.textColor = .white
        playerName.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 17)
        
        playerIcon.image = UIImage(named: player.image)
        playerIcon.cornerRadius = 7.5
        
        
        scoreLabel.text = String("+1")
        scoreLabel.textColor = .gray
        scoreLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 17)
        
        return self
    }
    
    
}
