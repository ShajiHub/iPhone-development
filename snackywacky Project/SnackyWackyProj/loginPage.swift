//
//  ViewController.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/6/22.
//

import UIKit
import FirebaseAuth


class loginPage: UIViewController {
    
    @IBOutlet weak var loginTitle: UILabel!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var pTip: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logoutButton.isHidden = true
        
    }


    @IBAction func login(_ sender: Any) {
        
        print("login button pressed")
        
        let uemail = userEmail.text!
        let upass = userPassword.text!
        
        if( uemail.isEmpty || upass.isEmpty){
        showAlert()
            print("Please fill the fields!!!")
            return
        }
        else{
            
            
            
            FirebaseAuth.Auth.auth().signIn(withEmail: uemail, password: upass, completion:{[weak self] res, err in
            guard let strongSelf = self else{
                return
            }
            
            guard err == nil else{
                strongSelf.createAccount(uemail: uemail, upass: upass)
                return
            }
            print("You have signed in")
            strongSelf.performSegue(withIdentifier: "logintogame", sender: nil)
            strongSelf.loginTitle.isHidden = true
            strongSelf.userEmail.isHidden = true
            strongSelf.userPassword.isHidden = true
            strongSelf.pTip.isHidden = true
            strongSelf.loginButton.isHidden = true
            strongSelf.logoutButton.isHidden = false
        })
            
            
            
        
        }
        
    }
    
    
    func showAlert(){
        let alertMsg = UIAlertController(title: "Alert", message: "Please enter valid input", preferredStyle:.alert)
        alertMsg.addAction(UIAlertAction(title: "Dismiss", style:.cancel, handler:.none))
        present(alertMsg, animated: true)
    }
    
    
    func createAccount(uemail: String, upass: String){
        
        let accAlert = UIAlertController(title: "Create Account",
                                         message: "Like to create new account?",
                                         preferredStyle: .alert)
        
        accAlert.addAction(UIAlertAction(title: "Continue",
                                         style: .default,
                                         handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: uemail, password: upass, completion: {[weak self]result, err in
                guard let strongSelf = self else{
                    return
                }
                guard err == nil else{
                    print("Account creation failed")
                    return
                }
                print("You have signed in")
                
                strongSelf.loginTitle.isHidden = true
                strongSelf.userEmail.isHidden = true
                strongSelf.userPassword.isHidden = true
                strongSelf.pTip.isHidden = true
                strongSelf.loginButton.isHidden = true
                strongSelf.logoutButton.isHidden = false
                
            })
            
        }))
        accAlert.addAction(UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: {_ in
            
        }))
        
        present(accAlert, animated: true)
        
        }
   
    
    @IBAction func logout(_ sender: Any) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
              self.loginTitle.isHidden = false
              self.userEmail.isHidden = false
              self.userPassword.isHidden = false
              self.pTip.isHidden = false
              self.loginButton.isHidden = false
              self.logoutButton.isHidden = true
            self.userEmail.text = ""
            self.userPassword.text = ""
            }
             catch{
               print("An error occured")
            }
        
       }
}

