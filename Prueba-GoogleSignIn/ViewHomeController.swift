//
//  ViewController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 17/4/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SystemConfiguration.CaptiveNetwork

class ViewHomeController: UIViewController , GIDSignInUIDelegate{

    @IBOutlet weak var imagenUneat: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //DatabaseController().prueba()
        let signInButton = GIDSignIn()
        //signInButton.frame = CGRect(x: 16, y: 116 + 66, width: view.frame.width - 32, height: 50)
        //view.addSubview(signInButton)
        UIView.animate(withDuration: 1, animations: {
            self.imagenUneat.isHidden = false
        })
        
        GIDSignIn.sharedInstance().uiDelegate = self
        //signInButton.clientID = AppDelegate.Usuario.clientId
        //signInButton.signIn()
        GIDSignIn.sharedInstance().signIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

