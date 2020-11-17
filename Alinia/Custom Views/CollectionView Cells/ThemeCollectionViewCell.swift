//
//  ThemeCollectionViewCell.swift
//  Alinia
//
//  Created by Saurabh Gupta on 17/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    let themeImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit

        return view
    }()
        
    let themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 4
        view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.isLayoutMarginsRelativeArrangement = true
        
        return view
    }()
    
    var item: ThemeViewModelItem? {
        didSet {
            guard let item = item as? ThemeViewModelStandardItem else {
                return
            }
            
            themeImageView.image = item.image
            themeLabel.text = item.name
        }
    }
    
    fileprivate func addSubViews() {
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(themeImageView)
        stackView.addArrangedSubview(themeLabel)

        setConstraints()
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            themeImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: -60),
        ])
    }
    
    fileprivate func customizeContentView() {
        contentView.backgroundColor = .quaternarySystemFill
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.quaternarySystemFill.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
        customizeContentView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
