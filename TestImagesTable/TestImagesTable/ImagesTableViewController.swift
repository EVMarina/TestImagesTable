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
        ImageModel.init(originalUrl: "http://lookw.ru/8/810/1476139877-2.png", previewUrl: "http://www.wallpaperstop.com/wallpapers/3d-wallpapers/fantasy-wallpapers/fantasy-tree-336x210-162894.jpg"),
        ImageModel.init(originalUrl: "https://static.wallpapers-anime.com/upload/20170613/771/x/t/e/xteGEF.jpg", previewUrl: ""),
        ImageModel.init(originalUrl: "https://www.imgixx.com/images/2017/12/01/Fantasy-White-Unicorn-Android-Wallpaper.jpg", previewUrl: "https://f.vividscreen.info/soft/eede977cb3784f83258941fc147ef77e/Unicorn-320x320.jpg"),
        ImageModel.init(originalUrl: "http://funkyimg.com/i/24cxo.jpg", previewUrl: "https://best4kwallpapers.com/web/wallpapers/272218/320x240.jpg"),
        ImageModel.init(originalUrl: "https://look.com.ua/pic/201209/1024x768/look.com.ua-23446.jpg", previewUrl: "https://www.artleo.com/mini/201208/31251.jpg"),
        ImageModel.init(originalUrl: "http://ursa-tm.ru/forum/uploads/gallery/album_200/gallery_6_200_906341.jpeg", previewUrl: ""),
        ImageModel.init(originalUrl: "http://www.kartinki.me/download.php?img=201308/1024x1024/kartinki.me-15288.jpg", previewUrl: "https://fanparty.ru/fanclubs/loki-lafeyson/gallery/1773439_loki_lafeyson_medium.jpg"),
        ImageModel.init(originalUrl: "http://www.stihi.ru/pics/2017/04/23/7614.jpg", previewUrl: ""),
        ImageModel.init(originalUrl: "http://www.1366x768.net/large/201201/8110.jpg", previewUrl: "https://pm1.narvii.com/6821/f16316c686bb90f4df50c88397d2a166a447a450v2_00.jpg"),
        ImageModel.init(originalUrl: "https://otvet.imgsmail.ru/download/247916511_2ff509d10f4e76fbd3887a327c57c911_800.jpg", previewUrl: ""),
        ImageModel.init(originalUrl: "https://www2.shutterstock.com/blog/wp-content/uploads/sites/5/2015/12/shutterstock_235089946.jpg", previewUrl: "https://img.youtube.com/vi/uNOjiYpqEs4/0.jpg")
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
        cell.imageModel = dataSource[indexPath.row]
        
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
