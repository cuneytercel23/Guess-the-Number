//
//  SecondVC.swift
//  GuessTheNumber
//
//  Created by Cüneyt Erçel on 26.08.2022.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var updownText: UILabel!
    @IBOutlet weak var remainingText: UILabel!
    
    var randomNumber : Int?
    var remainingHak = 5
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        randomNumber = Int(arc4random_uniform(100)) // 0-100 arası sayı
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
             
            let thirdvcDestination = segue.destination as! ThirdVC
            
            thirdvcDestination.result = gelenVeri // gelen veriyi sendera eşitledim. sender da bilirse true, hak biterse false göndericek.
            thirdvcDestination.rastgeleSayı = randomNumber!
        }
    }
    
    
    
    @IBAction func guessButtonClicked(_ sender: UIButton) {
        updownText.isHidden = false
        remainingHak -= 1
        print(randomNumber)
        
        if let guess = Int(textField.text!) {
            
            if remainingHak != 0 {
                
                if guess == randomNumber {
                    let result = true
                    performSegue(withIdentifier: "toThirdVC", sender: result)
                    
                }
                if guess > randomNumber!{
                    updownText.text = "GO DOWN ! "
                    remainingText.text = "Remaining: \(remainingHak)"
                    
                }
                if guess < randomNumber! {
                    updownText.text = "GO UP!"
                    remainingText.text = "Remaining: \(remainingHak)"
                    
                }
                
                
            
            }else { // kalan hak biterse
                let result = false
                performSegue(withIdentifier: "toThirdVC", sender: result)
                
                
            }
            textField.text = "" // olay bitince text field alanını sıfırlamak için.
            
        }
    }
    
    
    

}
