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
    
    var imageModel: ImageModel? {
        didSet {
            guard let urlString = imageModel?.originalUrl, let url = URL(string: urlString) else {
                return
            }
            
            self.activityIndicator.startAnimating()
            
            if !ImageLoader.isImageInCache(url: url), let previewUrlString = imageModel?.previewUrl, let previewUrl = URL(string: previewUrlString) {
                ImageLoader.loadImage(url: previewUrl) { (image) in
                    guard let image = image, previewUrlString == self.imageModel?.previewUrl else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        
                        if self.cellImageView.image == nil {
                            self.blurEffectView.alpha = 1.0
                            self.cellImageView.image = image
                        }
                    }
                }
            }
            
            ImageLoader.loadImage(url: url) { (image) in
                guard let image = image, urlString == self.imageModel?.originalUrl else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    
                    self.cellImageView.image = image
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve, animations: {
                        self.blurEffectView.alpha = 0.0
                    }, completion: nil)
                }
            }
        }
    }
    
    /// Main left-handed title with fixed width
    let titleLabel = UILabel()
    
    /// Main image view
    private let cellImageView = UIImageView()
    
    /// Activity indicator while downloading image
    private let activityIndicator = UIActivityIndicatorView()
    
    /// Blur effect view on image view
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    /// Height constraint of cell view
    private var heightConstraint: NSLayoutConstraint!
    
    private var shoulLoadPreviewFirst: Bool = true
    
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
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1.0)
        self.addSubview(activityIndicator)
        
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.alpha = 0.0
        self.addSubview(blurEffectView)
        
        // hugging/compression priority:
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        // x axis:
        titleLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cellImageView.leadingAnchor).isActive = true
        cellImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        activityIndicator.leadingAnchor.constraint(equalTo: cellImageView.leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: cellImageView.trailingAnchor).isActive = true
        blurEffectView.leadingAnchor.constraint(equalTo: cellImageView.leadingAnchor).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: cellImageView.trailingAnchor).isActive = true
        
        // y axis:
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: cellImageView.topAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: cellImageView.bottomAnchor).isActive = true
        blurEffectView.topAnchor.constraint(equalTo: cellImageView.topAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: cellImageView.bottomAnchor).isActive = true
        
        // dimension:
        titleLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cellImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        heightConstraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: minimumHeight)
        heightConstraint.isActive = true
    }
    
}
