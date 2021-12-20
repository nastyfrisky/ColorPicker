//
//  ViewController.swift
//  ColorPicker
//
//  Created by Анастасия Ступникова on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var selectedColorView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    private var redValue: CGFloat = 0.5
    private var greenValue: CGFloat = 0.5
    private var blueValue: CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedColorView.backgroundColor = UIColor(
            displayP3Red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: 1
        )
        
    }
    
    @IBAction func redComponentSlider(_ sender: UISlider) {
        redColorLabel.text = String(format: "%.2f", sender.value)
        redValue = CGFloat(sender.value)
        setViewColor()
    }
    
    @IBAction func greenComponentSlider(_ sender: UISlider) {
        greenColorLabel.text = String(format: "%.2f", sender.value)
        greenValue = CGFloat(sender.value)
        setViewColor()
    }
    
    @IBAction func blueComponentSlider(_ sender: UISlider) {
        blueColorLabel.text = String(format: "%.2f", sender.value)
        blueValue = CGFloat(sender.value)
        setViewColor()
    }
   
    
    private func setViewColor() {
        selectedColorView.backgroundColor = UIColor(
            displayP3Red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: 1
        )
    }

}


