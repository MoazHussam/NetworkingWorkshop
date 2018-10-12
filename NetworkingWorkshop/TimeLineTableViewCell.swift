//
//  TimeLineTableViewCell.swift
//  NetworkingWorkshop
//
//  Created by Moaz Ahmed on 10/12/18.
//  Copyright © 2018 Moaz. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    let avatarImageView: UILabel = {
        let imageView = UILabel()
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(userLabel)
        self.addSubview(captionLabel)
        self.addSubview(dateLabel)
        self.addSubview(avatarImageView)
        
        avatarImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, topConstant: 8, leadingConstant: 8, bottomConstant: 0, trailingConstant: 0, widthConstant: 0, heightConstant: 0)
        userLabel.anchor(top: self.avatarImageView.topAnchor, leading: self.avatarImageView.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, topConstant: 8, leadingConstant: 0, bottomConstant: 0, trailingConstant: 0, widthConstant: 0, heightConstant: 0)
        dateLabel.anchor(top: self.topAnchor, leading: avatarImageView.trailingAnchor, bottom: nil, trailing: nil, topConstant: 8, leadingConstant: 8, bottomConstant: 0, trailingConstant: 0, widthConstant: 0, heightConstant: 0)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
