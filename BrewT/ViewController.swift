//
//  ViewController.swift
//  BrewT
//
//  Created by David Trautmann on 20.09.14.
//  Copyright (c) 2014 David Trautmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var volumeSlider : UISlider!
    @IBOutlet var volumeLabel : UILabel!
    @IBOutlet var coldSlider : UISlider!
    @IBOutlet var coldLabel : UILabel!
    @IBOutlet var hotSlider : UISlider!
    @IBOutlet var hotLabel : UILabel!
    @IBOutlet var targetSlider : UISlider!
    @IBOutlet var targetLabel : UILabel!
    @IBOutlet var resultsLabelCold : UILabel!
    @IBOutlet var resultsLabelHot : UILabel!
    
    let model = TemperatureModel()
    let volumeUnit  = "ml"
    let tempUnit = "° C"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        // Set parameter
        model.volume = volumeSlider.value
        model.tempCold = coldSlider.value
        model.tempHot = hotSlider.value
        model.tempTarget = targetSlider.value
        
        // Salculate masses
        model.calculate()
        
        // Print in results view
        resultsLabelCold.text = "Cold: \(model.getVolumeCold()) ml"
        resultsLabelHot.text = "Hot: \(model.getVolumeHot()) ml"
    }
    
    @IBAction func volumeSliderChanged() {
        var value = String(format:"%.0f", volumeSlider.value)
        volumeLabel.text = "\(value) \(volumeUnit)"
        refreshUI()
    }
    
    @IBAction func coldSliderChanged() {
        var value = String(format:"%.0f", coldSlider.value)
        coldLabel.text = "\(value) \(tempUnit)"
        refreshUI()
    }
    
    @IBAction func hotSliderChanged() {
        var value = String(format:"%.0f", hotSlider.value)
        hotLabel.text = "\(value) \(tempUnit)"
        refreshUI()
    }
    
    @IBAction func targetSliderChanged() {
        var value = String(format:"%.0f", targetSlider.value)
        targetLabel.text = "\(value) \(tempUnit)"
        refreshUI()
    }
}

