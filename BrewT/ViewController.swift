//
//  ViewController.swift
//  BrewT
//
//  Created by David Trautmann on 20.09.14.
//  Copyright (c) 2014 David Trautmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var volumeSlider      : UISlider!
    @IBOutlet var volumeField       : UITextField!
    @IBOutlet var coldSlider        : UISlider!
    @IBOutlet var coldField         : UITextField!
    @IBOutlet var hotSlider         : UISlider!
    @IBOutlet var hotField          : UITextField!
    @IBOutlet var teaSlider         : UISlider!
    @IBOutlet var teaField          : UITextField!
    @IBOutlet var resultsLabelCold  : UILabel!
    @IBOutlet var resultsLabelHot   : UILabel!
    
    let model = TemperatureModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        self.view.endEditing(true)
    }
    
    func initUI() {
        // init slider labels
        volumeSliderChanged()
        coldSliderChanged()
        hotSliderChanged()
        teaSliderChanged()
        
        refreshUI()
    }
    
    func refreshUI() {
        // Set parameter
        model.volume = volumeSlider.value
        model.tempCold = coldSlider.value
        model.tempHot = hotSlider.value
        model.tempTea = teaSlider.value
        
        // Salculate masses
        model.calculate()
        
        // Print in results view
        resultsLabelCold.text = "Cold: \(model.getVolumeCold()) ml"
        resultsLabelHot.text = "Hot: \(model.getVolumeHot()) ml"
    }
    
    @IBAction func volumeModifed() {
        volumeSlider.value = (volumeField.text as NSString).floatValue
        volumeSliderChanged()
    }
    
    @IBAction func volumeSliderChanged() {
        volumeField.text = String(format:"%.0f", volumeSlider.value)
        refreshUI()
    }
    
    @IBAction func coldModifed() {
        coldSlider.value = round((coldField.text as NSString).floatValue)
        coldSliderChanged()
    }
    
    @IBAction func coldSliderChanged() {
        if (coldSlider.value >= hotSlider.value) {
            coldSlider.value = hotSlider.value
        }
        if (coldSlider.value >= teaSlider.value) {
            coldSlider.value = teaSlider.value
        }
        coldSlider.value = round(coldSlider.value)
        coldField.text = String(format:"%.0f", coldSlider.value)
        refreshUI()
    }
    
    @IBAction func hotModifed() {
        hotSlider.value = (hotField.text as NSString).floatValue
        hotSliderChanged()
    }
    
    @IBAction func hotSliderChanged() {
        if (hotSlider.value <= teaSlider.value) {
            hotSlider.value = teaSlider.value
        }
        hotSlider.value = round(hotSlider.value)
        hotField.text = String(format:"%.0f", hotSlider.value)
        refreshUI()
    }
    
    @IBAction func teaModifed() {
        teaSlider.value = round((teaField.text as NSString).floatValue)
        teaSliderChanged()
    }
    
    @IBAction func teaSliderChanged() {
        teaField.text = String(format:"%.0f", teaSlider.value)
        refreshUI()
    }
}

