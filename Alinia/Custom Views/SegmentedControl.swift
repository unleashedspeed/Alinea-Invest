//
//  SegmentedControl.swift
//  Alinia
//
//  Created by Saurabh Gupta on 23/11/20.
//  Copyright © 2020 Saurabh Gupta. All rights reserved.
//

import UIKit

// SegmentedControl is a reusable and configurable UIControl for creating Android like tabs in iOS. It can easily be used across View Controllers and Views. A demostratino is available in ExploreViewController.swift
class SegmentedControl: UIControl {
    
    var segments = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    var titles: [String] = [""] {
        didSet {
            updateView()
        }
    }
    
    var textColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    
    var selectorColor: UIColor = .systemIndigo {
        didSet {
            updateView()
        }
    }
    
    var selectorTextColor: UIColor = .systemIndigo {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Refresh the SegmentedControl
    // Removes all the buttons so that buttons are not added again and again, creates new buttons and put them in an horizontally arranged stack view.
    func updateView() {
        segments.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        // Adds new buttons with titles
        for title in titles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(selectedSegment(button:)), for: .touchUpInside)
            segments.append(button)
        }
        segments[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(titles.count)
        let y = (self.frame.maxY - self.frame.minY) - 3.0
        selector = UIView(frame: CGRect(x: 0, y: y, width: selectorWidth, height: 3.0))
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        // Create a StackView
        let stackView = UIStackView(arrangedSubviews: segments)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.0
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    // Action when a segment button is tapped.
    @objc func selectedSegment(button: UIButton) {
        for (index, segment) in segments.enumerated() {
            segment.setTitleColor(textColor, for: .normal)
            if segment == button {
                selectedSegmentIndex = index
                let selectorStartPosition = frame.width / CGFloat(segments.count) * CGFloat(index)
                UIView.animate(withDuration: 0.1, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                segment.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        
        sendActions(for: .valueChanged)
    }
    
    // Updates the current segment of segmented control.
    func updateSegmentedControlSegment(with index: Int) {
        for button in segments {
            button.setTitleColor(textColor, for: .normal)
        }
        
        let selectorStartPosition = frame.width / CGFloat(segments.count) * CGFloat(index)
        UIView.animate(withDuration: 0.1, animations: {
            self.selector.frame.origin.x = selectorStartPosition
        })
        
        segments[index].setTitleColor(selectorTextColor, for: .normal)
    }
}
