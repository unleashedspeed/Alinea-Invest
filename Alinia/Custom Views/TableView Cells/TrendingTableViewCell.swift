//
//  TrendingTableViewswift
//  Alinia
//
//  Created by Saurabh Gupta on 16/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static let imageHeight: CGFloat = 48
    
    let trendingImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = imageHeight / 2

        return view
    }()
        
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let percentageChangeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10

        return label
    }()
    
    fileprivate func addSubViews() {
        contentView.addSubview(trendingImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(codeLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(percentageChangeLabel)
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            trendingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            trendingImageView.heightAnchor.constraint(equalToConstant: TrendingTableViewCell.imageHeight),
            trendingImageView.widthAnchor.constraint(equalTo: trendingImageView.heightAnchor),
            trendingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: trendingImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: trendingImageView.topAnchor, constant: 0),
            codeLabel.leadingAnchor.constraint(equalTo: trendingImageView.trailingAnchor, constant: 16),
            codeLabel.bottomAnchor.constraint(equalTo: trendingImageView.bottomAnchor, constant: 0),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            percentageChangeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            percentageChangeLabel.bottomAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 0),
            percentageChangeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            percentageChangeLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(equity: Equity) {
        trendingImageView.image = equity.image ?? AlenaImage.equityPlaceholder
        nameLabel.text = equity.name
        codeLabel.text = equity.listingCode
        priceLabel.text = "\(equity.currentPrice)$"
        percentageChangeLabel.text = "\(equity.changePercentage)%"
        percentageChangeLabel.backgroundColor = equity.changePercentage > 0 ? .systemGreen : .systemRed
        selectionStyle = .none
    }
    
}
