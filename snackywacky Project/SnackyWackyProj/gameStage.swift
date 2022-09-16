//
//  gameStageViewController.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/10/22.
//

import UIKit
import SpriteKit
import GameplayKit

class gameStage: UIViewController {
    
    let kid: UIImageView = {
           let theImageView = UIImageView()
           theImageView.image = UIImage(named: "spongebob")
           theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        
           return theImageView
        }()
    
    let b1: UIImageView = {
           let theImageView = UIImageView()
           theImageView.image = UIImage(named: "ba1")
           theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        
           return theImageView
        }()
    
    let b2: UIImageView = {
           let theImageView = UIImageView()
           theImageView.image = UIImage(named: "ba2")
           theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        
           return theImageView
        }()
    
    let b3: UIImageView = {
           let theImageView = UIImageView()
           theImageView.image = UIImage(named: "ba3")
           theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        
           return theImageView
        }()
    
      @IBOutlet weak var grass: UIImageView!
      
      @IBOutlet weak var energyBar: UIProgressView!
      
      @IBOutlet weak var energyScore: UILabel!
      @IBOutlet weak var lives: UILabel!
     
      @IBOutlet weak var startBtn: UIButton!
    
    
    @IBOutlet weak var cl: UIImageView!
    
    
   // let kid1 = UIImage(named: "spongebob")
    //let kid = UIImageView(image: kid1!)
   
    
    var energy = 0
    var life = 0
    var fruitFall = 0
    var fruitPos = 0
    var fruitPos1 = 0
    var fruitPos2 = 0
    var fruitSpeed: Float = 0
    var randomSpeed = 0
      
      var touch: UITouch?
     
      
        
      override func viewDidLoad() {
          super.viewDidLoad()
          
          
          kid.layer.zPosition = -1
          b1.layer.zPosition = -1
          b2.layer.zPosition = -1
          b3.layer.zPosition = -1
          grass.layer.zPosition = 1
          
         // view.addSubview(kid)
          // Do any additional setup after loading the view.
          kid.frame = CGRect(x: 137, y: 713, width: 80, height: 80)
          view.addSubview(kid)
          kid.isHidden = true
          
          
          b1.frame = CGRect(x: 41, y: 110, width: 60, height: 80)
          view.addSubview(b1)
          b1.isHidden = true
           
          b2.frame = CGRect(x: 319, y: 92, width: 60, height: 80)
          view.addSubview(b2)
          b2.isHidden = true
          
          b3.frame = CGRect(x: 175, y: 92, width: 60, height: 80)
          view.addSubview(b3)
          b3.isHidden = true
          
          
          
      }
    
    
    override func didMove(toParent parent: UIViewController?) {
        
        
            }
      
      override func viewDidAppear(_ animated: Bool) {
              super.viewDidAppear(animated)
          
          
          
          kid.isHidden = true
          b1.isHidden = true
          b2.isHidden = true
          b3.isHidden = true
          grass.isHidden = true
          energyBar.isHidden = true
          energyScore.isHidden = true
          lives.isHidden = true
          startBtn.isHidden = false
          
          energy = 0
          life = 3
          
          
          energyScore.text = "Energy : \(energy)"
          lives.text = "Lives : \(life)"
          
          
         
  }
      
    
      @IBAction func startGame(_ sender: Any) {
          
          
          
          kid.isHidden = false
          b1.isHidden = false
          b2.isHidden = false
          b3.isHidden = false
          grass.isHidden = false
          energyBar.isHidden = false
          energyScore.isHidden = false
          lives.isHidden = false
          startBtn.isHidden = true
          
          
         // [self, fruitPos] as [Any]
                    
          
      }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        //   let touchCount = touches.count
               let touch = touches.first
        //       let tapCount = touch!.tapCount
           
           let point = touch!.location(in: self.view)
           
           let pointX = point.x
          // let pointY = point.y
           
           kid.center = CGPoint(x:pointX, y: 740)
        fruitPosition()
        
    }
    
    func bFall(){
        
    }
    
    
    
    func fruitPosition(){
        
        //random fruit position
        
        fruitPos = Int(arc4random()) % 200;
        fruitPos1 = Int(arc4random()) % 200;
        fruitPos2 = Int(arc4random()) % 200;
        for i in 1 ... 25{
            fruitFall += 3
       
        
        b1.center = CGPoint(x:fruitPos, y: fruitFall)
        b2.center = CGPoint(x:fruitPos1, y: fruitFall)
        b3.center = CGPoint(x:34, y: fruitFall)
            //     }
        //fruit speed
        randomSpeed = Int(arc4random() % 3)
        switch (randomSpeed){
        case 0:
            fruitSpeed = 0.03
            break
        case 1:
            fruitSpeed = 0.02
            break
        case 2:
            fruitSpeed = 0.01
            break
            
        default:
            break
        }
        
      //  fruitFall = Int(arc4random() % 5)
        
    }
    
 
    
        
     func fruitMovement(){
        
      //  b1.center = CGPoint(x:b1.center.x, y: b1.center.y + 2)
        
        if( b1.frame.intersects(grass.frame)){
            life = life - 1
            lives.text = "Lives : \(life)"
            
          
            
            if ( life > 0){
                fruitPos *= 1
            }
            if ( life == 0 ){
                gameOver()
            }
        }
    }
    
     func kidMovement(){
        
      //  kid.center = CGPoint(x:kid.center.x,y:kid.center.y)
        
        if(kid.frame.intersects(b1.frame)){
            b1.isHidden = true
            energy = energy + 5
            energyScore.text = "Energy : \(energy)"
           
            kid.center = CGPoint(x:grass.center.x, y: grass.center.y)
           
         
        
        }
    }
    
    func gameOver(){
        
        replayGame()
    }
    
    func replayGame(){
        kid.isHidden = true
        b1.isHidden = true
        b2.isHidden = true
        b3.isHidden = true
        grass.isHidden = true
        energyBar.isHidden = true
        energyScore.isHidden = true
        lives.isHidden = true
        startBtn.isHidden = false
        
        energy = 0
        life = 3
        
       
        energyScore.text = "Energy : \(energy)"
        lives.text = "Lives : \(life)"
        
        kid.center = CGPoint(x:137, y:713)
        b1.center = CGPoint(x:41, y:110)
        b2.center = CGPoint(x:319, y:92)
        b3.center = CGPoint(x:175, y:92)
        
        
    }
    
  }
}
