//
//  ContentView.swift
//  Detect Resolution iOS
//
//  Created by 王跃琨 on 2020/10/28.
//

import SwiftUI

struct ContentView: View {
    @State var progress:Double = 0
    var body: some View {
        
        let thisDM = AquireDisplayMetrics()
        
        VStack {
            
            VStack {
                Text("Device Name")
                    .font(.subheadline)
                Text(thisDM.deviceName)
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack {
                Text("Physical Resolution")
                    .font(.subheadline)
                Text(thisDM.resolution)
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack {
                Text("Dimensions in Points")
                    .font(.subheadline)
                Text(thisDM.dimensions)
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack {
                Text("Scaling Factor")
                    .font(.subheadline)
                Text(thisDM.scalingFactor)
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack {
                Text("HDR Playback Capabilities")
                    .font(.subheadline)
                Text(thisDM.hdrCapabilities)
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack {
                Text("Color Gamut")
                    .font(.subheadline)
                Text(thisDM.colorGamut)
                    .font(.title)
            }
            .padding(.bottom)
            
            VStack {
                Text("Maximum Refresh Rate")
                    .font(.subheadline)
                Text(thisDM.refreshRate)
                    .font(.title)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
