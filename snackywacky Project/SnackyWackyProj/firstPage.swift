//
//  firstPage.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/9/22.
//

import UIKit
import SpriteKit
import GameplayKit
import SwiftyGif

class firstPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do {
                   let gif = try UIImage(gifName: "kid2.gif")
                   let imageview = UIImageView(gifImage: gif, loopCount: 3) // Will loop 3 times
                   imageview.frame = CGRect(x: 2, y: 300, width: 400, height: 400)
                   view.addSubview(imageview)
               } catch {
                   print(error)
               }
               
               //move to loginpage
               DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                           self.performSegue(withIdentifier: "splashtologin", sender: nil)    }
    

    

}
}
