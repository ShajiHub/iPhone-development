//
//  playGame.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/9/22.
//

import UIKit
import SpriteKit

class playGame: UIViewController {

   
    @IBOutlet weak var sceneView: SKView!
    
    var scene:kidRunScene?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0){
                    self.performSegue(withIdentifier: "taptogame", sender: nil)    }

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            self.scene = kidRunScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
            
            self.sceneView.presentScene(scene)
        }

    @IBAction func playGame(_ sender: Any) {
        if let scene = self.scene {
            
            scene.showKidRun()
            scene.showKidOppRun()
            
            
        }
        
    }
    
}
