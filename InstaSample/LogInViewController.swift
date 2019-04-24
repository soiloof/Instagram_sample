//
//  LogInViewController.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/06.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit
import NCMB

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var useridTextField: UITextField!
    @IBOutlet var passwardTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        useridTextField.delegate = self
        passwardTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func login(){
        
        if (useridTextField.text?.characters.count)! > 0 &&
           (passwardTextField.text?.characters.count)! > 0{
            
            NCMBUser.logInWithUsername(inBackground: useridTextField.text!, password: passwardTextField.text!)
            {(user, error) in
                if error != nil{
                    print("error")
                }else{
                    //ログアウト成功
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
    
    
    @IBAction func forgetpassward(){
        //置いとく
        
    }
    
    
}
