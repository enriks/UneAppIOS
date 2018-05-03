//
//  QrViewController.swift
//  Prueba-GoogleSignIn
//
//  Created by Manuel Coto on 2/5/18.
//  Copyright © 2018 Manuel Coto. All rights reserved.
//

import UIKit
import AVFoundation

class QrViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    var video = AVCaptureVideoPreviewLayer()
   
    @IBOutlet var qrPreview: UIImageView!
    var qr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // cargar()
        
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != 0{
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr{
                    qr = object.stringValue!
                }
            }
        }
    }

    @IBAction func puesElBoton(_ sender: UIButton) {
        cargar()
    }
    func cargar() {
        //crear la sesion para capturar el video
        let sesion = AVCaptureSession()
        
        //definir la camara
        let camara = AVCaptureDevice.default(for: AVMediaType.video)
        
        do{
            let entrada = try AVCaptureDeviceInput(device: camara!)
            sesion.addInput(entrada)
        }
        catch{
            print("Error de camara")
        }
        
        let salida = AVCaptureMetadataOutput()
        sesion.addOutput(salida)
        salida.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        salida.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        video = AVCaptureVideoPreviewLayer(session: sesion)
        
        //agregar la preview
        video.frame = qrPreview.layer.bounds
        qrPreview.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: qrPreview)
        
        //empieza a correr
        sesion.startRunning()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
