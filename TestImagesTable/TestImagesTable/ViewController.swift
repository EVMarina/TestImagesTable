//
//  ViewController.swift
//  TestImagesTable
//
//  Created by Marina on 14/06/2018.
//  Copyright © 2018 Marina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let welcomeBtn = UIButton(type: .system)
        welcomeBtn.layer.cornerRadius = 2.0
        welcomeBtn.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1.0)
        welcomeBtn.setTitleColor(.white, for: .normal)
        welcomeBtn.setTitle("START", for: .normal)
        welcomeBtn.addTarget(self, action: #selector(welcomeBtnPressed), for: .touchUpInside)
        welcomeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(welcomeBtn)
        
        welcomeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        welcomeBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        welcomeBtn.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        welcomeBtn.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    @objc private func welcomeBtnPressed() {
        
        let tableViewController = ImagesTableViewController(style: .plain)
        
        self.present(tableViewController, animated: true, completion: nil)
    }
    
}

