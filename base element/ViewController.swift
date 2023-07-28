//
//  ViewController.swift
//  base element
//
//  Created by Павел Платов on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchForm: UISwitch!
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // MARK: Label
        mainLabel.text = "Выбран 1 сегмент с индексом 0"
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        secondLabel.text = "Выбери сегмент"
        thirdLabel.text = "Выключить"
        // MARK: Slider
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .cyan
        slider.thumbTintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        //MARK: Text Field
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad
        
        //MARK: Button
        mainButton.layer.cornerRadius = 10
        mainButton.setTitle("Отправить", for: .normal)
        
        //MARK: datePicker
     
    }

    @IBAction func segmentedControlAction(_ sender: Any) {
        secondLabel.isHidden = true
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Выбран 1 сегмент с индексом 0"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "Выбран 2 сегмент с индексом 1"
            mainLabel.textColor = .black
        case 2:
            mainLabel.text = "Выбран 3 сегмент с индексом 2"
            mainLabel.textColor = .blue
        default:break
       
           
        }
    }
    @IBAction func sliderAction(_ sender: Any) {
        mainLabel.text = String(Int(slider.value))
    }
    
    @IBAction func mainButtonAction(_ sender: Any) {
        let text = textField.text
        guard let text = textField.text, !text.isEmpty else { return }
                mainLabel.text = text
        
    }
    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    @IBAction func toggleElements(_ sender: Any) {
        if switchForm.isOn { thirdLabel.text = "Выключить"
        } else {
            thirdLabel.text = "Включить"
        }
        segmentedControl.isHidden = !switchForm.isOn
        mainLabel.isHidden = !switchForm.isOn
        secondLabel.isHidden = !switchForm.isOn
        slider.isHidden = !switchForm.isOn
        textField.isHidden = !switchForm.isOn
        mainButton.isHidden = !switchForm.isOn
        datePicker.isHidden = !switchForm.isOn
        
    }
}

