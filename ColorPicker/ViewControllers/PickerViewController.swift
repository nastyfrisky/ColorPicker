//
//  ViewController.swift
//  ColorPicker
//
//  Created by Анастасия Ступникова on 19.12.2021.
//

import UIKit

class PickerViewController: UIViewController {
    
    // MARK: - IB Outlets

    @IBOutlet var selectedColorView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    
    var colorView: UIColor!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colors = CIColor(color: colorView)
        
        redTextField.text = colors.red.description
        greenTextField.text = colors.green.description
        blueTextField.text = colors.blue.description
        
        setupTextFields()
        textFieldDidEndEditing(redTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
    
    // MARK: - IB Actions
    
    @IBAction func rgbComponentsSlider() {
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        setViewColor()
    }
    
    // MARK: - Private methods
    
    private func setViewColor() {
        selectedColorView.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func setupTextFields() {
        let bar = UIToolbar()
        let leftSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(toolbarDoneTapped)
        )
        bar.items = [leftSpace, doneButton]
        bar.sizeToFit()
        
        redTextField.inputAccessoryView = bar
        greenTextField.inputAccessoryView = bar
        blueTextField.inputAccessoryView = bar
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    @objc private func toolbarDoneTapped() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate

extension PickerViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard validateInput() else { return }
        
        redColorLabel.text = redTextField.text
        greenColorLabel.text = greenTextField.text
        blueColorLabel.text = blueTextField.text
        
        redSlider.value = Float(redTextField.text ?? "1.00") ?? 1.00
        greenSlider.value = Float(greenTextField.text ?? "1.00") ?? 1.00
        blueSlider.value = Float(blueTextField.text ?? "1.00") ?? 1.00
        
        setViewColor()
    }
    
    func validateInput() -> Bool {
        let redTextField = Float(redTextField.text ?? "")
        let greenTextField = Float(greenTextField.text ?? "")
        let blueTextField = Float(blueTextField.text ?? "")

        guard
            let redTextField = redTextField,
            redTextField >= 0,
            redTextField <= 1
        else {
            displayAnAlert()
            return false
        }
        
        guard
            let greenTextField = greenTextField,
            greenTextField >= 0,
            greenTextField <= 1
        else {
            displayAnAlert()
            return false
        }
        
        guard
            let blueTextField = blueTextField,
            blueTextField >= 0,
            blueTextField <= 1
        else {
            displayAnAlert()
            return false
        }
        
        return true
    }
    
    func displayAnAlert() {
        let alertController = UIAlertController(
            title: "Error!",
            message: "Enter a number from 0 to 1",
            preferredStyle: .alert
        )
               let action = UIAlertAction(title: "OK", style: .default)
               alertController.addAction(action)
               present(alertController, animated: true)
    }
}

