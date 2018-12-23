//
//  ViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 6/28/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit
import SwiftOCR
import AVFoundation







class ViewController: UIViewController, AVCaptureAudioDataOutputSampleBufferDelegate {

    let textAnalyzeInstance = Analyze()         //create instance of Analyze Class
    let output = AVCaptureVideoDataOutput()
    let sampleBufferQueue = DispatchQueue.global(qos: .userInteractive)
    var text = ""
    
    
    //camera variables
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    var photoOutput: AVCapturePhotoOutput?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    
    let myImage = UIImage(named: "code")        //use for testing purposes
    
    
    //outlets
    @IBOutlet weak var analyzeButton: Button!
    @IBOutlet weak var screenshotBox: View!     //used to define where to capture the screen
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        frame = CaptureManager()
//        frame.delegate = self
        
        
        
        
        
        
        
        //showing the camera
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        
        
        
        
        
        
    }//end of view did load
    
   
    
    func setupCaptureSession() {
    
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    
    func setupDevice() {
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if (device.position == AVCaptureDevice.Position.back) {
                backCamera = device
        }
            else if (device.position == AVCaptureDevice.Position.front) {
                frontCamera = device
        }
        
    }
        
        currentCamera = backCamera
        
        
    }//end of setupdevice function
    
    
    func setupInputOutput() {
        
        do {
            
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format:[AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
            
            
        } catch {
            
            print(error)
        }
        
        
        
        
    }
    
    

    func setupPreviewLayer() {
        
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
        
    }
    
    
    
    func startRunningCaptureSession() {
        
        captureSession.startRunning()
        
    }
    
    
    
    @IBAction func analyzeButtonPressed(_ sender: Any) {        //capture button
        
        let settings = AVCapturePhotoSettings()                     //captures the photo
        photoOutput?.capturePhoto(with: settings, delegate: self)   //pass self to conform to protocol
        
        
        
        
        //use this block to analyze for text
        

        
    
//        if croppedImage != nil {
//            text = textAnalyzeInstance.recognizeText(image: croppedImage!)
//            print(text)
//        }
        
        
        
    }//end of analyzePressed
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPicture" {
            let imageVC = segue.destination as! ImageViewController
            imageVC.image = self.image
        }
    }
    
    
    
    
    
    
    
    
}//end of class



extension ViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            
            image = UIImage(data: imageData)
            performSegue(withIdentifier: "showPicture", sender: nil)
            
            
        }
    }
    
}


extension UIImage {
    func croppedInRect(rect: CGRect) -> UIImage {
        func rad(_ degree: Double) -> CGFloat {
            return CGFloat(degree / 180.0 * .pi)
        }
        
        var rectTransform: CGAffineTransform
        switch imageOrientation {
        case .left:
            rectTransform = CGAffineTransform(rotationAngle: rad(90)).translatedBy(x: 0, y: -self.size.height)
        case .right:
            rectTransform = CGAffineTransform(rotationAngle: rad(-90)).translatedBy(x: -self.size.width, y: 0)
        case .down:
            rectTransform = CGAffineTransform(rotationAngle: rad(-180)).translatedBy(x: -self.size.width, y: -self.size.height)
        default:
            rectTransform = .identity
        }
        rectTransform = rectTransform.scaledBy(x: self.scale, y: self.scale)
        
        let imageRef = self.cgImage!.cropping(to: rect.applying(rectTransform))
        let result = UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
        return result
    }
}
