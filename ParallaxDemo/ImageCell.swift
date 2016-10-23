//
//  ImageCell.swift
//  ParallaxDemo
//
//  Created by Alan Flament on 23/10/2016.
//  Copyright © 2016 Alan Flament. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

  // MARK: - Outlets
  
  @IBOutlet weak var parallaxImage: UIImageView!
  @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
  @IBOutlet weak var parallaxImageTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageTitle: UILabel!

  // MARK: - Initialiazation
  
  override func awakeFromNib() {
    super.awakeFromNib()
    parallaxImage.clipsToBounds = true
  }
  
  // MARK: - Configuration
  
  func configureCell(title: String, image: UIImage) {
    parallaxImage.image = image
    imageTitle.text = title
  }
}
