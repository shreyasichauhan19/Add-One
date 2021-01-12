//
//  MainViewController.swift
//  Add1
//
//  Created by Shreyasi Chauhan on 2019-08-13.
//  Copyright © 2019 Shreyasi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    
    @IBOutlet weak var numbersLabel:UILabel?
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    
    var score:Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setRandomNumberLabel()
        updateScoreLabel()
        
        inputField?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for:UIControl.Event.editingChanged)
    }
    
    func updateScoreLabel()
    {
        scoreLabel?.text = "\(score)"
    }
    
    func setRandomNumberLabel()
    {
        numbersLabel?.text = generateRandomNumber()
    }
    
    

    @objc func textFieldDidChange(textField:UITextField)
    {
        if inputField?.text?.count ?? 0 < 4
        {
            return
        }
        
        if  let numbers_text    = numbersLabel?.text,
            let input_text      = inputField?.text,
            let numbers = Int(numbers_text),
            let input   = Int(input_text)
        {
            print("Comparing: \(input_text) minus \(numbers_text) == \(input - numbers)")
            //int a = numbers/1000;
            //int b = numbers/100;
            //int c = numbers/10;
            //int d = numbers
            if(input - numbers == 1111)
            {
                print("Correct!")
                
                score += 1
            }
            else
            {
                print("Incorrect!")
                
                score -= 1
            }
        }
        
        setRandomNumberLabel()
        updateScoreLabel()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func generateRandomNumber() -> String
    {
        var result:String = ""
        
        for _ in 1...4
        {
            let digit = Int.random(in: 1..<9)
            
            result += "\(digit)"
        }
        
        return result
    }

}
