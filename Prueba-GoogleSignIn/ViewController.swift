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

class ViewController: UIViewController , GIDSignInUIDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let signInButton = GIDSignInButton()
        signInButton.frame = CGRect(x: 16, y: 116 + 66, width: view.frame.width - 32, height: 50)
        view.addSubview(signInButton)
        let salirButton = UIButton(type: .system)
        salirButton.frame = CGRect(x: 16, y: 116 + 66 + 66, width: view.frame.width - 32, height: 50)
        salirButton.backgroundColor = .black
        salirButton.setTitle("Esto lol ", for: .normal)
        salirButton.setTitleColor(.white, for: .normal)
        view.addSubview(salirButton)
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

