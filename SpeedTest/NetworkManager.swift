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
    
    func download() {
        
    }
    
}
