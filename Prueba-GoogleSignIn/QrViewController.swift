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
        cargar()
        
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0{
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr{
                    qr = object.stringValue!
                    print(object.stringValue!)
                    if Tools().getWiFiName() == true{
                        httpRequest()
                    }
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
    
    func httpRequest(){
        if Tools().getWiFiName()!{
            var parametrosArr = qr.characters.split{$0 == "_"}.map(String.init)
            let json: [String:Any] = ["idPersona":AppDelegate.Usuario.usuario,"idEvento": parametrosArr[0],"fecha": parametrosArr[1],"valido": true,"validado": 1,"tipoRegistro":"Alumno","esPar":true]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
<<<<<<< HEAD
            let url = URL(string: "https://uneasistencias.uneatlantico.es/registrar")!
=======
            let url = URL(string: "htpps://uneasistencias.uneatlantico.es/registrar")!
>>>>>>> 1cf260ffdcf8bf3e86f1ba604ecf0030dfc54d7e
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.timeoutInterval = 15000
            
            let task = URLSession.shared.dataTask(with: request){
                data, response, error in
                guard let data = data, error == nil else{
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any]{
                    print(responseJSON)
                }
                if responseJSON != nil {
                    DatabaseController().ingresoRegistro(idEvento: Int(parametrosArr[0])!, fecha: parametrosArr[1], enviado: 1, estado: 1)
                    if AppDelegate.Usuario.estado == true{
                        //responseJSON.horasAlumnos[0].horas
                        //response.JSON.horasTotales[0].horas
                    }
                }
                
            }
            task.resume()
        }
        else{
            //hacer una ventana para mostrar esto
            print("conectate a una red universitaria para enviar qr")
        }
        
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
