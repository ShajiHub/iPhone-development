//
//  contactPage.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/11/22.
//

import UIKit
import MessageUI

class contactPage: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userMsg: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    var phoneNumber = "6472222222"
    @IBAction func call(_ sender: Any) {
        if let phoneURL = URL(string:"tel://\(phoneNumber)"){
            let app:UIApplication = UIApplication.shared
            if app.canOpenURL(phoneURL){
                app.open(phoneURL)
            }
            
        }
    }
    
    @IBAction func send(_ sender: Any) {
        var uName = userName.text
        var uEmail = userEmail.text
        var uMessage = userMsg.text
        
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["letzzzlearn@gmail.com"])
            mail.setMessageBody("<p>\(uMessage)</p>", isHTML: true)
        } else {
            print ("Sending email is not available on simulator")
        }
    }
    
    
    @IBAction func aboutUs(_ sender: Any) {
        performSegue(withIdentifier: "contacttoabout", sender: nil)

    }
}
