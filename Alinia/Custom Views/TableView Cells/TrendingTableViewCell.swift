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
    
    static var identifier: String {
        return String(describing: self)
    }
    
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
    
    var item: Asset? {
        didSet {
            trendingImageView.image = item?.image ?? AlenaImage.assetPlaceholder
            nameLabel.text = item?.name
            codeLabel.text = item?.listingCode
            priceLabel.text = "\(item?.currentPrice ?? 0)$"
            percentageChangeLabel.text = "\(item?.changePercentage ?? 0)%"
            percentageChangeLabel.backgroundColor = (item?.changePercentage ?? 0) > 0 ? .systemGreen : .systemRed
        }
    }
    
    fileprivate func addSubViews() {
        addSubview(trendingImageView)
        addSubview(nameLabel)
        addSubview(codeLabel)
        addSubview(priceLabel)
        addSubview(percentageChangeLabel)
        
        setConstraints()
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            trendingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trendingImageView.heightAnchor.constraint(equalToConstant: TrendingTableViewCell.imageHeight),
            trendingImageView.widthAnchor.constraint(equalTo: trendingImageView.heightAnchor),
            trendingImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: trendingImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: trendingImageView.topAnchor, constant: 0),
            codeLabel.leadingAnchor.constraint(equalTo: trendingImageView.trailingAnchor, constant: 16),
            codeLabel.bottomAnchor.constraint(equalTo: trendingImageView.bottomAnchor, constant: 0),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            percentageChangeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            percentageChangeLabel.bottomAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 0),
            percentageChangeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            percentageChangeLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trendingImageView.image = nil
        nameLabel.text = nil
        codeLabel.text = nil
        priceLabel.text = nil
        percentageChangeLabel.text = nil
        percentageChangeLabel.backgroundColor = nil
    }
}
