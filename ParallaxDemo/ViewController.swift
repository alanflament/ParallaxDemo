//
//  ViewController.swift
//  ParallaxDemo
//
//  Created by Alan Flament on 23/10/2016.
//  Copyright © 2016 Alan Flament. All rights reserved.
//
// Source: https://www.youtube.com/watch?v=4f65hctNXro&feature=youtu.be&list=PLpZBns8dFbgz7BWwgq1Hkaazu0hLg9xHg&utm_content=buffer4b4f3&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer

import UIKit

class ViewController: UIViewController {

  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Constants
  
  var parallaxOffsetSpeed: CGFloat = 60
  var cellHeight: CGFloat = 250
  
  // MARK: - Parallax
  
  var parallaxImageHeight: CGFloat {
    let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * tableView.frame.height) - cellHeight) / 2
    return maxOffset + cellHeight
  }
  
  func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
    return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? ImageCell else {
      fatalError()
    }
    
    cell.configureCell(title: "Image \(indexPath.row)", image: UIImage(named: "Image-\(indexPath.row)")!)
    cell.parallaxImageHeight.constant = parallaxImageHeight
    cell.parallaxImageTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
    
    return cell
  }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = tableView.contentOffset.y
    for cell in tableView.visibleCells as! [ImageCell] {
      cell.parallaxImageTopConstraint.constant = parallaxOffset(newOffsetY: offsetY, cell: cell)
    }
  }
}
