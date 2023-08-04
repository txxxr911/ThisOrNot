//
//  StartCustomCell.swift
//  WhoIsMost
//
//  Created by Victor on 15.04.2022.
//

import UIKit

class PlayerViewCell: UITableViewCell {

    private let playerName = UITextField()
    private let playerIcon = UIButton()
    private let closeButton = UIButton()
    private let background = UIImageView()
    private var player: Player?
    private var removeBlock: (() -> Void)?
    private var playerImageDidTapBlock: (() -> Void)?
    
        
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    fileprivate func layout() {
        layoutBackground()
        layoutPlayerIcon()
        layoutCloseImage()
        layoutPlayerNameTextField()
    }
    
    func setup(player: Player) -> PlayerViewCell {
        self.player = player
        playerName.text = player.name
        playerIcon.setImage(UIImage(named: player.image), for: .normal)
        if(player.sex == .man) {
            background.image = UIImage(named: "rectBlue")
        }
        else {
            background.image = UIImage(named: "rectPink")
        }
       
        playerName.delegate = self
        closeButton.addTarget(self, action: #selector(closeImageDidTap), for: .touchUpInside)
        playerName.addDoneButtonOnKeyboard()
        playerIcon.addTarget(self, action: #selector(playerImageDidTap), for: .touchUpInside)
        playerIcon.borderColor = .black
        return self
    }
    
    fileprivate func layoutBackground() {
        contentView.addSubview(background)
        background.image = UIImage(named: "rectBlue")
        background.snp.makeConstraints { make in
            
            make.width.equalTo(339)
            make.height.equalTo(85)
            make.centerX.centerY.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    fileprivate func layoutPlayerIcon() {
        addSubview(playerIcon)
        
        playerIcon.cornerRadius = 30
        playerIcon.borderWidth = 2
        playerIcon.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.centerY.equalToSuperview()
            make.left.equalTo(30)
        }
        
        
    }
    
    fileprivate func layoutPlayerNameTextField() {
        addSubview(playerName)

        playerName.attributedPlaceholder = NSAttributedString(string: "Введите имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSMutableAttributedString.Key.font: UIFont(name: "YanoneKaffeesatz-Bold", size: 24)])
        
        playerName.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 24)
        playerName.textColor = .white
            
        playerName.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(35)
            make.left.equalTo(playerIcon).inset(75)
            make.centerY.equalTo(contentView)
        }
    }
    
    fileprivate func layoutCloseImage() {
        addSubview(closeButton)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.contentMode = .scaleAspectFit
        closeButton.tintColor = .white
        closeButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.right.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
       }
    }
    

    
    @objc func closeImageDidTap(_ sender: UIView) {
        print("canceled")
        removeBlock?()
    }
    
    @objc func playerImageDidTap(_ sender: UIView) {
        print("sex changed")
        playerImageDidTapBlock?()
    }
    
}


extension PlayerViewCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        player?.name = textField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerName.resignFirstResponder()
        return true
    }
    
}



extension PlayerViewCell {
    func addRemoveBlock(block:@escaping ()->Void) -> PlayerViewCell {
        removeBlock = block
        return self
    }
    
    func addChangeSexBlock(block:@escaping ()->Void) -> PlayerViewCell {
        playerImageDidTapBlock = block
        return self
    }
}



extension UITextField {
    
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
            target: self, action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyboardToolbar
    }
}
