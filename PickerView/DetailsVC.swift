//
//  DetailsVC.swift
//  PickerView
//
//  Created by Alivelu Ravula on 4/12/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

protocol TotransferData {
    
    func sendBackData(image:UIImage , txtFld1:String, txtFld2:String)
}


class DetailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    var myDelegate:TotransferData?=nil
    
    
    @IBOutlet weak var imag: UIImageView!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var firstTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectImageActn(_ sender: Any) {
        
        let imagePC=UIImagePickerController()
        imagePC.delegate=self
        
let actnSht=UIAlertController(title: "Photo Source", message: "Choose A Source", preferredStyle: .actionSheet)
        
       actnSht.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
        if(UIImagePickerController.isSourceTypeAvailable(.camera))
        {
        imagePC.sourceType = .camera
        self.present(imagePC, animated: true, completion: nil)
        }
        else{
            print("Camera is Not Available")
        }
        
        }))
        actnSht.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            
            imagePC.sourceType = .photoLibrary
            self.present(imagePC, animated: true, completion: nil)
            
        }))
        
        
      
        actnSht.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        self.present(actnSht, animated: true, completion: nil)
        
    }
    
    ///////////////////
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        let imageeeee = info[UIImagePickerControllerOriginalImage] as! UIImage
        imag.image = imageeeee
        
        
        
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    ////////////////////
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        if(myDelegate != nil)
        {
            if let requireImg=imag.image
            {
                
          
            myDelegate?.sendBackData(image:requireImg , txtFld1: firstTF.text!, txtFld2: secondTF.text!)
        }
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
