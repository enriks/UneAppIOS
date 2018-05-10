//
//  ViewTabBarController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 8/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit

class ViewTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
print("enserio hace esto")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
