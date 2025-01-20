//
//  MessageListItemCell.swift
//  PushMessenger
//
//  Created by haram on 1/20/25.
//

import Foundation
import UIKit

class MessageListItemCell:UITableViewCell{
    static let reuseIdentifier = String(describing: MessageListItemCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tempView:UIStackView = {
            let tempView = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            tempView.backgroundColor = .yellow
            
            let label = UILabel()
            label.text = "qqqqqqqqqqqqqqqq"
            
            tempView.addSubview(label)
            
            return tempView
        }()
        
        contentView.addSubview(tempView)
        
        tempView.snp.makeConstraints{
            $0.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
