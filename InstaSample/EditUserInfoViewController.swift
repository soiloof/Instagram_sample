//
//  EditUserInfoViewController.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/06.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit
import NCMB
import NYXImagesKit

class EditUserInfoViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var introductionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
        userImageView.layer.masksToBounds = true

        userNameTextField.delegate = self
        userIdTextField.delegate = self
        
        
        
        
        
        
        if let user = NCMBUser.current(){
            userNameTextField.text = user.object(forKey: "displayName") as? String
            introductionTextView.text = user.object(forKey: "introduction") as? String
            self.navigationItem.title = user.userName
            
            let file = NCMBFile.file(withName: NCMBUser.current().objectId, data: nil) as! NCMBFile
            file.getDataInBackground { (data, error) in
                if error != nil{
                    print("error")
                }else{
                    let image = UIImage(data: data!)
                    self.userImageView.image = image
                }
            }
            let  userId = NCMBUser.current().userName
            userIdTextField.text = userId!
            
        }else{
            //ログアウト成功
            let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
            let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
            UIApplication.shared.keyWindow?.rootViewController = rootViewController
            
            //ログアウト状態の保持
            let ud = UserDefaults.standard
            ud.set(false, forKey: "isLogin")
            ud.synchronize()
            
            
            
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //リサイズ(NYXImagesKit)
        let resizeImage = selectedImage.scale(byFactor: 0.4)
        
        
        picker.dismiss(animated: true, completion: nil)
        
        let data = UIImagePNGRepresentation(resizeImage!)
        let file = NCMBFile.file(withName: NCMBUser.current().objectId, data: data) as! NCMBFile
        file.saveInBackground({ (error) in
            if error != nil{
                print("error")
            }else{
                self.userImageView.image = selectedImage
            }
            
        }) { (progress) in
            print(progress)
        }
        
    }
    
    
    
    
    
    @IBAction func selectImage(){
        let  actionController = UIAlertController(title: "画像の選択", message: "画像を選択してください。", preferredStyle: .actionSheet)
        
            let cameraAction = UIAlertAction(title: "カメラ", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
                 }else{
                print("この端末ではカメラが起動できません")
            }
          }
        
            let albumAction = UIAlertAction(title: "アルバム", style: .default) { (action) in
                //アルバムから選択
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            
        }else{
            print("この端末ではフォトライブラリーが使えません")
        }
        }
       
       
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            actionController.dismiss(animated: true, completion: nil)
        }
        
        actionController.addAction(cameraAction)
        actionController.addAction(albumAction)
        actionController.addAction(cancelAction)
        self.present(actionController, animated: true, completion: nil)
        
         }
    
    
    
    
    
    @IBAction func closeEditUserInfoViewController(){
        
        self.dismiss(animated: true, completion: nil)
       }
    
    
    @IBAction func saveUserInfo(){
        let user = NCMBUser.current()
        user?.setObject(userNameTextField.text, forKey: "displayName")
        user?.setObject(userIdTextField.text, forKey: "userName")
        user?.setObject(introductionTextView.text, forKey: "introduction")
        user?.saveInBackground({ (error) in
            if error != nil{
                print("error")
            }else{
                
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    
    
    
    
    
    
    
    

}
