//
//  PlayersTableViewFooterView.swift
//  crocodile
//
//  Created by Artem Tischenko on 13.11.2021.
//

import Foundation
import UIKit

class StartGameTableViewFooterView: UIView {
    
    let button = UIButton()
    var didTapItem: (()->Void)?
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
    }
    
    func layout() {
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 90)
        button.setImage(UIImage(named: "newPlayer"), for: .normal)
        button.addTarget(self, action: #selector(imageDidTap), for: .touchUpInside)
        addSubview(button)
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(90)
        }
    }
    
    func setup(block: @escaping () -> Void) {
            didTapItem = block
    }
    
    @objc func imageDidTap(_ sender: UIView) {
        didTapItem?()
    }
}
