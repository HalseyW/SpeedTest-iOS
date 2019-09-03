//
//  NetworkManager.swift
//  SpeedTest
//
//  Created by HalseyW-15 on 2019/9/2.
//  Copyright © 2019 wushhhhhh. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let downloadURL = URL(string: "http://gaia-cloud.oss-cn-hangzhou.aliyuncs.com/netdisc%2F7%2FHDR02.mov?OSSAccessKeyId=LTAI8nVuIPeAqsvt&Expires=1598947128&Signature=8U3ma7CpS1sOvzlc%2Bg2q2%2BEwFP8%3D")
    
    let alamofireManager: SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return Alamofire.SessionManager(configuration: configuration, serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
    }()
    
    func buildDownloadDestination() -> DownloadRequest.DownloadFileDestination {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("speed_test.mov")
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        return destination
    }
    
    func download() {
//        let request = alamofireManager.download(downloadURL!, to: buildDownloadDestination())
//        request.response { (response) in
//            self.deleteTmpFiles()
//            guard let res = response.response else {
//                print("fail")
//                return
//            }
//            if res.statusCode == 200 {
//                print("success")
//            } else {
//                print("fail: \(res.statusCode)")
//            }
//        }.downloadProgress { (progress) in
//            print("\(progress.fractionCompleted)")
//        }
        
        let task = URLSession.shared.downloadTask(with: downloadURL!)
        task.resume()
        
        DispatchQueue.global().async {
            let task = URLSession.shared.downloadTask(with: self.downloadURL!)
            task.resume()
        }
        
        DispatchQueue.global().async {
            let task = URLSession.shared.downloadTask(with: self.downloadURL!)
            task.resume()
        }
        
        DispatchQueue.global().async {
            let task = URLSession.shared.downloadTask(with: self.downloadURL!)
            task.resume()
        }
        
        DispatchQueue.global().async {
            let task = URLSession.shared.downloadTask(with: self.downloadURL!)
            task.resume()
        }
        
        DispatchQueue.global().async {
            let task = URLSession.shared.downloadTask(with: self.downloadURL!)
            task.resume()
        }
    }
    
    func authorizationRequest() {
        let url = URL(string: "https://www.baidu.com")
        alamofireManager.request(url!)
    }
    
    func deleteTmpFiles() {
        let tmpPath = NSTemporaryDirectory()
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: tmpPath) {
            return
        }
        guard let subPaths = fileManager.subpaths(atPath: tmpPath) else { return }
        for path in subPaths {
            let singleTmpPath = tmpPath + "/" + path
            if fileManager.fileExists(atPath: singleTmpPath) {
                try! fileManager.removeItem(atPath: singleTmpPath)
            }
        }
    }
}
