//
//  CategoryTableViewswift
//  Alinia
//
//  Created by Saurabh Gupta on 11/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    static let imageHeight: CGFloat = 48
    
    let categoryImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .center
        view.layer.cornerRadius = CategoryTableViewCell.imageHeight / 2

        return view
    }()
        
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = imageHeight - 4

        return view
    }()
    
    fileprivate func addSubViews() {
        containerView.addSubview(categoryImageView)
        containerView.addSubview(categoryLabel)
        contentView.addSubview(containerView)
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            categoryImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
            categoryImageView.heightAnchor.constraint(equalToConstant: CategoryTableViewCell.imageHeight),
            categoryImageView.widthAnchor.constraint(equalTo: categoryImageView.heightAnchor),
            categoryImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            categoryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            categoryLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            categoryLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 24)
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
    
    func configure(category: CategoryTableViewController.Category) {
        categoryLabel.text = category.localizedString
        categoryImageView.image = category.image
        containerView.backgroundColor = category.backgroundColor
        selectionStyle = .none
    }

}
