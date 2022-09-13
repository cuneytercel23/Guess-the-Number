//
//  ThirdVC.swift
//  GuessTheNumber
//
//  Created by Cüneyt Erçel on 26.08.2022.
//

import UIKit

class ThirdVC: UIViewController {
    @IBOutlet weak var wonlossLabel: UILabel!
    @IBOutlet weak var sadhappyImage: UIImageView!
    
    @IBOutlet weak var randomNumLabel: UILabel!
    var result : Bool?
    var rastgeleSayı : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Result Screen"
        // Do any additional setup after loading the view.
        
            
        
        
        if result == true {
            wonlossLabel.text = "WON!"
            sadhappyImage.image = UIImage(named: "mutlu_resim")
            randomNumLabel.isHidden = true
            
        }else {
            wonlossLabel.text = "LOSS"
            sadhappyImage.image = UIImage(named: "uzgun_resim")
            randomNumLabel.isHidden = false
            randomNumLabel.text = "Number was : \(rastgeleSayı)"
        }
    }
    

    
    
    
    @IBAction func startButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    

}
