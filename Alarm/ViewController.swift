//
//  ViewController.swift
//  Alarm
//
//  Created by Kate on 09/08/2023.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var alarmLbl: UILabel!
    @IBOutlet weak var viewFirst: UIView!
    @IBOutlet var volumeLbl: UILabel!
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var txtFld: UITextField!
    @IBOutlet weak var viewSecond: UIView!
    @IBOutlet var datePick: UIDatePicker!
    @IBOutlet weak var setThisTimeBtn: UIButton!
    @IBOutlet var viewThird: UIView!
    @IBOutlet var selectedTimeLbl: UILabel!
    @IBOutlet var switchForTime: UISwitch!
    @IBOutlet var clearBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* При перетягивании слайдера меняется значение у Progress View и TextField
     При внесении изменений в TextField с помощью клавиатуры - меняем значения у Progress View и Slider: */
//
    @IBAction func volumeSliderChange(_ sender: UISlider) {
        print(sender.value)
        let value = sender.value
        let roundedValue = round(value * 10) / 10
        progress.progress = roundedValue
        txtFld.text = String(roundedValue)
    }
    
    @IBAction func TxtFldValueChanges(_ sender: UITextField) {
        print(sender.text) //не разобралась с этой ошибкой :(
        if let text = sender.text, let value = Float(text) {
//            let roundedValue = round(value * 10) / 10
            progress.progress = value
            slider.value = value
        }
    }
 
    /*  Switch отвечает за включение будильника. Ври включении и выключении Switch менять цветовую гамму у  Label (11:14). При нажатии Button (Clear) очищать Label (“”) и выключать Switch*/
    
    @IBAction func switcher(_ sender: UISwitch) {
        if switchForTime.isOn {
            selectedTimeLbl.backgroundColor = .systemGreen
        } else {
            selectedTimeLbl.backgroundColor = .gray
        }
    }
    
    @IBAction func btnClearPressed(_ sender: UIButton) {
        switchForTime.isOn = false
        selectedTimeLbl.text = "--:--"
        selectedTimeLbl.backgroundColor = .systemBackground
    }
    
    /* - Date Picker (Выставить в настойках наш формат, и только часы и минуты). По нажатии на кнопку (Set this time) установить выбранное время в  Label  (11:14) (следующий блок) из Date Picker*/
    
    @IBAction func setThisTime(_ sender: UIButton) {
        let selectedTime = datePick.date
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let dateString = format.string(from: selectedTime)
        selectedTimeLbl.text = dateString
    }
}
