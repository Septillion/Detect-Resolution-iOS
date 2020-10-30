//
//  DisplayMetrics.swift
//  Detect Resolution iOS
//
//  Created by 王跃琨 on 2020/10/28.
//

import Foundation
import UIKit
import AVFoundation

struct DisplayMetrics{
    var deviceName = "Unknown"
    var resolution = "Unknown"
    var dimensions = "Unknown"
    var scalingFactor = "Unknown"
    var hdrCapabilities = ""
    var colorGamut = "Unknown"
    var refreshRate = "Unknown"
}

func AquireDisplayMetrics() -> DisplayMetrics {
    var dm = DisplayMetrics()
    
    dm.deviceName = UIKit.UIDevice().name
    
    dm.resolution = "\(Int(UIScreen.main.nativeBounds.width)) ✕ \(Int(UIScreen.main.nativeBounds.height))"
    
    dm.dimensions = "\(Int(UIScreen.main.bounds.width)) ✕ \(Int(UIScreen.main.bounds.height))"
    
    dm.scalingFactor = "\(Int(UIScreen.main.scale))x"
    if (UIScreen.main.scale != UIScreen.main.nativeScale){
        dm.scalingFactor+=" (Actual: \(UIScreen.main.nativeScale)x)"
    }
    
    var isHLG : Bool = false
    var isHDR10  : Bool = false
    var isDolbyVision : Bool = false
    for i in [0,AVPlayer.HDRMode.hlg.rawValue] {
        for j in [0,AVPlayer.HDRMode.hdr10.rawValue]{
            for k in [0,AVPlayer.HDRMode.dolbyVision.rawValue]{
                if ((i+j+k) == AVPlayer.availableHDRModes.rawValue){
                    isHLG = i==AVPlayer.HDRMode.hlg.rawValue
                    isHDR10 = j==AVPlayer.HDRMode.hdr10.rawValue
                    isDolbyVision = k==AVPlayer.HDRMode.dolbyVision.rawValue
                    break
                }
            }
        }
    }
    if isHLG{
        if dm.hdrCapabilities != ""{
            dm.hdrCapabilities += ", "
        }
        dm.hdrCapabilities += "HLG"
    }
    if isHDR10{
        if dm.hdrCapabilities != ""{
            dm.hdrCapabilities += ", "
        }
        dm.hdrCapabilities += "HDR10"
    }
    if isDolbyVision{
        if dm.hdrCapabilities != ""{
            dm.hdrCapabilities += ", "
        }
        dm.hdrCapabilities += "DolbyVision"
    }
    
    if (!AVPlayer.eligibleForHDRPlayback){
        dm.hdrCapabilities = "Unsupported"
    }
    
    
    switch UIScreen.main.traitCollection.displayGamut {
    case UIDisplayGamut.P3:
        dm.colorGamut = "P3"
    case UIDisplayGamut.SRGB:
        dm.colorGamut = "sRGB"
    case UIDisplayGamut.unspecified:
        dm.colorGamut = "unspecified"
    default:
        break
    }
    
    dm.refreshRate = String(UIScreen.main.maximumFramesPerSecond)
    
    return dm
}
