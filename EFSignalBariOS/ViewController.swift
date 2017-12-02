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
 
  
    

    
    func convertToSignalStrength(value: Float) -> Int{
        
        if value > 0.0 && value <= 0.3 {
            return 1
        }else if value > 0.3 && value <= 0.5 {
            return 2
        }else if value > 0.5 && value <= 0.7 {
            return 3
        }else if value > 0.7 && value <= 1 {
            return 4
        }else{
            return 0
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

