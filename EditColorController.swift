//
//  EditColorController.swift
//  MatColor
//
//  Created by Alexey Papin on 03.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import UIKit

class EditColorController: UIViewController {
    var tone: Tone!
    var completionOnSave: ((Tone) -> Void)?
    var completionOnCancel: ((Tone) -> Void)?
    
    var currentColor: UIColor = .clear {
        didSet {
            let components = currentColor.components
            self.redLabel.text = "red (\(Int(components.red * 255.0))):"
            self.greenLabel.text = "green (\(Int(components.green * 255.0))):"
            self.blueLabel.text = "blue (\(Int(components.blue * 255.0))):"
            self.alphaLabel.text = "alpha (\(String(format: "%.2f", components.alpha))):"
            self.colorView.backgroundColor = self.currentColor
            tone.color = currentColor
            titleLabel.text = "\(tone.name) Hex: \(tone.hexValue)"
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColor = tone.color
    
        let components = tone.color.components
        redSlider.value = Float(components.red)
        greenSlider.value = Float(components.green)
        blueSlider.value = Float(components.blue)
        alphaSlider.value = Float(components.alpha)
        
        redSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        alphaSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}

extension EditColorController {
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        completionOnSave?(tone)
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        completionOnCancel?(tone)
        self.dismiss(animated: true)
    }
    
    // Tag values of sliders setted in Main.storyboard, red = 0, green = 1, blue = 2. alpha = 3
    func sliderValueChanged(_ sender: UISlider) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        currentColor = newColor
    }
    
    func dismiss(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }
}
