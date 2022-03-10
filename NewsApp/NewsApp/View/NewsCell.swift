//
//  NewsCell.swift
//  NewsApp
//
//  Created by Neha Vishnoi on 10/03/22.
//

import UIKit

class NewsCell: UITableViewCell {
    
    var news : News? {
        didSet {
            newsImage.imageFromServerURL(urlString: (news?.urlToImage)!, PlaceHolderImage: nil)
            newsTitleLabel.text = news?.title
            newsDescriptionLabel.text = news?.description
        }
    }
    
    
    private let newsTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let newsDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let newsImage : UIImageView = {
        let imgView = UIImageView(image: nil)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImage)
        addSubview(newsTitleLabel)
        addSubview(newsDescriptionLabel)
        
        newsImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 100, height: 100, enableInsets: false)
        newsTitleLabel.anchor(top: topAnchor, left: newsImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        newsDescriptionLabel.anchor(top: newsTitleLabel.bottomAnchor, left: newsImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
