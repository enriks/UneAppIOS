//
//  Tools.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 2/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration.CaptiveNetwork

class Tools{
    func getWiFiName() -> Bool? {
        var ssid: Bool? = false
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    if interfaceInfo[kCNNetworkInfoKeySSID as String] as? String == "wifiuneat-publica" || interfaceInfo[kCNNetworkInfoKeySSID as String] as? String == "wifiuneat-alum" || interfaceInfo[kCNNetworkInfoKeySSID as String] as? String == "wuneat-becarios"{
                        ssid = true
                    }
                    break
                }
            }
        }
        return ssid
    }
    
    func mostarQR(ventana:UIViewController){
        var containerQr = QrViewController()
        print("eta aqui lamo")
        containerQr.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 400, height: 375))
        UIView.animate(withDuration: 0.8, animations: {
            ventana.addChildViewController(containerQr)
        })
        
        
        
    }
}
