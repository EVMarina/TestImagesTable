//
//  ImagesTableViewController.swift
//  TestImagesTable
//
//  Created by Marina on 15/06/2018.
//  Copyright © 2018 Marina. All rights reserved.
//

import UIKit

class ImagesTableViewController: UITableViewController {
    
    private let dataSource = [
        "http://bipbap.ru/wp-content/uploads/2017/04/72fqw2qq3kxh.jpg",
        "http://yaustal.com/uploads/posts/2014-06/1401906451_art-krasivye-kartinki-art-baryshnya-1283260.jpeg",
        "http://moarrr.su/image/full/%D0%9A%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%90%D1%80%D1%82-%D0%9F%D1%80%D0%B8%D1%80%D0%BE%D0%B4%D0%B0-%D0%BE%D0%B7%D0%B5%D1%80%D0%BE-%D0%B2%D0%BE%D0%B4%D0%BE%D0%BF%D0%B0%D0%B4-30546648.jpeg",
        "http://bm.img.com.ua/nxs/img/prikol/images/large/1/2/308321_879389.jpg",
        "https://i.ytimg.com/vi/mjX7rYBaXvY/maxresdefault.jpg",
        "http://pristor.ru/wp-content/uploads/2017/09/%D0%9A%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D1%8B%D0%B5-%D0%B0%D1%80%D1%82-%D1%80%D0%B8%D1%81%D1%83%D0%BD%D0%BA%D0%B8-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BF%D0%BE%D0%B4%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-%D0%BD%D0%B5%D0%B2%D0%B5%D1%80%D0%BE%D1%8F%D1%82%D0%BD%D1%8B%D1%85-%D0%B8-%D1%83%D0%B4%D0%B8%D0%B2%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D1%85-1.jpg",
        "https://orig00.deviantart.net/ae59/f/2013/047/1/8/to_catch_the_moonfish_by_qinni-d5v0kqt.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLvQ-kduJdZ2hQXkUUEQzdHQyyFuQK3EX2_yy88uALzBaDwK3Y",
        "https://img1.fonwall.ru/o/dz/drone-fire-weapon.jpg?route=thumb&h=350",
        "https://cdna.artstation.com/p/assets/images/images/005/764/258/large/vera-alexs-201704-2.jpg?1493615875",
        "http://moarrr.su/image/full/%D0%90%D1%80%D1%82-%D0%9A%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%9F%D1%80%D0%B8%D1%80%D0%BE%D0%B4%D0%B0-%D0%B2%D1%83%D0%BB%D0%BA%D0%B0%D0%BD-%D1%81%D0%B0%D0%BA%D1%83%D1%80%D0%B0-55757815.jpeg",
        "https://njj8ooxz61-flywheel.netdna-ssl.com/wp-content/uploads/2017/08/3567847-4k-resolution-wallpaper.jpg",
        "http://img01.deviantart.net/8c7b/i/2015/239/d/5/lava_golem_by_jjpeabody-d97ca4h.jpg",
        "http://moarrr.su/image/full/Todor-Hristov-%D0%90%D1%80%D1%82-%D0%A4%D1%8D%D0%BD%D1%82%D0%B5%D0%B7%D0%B8-%D0%9A%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%9F%D1%80%D0%B8%D1%80%D0%BE%D0%B4%D0%B0-%D0%B7%D0%B0%D0%BC%D0%BE%D0%BA-%D0%B4%D1%80%D0%B0%D0%BA%D0%BE%D0%BD-hires-95731484.jpeg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.reuseId)
        tableView.separatorColor = .clear
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseId, for: indexPath) as! ImageTableViewCell
        
        cell.minimumHeight = self.tableView.bounds.height * 0.25
        cell.titleLabel.text = "\(indexPath.row)"
        if let url = URL(string: dataSource[indexPath.row]) {
            cell.imageURL = url
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
