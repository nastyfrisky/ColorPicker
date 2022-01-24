//
//  ColorViewController.swift
//  ColorPicker
//
//  Created by Анастасия Ступникова on 23.01.2022.
//

import UIKit

protocol PickerViewControllerDelegate {
    func setNewColor(color: UIColor)
}

class ColorViewController: UIViewController {

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let pickerVC = segue.destination as? PickerViewController
        else { return }
        pickerVC.colorView = view.backgroundColor
        pickerVC.delegate = self
    }

}

extension ColorViewController: PickerViewControllerDelegate {
    func setNewColor(color: UIColor) {
        view.backgroundColor = color
    }
    
}
