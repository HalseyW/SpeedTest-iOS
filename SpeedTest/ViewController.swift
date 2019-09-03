//
//  ViewController.swift
//  SpeedTest
//
//  Created by Wushhhhhh on 2019/9/1.
//  Copyright © 2019 wushhhhhh. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        networkManager.authorizationRequest()
    }
    
    @objc func onClickDownloadButton(_ sender: UIButton) {
        networkManager.download()
    }

}

extension ViewController {
    func initView() {
        let btnDownload = UIButton()
        btnDownload.backgroundColor = .black
        self.view.addSubview(btnDownload)
        btnDownload.snp.makeConstraints { (make) in
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
        btnDownload.addTarget(self, action: #selector(onClickDownloadButton(_:)), for: .touchUpInside)
    }
}
