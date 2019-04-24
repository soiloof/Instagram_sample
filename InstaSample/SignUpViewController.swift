//
//  SignUpViewController.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/06.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit
import NCMB

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet var useridTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwardTextField: UITextField!
    @IBOutlet var confirmTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        useridTextField.delegate = self
        emailTextField.delegate = self
        passwardTextField.delegate = self
        confirmTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //キーボードとじる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func signUp(){
        
        let user = NCMBUser()
        
        
        //useridの文字数制限
        if (useridTextField.text?.characters.count)! < 4 {
            print("文字数が足りません")
            return
        }
        user.userName = useridTextField.text!
        
     
        user.mailAddress = emailTextField.text!
        
        //パスワードの確認
        if passwardTextField.text == confirmTextField.text {
            user.password = passwardTextField.text!
        }else{
            print("パスワードの不一致")
        }
        
        user.signUpInBackground { (error) in
            if error != nil{
                print("error")
            }else{
                //ログイン成功
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootTabBarController")
                UIApplication.shared.keyWindow?.rootViewController = rootViewController
                
                //ログイン状態の保持
                let ud = UserDefaults.standard
                ud.set(true, forKey: "isLogin")
                ud.synchronize()
                
            }
        
        
        
    }
    

    

}
}
