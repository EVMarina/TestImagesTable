//
//  ImageTableViewCell.swift
//  TestImagesTable
//
//  Created by Marina on 14/06/2018.
//  Copyright © 2018 Marina. All rights reserved.
//

import UIKit

class ImageTableViewCell : UITableViewCell {
    
    /// Minimum cell view height
    var minimumHeight: CGFloat = 44.0 {
        didSet {
            heightConstraint.constant = minimumHeight
        }
    }
    
    var imageURL: URL? {
        didSet {
            guard let url = imageURL else {
                return
            }
            
            ImageLoader.loadImage(url: url) { (image) in
                guard let image = image else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.cellImageView.image = image                    
                }
            }
        }
    }
    
    /// Main left-handed title with fixed width
    let titleLabel = UILabel()
    
    /// Main image view
    private let cellImageView = UIImageView()
    
    /// Height constraint of cell view
    private var heightConstraint: NSLayoutConstraint!
    
    // MARK: - Reuse
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        cellImageView.image = nil
    }
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        construct()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        construct()
    }
    
    private func construct() {
        
        // views:
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.clipsToBounds = true
        cellImageView.contentMode = .scaleAspectFill
        self.addSubview(cellImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textAlignment = .left
        self.addSubview(titleLabel)
        
        // hugging/compression priority:
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        // x axis:
        titleLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cellImageView.leadingAnchor).isActive = true
        cellImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        // y axis:
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // dimension:
        titleLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cellImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        heightConstraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: minimumHeight)
        heightConstraint.isActive = true
    }
}
