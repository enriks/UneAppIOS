//
//  Tools.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 2/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

class Tools{
    func getWiFiName() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid
    }
    
}
