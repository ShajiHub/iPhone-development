//
//  aboutUsPage.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/11/22.
//

import UIKit
import SwiftyGif

class aboutUsPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            
            let gif = try UIImage(gifName: "k1.gif")
            let imageview = UIImageView(gifImage: gif, loopCount: 3) // Will loop 3 times
            imageview.frame = CGRect(x: 10, y: 250, width: 180, height: 180)
            view.addSubview(imageview)
            
            let gif1 = try UIImage(gifName: "k2.gif")
            let imageview1 = UIImageView(gifImage: gif1, loopCount: 3) // Will loop 3 times
            imageview1.frame = CGRect(x: 200, y: 250, width: 180, height: 180)
            view.addSubview(imageview1)
            
            let gif2 = try UIImage(gifName: "k3.gif")
            let imageview2 = UIImageView(gifImage: gif2, loopCount: 3) // Will loop 3 times
            imageview2.frame = CGRect(x: 10, y: 450, width: 180, height: 180)
            view.addSubview(imageview2)
            
            let gif3 = try UIImage(gifName: "k4.gif")
            let imageview3 = UIImageView(gifImage: gif3, loopCount: 3) // Will loop 3 times
            imageview3.frame = CGRect(x: 200, y: 450, width: 180, height: 180)
            view.addSubview(imageview3)
               } catch {
                   print(error)
               }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
