//
//  ViewController.swift
//  EFSignalBariOS
//
//  Created by Erhies Fekarurhobo on 2017-09-13.
//  Copyright © 2017 Ratatat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signalBarView: EFSignalBarView!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBAction func slider(_ sender: UISlider) {
       
        sliderValueLabel.text = String(sender.value)
        signalBarView.signal = EFSignalBarView.SignalStrength(rawValue: convertToSignalStrength(value: sender.value))!
    }
 
  
    

    
    func convertToSignalStrength(value: Float) -> String{
        
        if value > 0.0 && value <= 0.2 {
            return "VeryLow"
        }else if value > 0.2 && value <= 0.4 {
            return "Low"
        }else if value > 0.4 && value <= 0.6 {
            return "Good"
        }else if value > 0.6 && value <= 0.8 {
            return "VeryGood"
        }else if value > 0.8 && value <= 1 {
            return "Excellent"
        }else{
            return "Unknown"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

