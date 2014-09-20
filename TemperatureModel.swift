//
//  TemperatureModel.swift
//  BrewT
//
//  Created by David Trautmann on 20.09.14.
//  Copyright (c) 2014 David Trautmann. All rights reserved.
//

import Foundation


class TemperatureModel {
    let cWater: Float = 4.182
    let mWater: Float = 0.999975
    let nullKelvin: Float = 273.15
    
    var tempHot: Float = 0.0
    var tempCold: Float = 0.0
    var tempTarget: Float = 0.0
    var volume: Float = 0.0
    
    var massCold: Float = 0.0
    var massHot: Float = 0.0
    var massTarget: Float = 0.0
    
    // Calculate result temperature
    func calculate() {
        var richmannFactor: Float
        var kelvinCold = tempCold + nullKelvin
        var kelvinHot = tempHot + nullKelvin
        var kelvinTarget = tempTarget + nullKelvin
        
        massTarget = (volume / 1000) * mWater
        richmannFactor = (cWater * (kelvinTarget - kelvinHot)) / (cWater * (kelvinCold - kelvinTarget))
        
        massCold = (massTarget * richmannFactor) / (1 + richmannFactor)
        massHot = massTarget - massCold
}
    
    func getVolumeCold() -> String {
        return String(format: "%.0f", (massCold / mWater) * 1000)
    }
    
    func getVolumeHot() -> String {
        return String(format: "%.0f", (massHot / mWater) * 1000)
    }
}