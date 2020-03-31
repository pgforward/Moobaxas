//
//  ContentView.swift
//  Moobaxas
//
//  Created by Peter Forward on 3/18/20.
//  Copyright © 2020 Peter Forward. All rights reserved.
//

import SwiftUI
import AVFoundation

// Using Buffer
var audioEngine: AVAudioEngine = AVAudioEngine()
var audioFilePlayer: AVAudioPlayerNode = AVAudioPlayerNode()

let speedControl = AVAudioUnitVarispeed()
let pitchControl = AVAudioUnitTimePitch()
let reverb = AVAudioUnitReverb()
let distortion = AVAudioUnitDistortion()

struct ContentView: View {
    
    @State var isPresentingModal: Bool = false
    
    @State private var activeButton = 0
    @State private var speedValue: Float = 1.0
    @State private var speedDefault: Float = 1.0
    @State private var speedLabel = ""
    @State private var pitchValue: Float = 100.0
    @State private var pitchDefault: Float = 100.0
    @State private var pitchLabel = ""
    @State private var reverbValue: Int = 0
    @State private var reverbLabel: String = ""
    @State private var reverbDefault: Int = 0
    
    @State private var distortionValue: Int = 0
    @State private var distortionLabel: String = ""
    
    var body: some View {
        NavigationView {
            List {
                
                HStack (spacing: 15) {
                    Button(action: {self.playBuffer(buttonNo: 1)}) {
                        if activeButton == 1 {
                            Text("❶").font(.largeTitle)
                        } else {
                            Text("1")
                        }
                    }
                    .foregroundColor(.purple)
                    
                    Button(action: {self.playBuffer(buttonNo: 2)}) {
                        if activeButton == 2 {
                            Text("❷").font(.largeTitle)
                        } else {
                            Text("2")
                        }
                    }
                    .foregroundColor(.purple)
                    Button(action: {self.playBuffer(buttonNo: 3)}) {
                        if activeButton == 3 {
                            Text("❸").font(.largeTitle)
                        } else {
                            Text("3")
                        }
                    }
                    .foregroundColor(.purple)
                    Button(action: {self.playBuffer(buttonNo: 4)}) {
                        if activeButton == 4 {
                            Text("❹").font(.largeTitle)
                        } else {
                            Text("4")
                        }
                    }
                    .foregroundColor(.purple)
                }.buttonStyle(CircleStyle())
                
                HStack (spacing: 15) {
                    Button(action: {self.playBuffer(buttonNo: 5)}) {
                        if activeButton == 5 {
                            Text("❺").font(.largeTitle)
                        } else {
                            Text("5")
                        }
                    }
                    .foregroundColor(.purple)
                    Button(action: {self.playBuffer(buttonNo: 6)}) {
                        if activeButton == 6 {
                            Text("❻").font(.largeTitle)
                        } else {
                            Text("6")
                        }
                    }
                    .foregroundColor(.purple)
                    Button(action: {self.playBuffer(buttonNo: 7)}) {
                        if activeButton == 7 {
                            Text("❼").font(.largeTitle)
                        } else {
                            Text("7")
                        }
                    }
                    .foregroundColor(.purple)
                    Button(action: {self.playBuffer(buttonNo: 8)}) {
                        if activeButton == 8 {
                            Text("❽").font(.largeTitle)
                        } else {
                            Text("8")
                        }
                    }
                    .foregroundColor(.purple)
                }.buttonStyle(CircleStyle())
                
                HStack (spacing: 15) {
                    Button(action: {self.speedDown()}) { Text("➖") }
                        .foregroundColor(.yellow)
                    Button(action: {self.speedUp()}) { Text("➕") }
                        .foregroundColor(.yellow)
                    Button(action: {self.resetSpeed()}) { Text("Reset") }
                        .foregroundColor(.yellow)
                    VStack {
                        Text("Speed").bold()
                        Text("\(speedLabel)")
                    }
                }.buttonStyle(CircleStyle())
                
                HStack (spacing: 15) {
                    Button(action: {self.pitchDown()}) { Text("➖") }
                        .foregroundColor(.orange)
                    Button(action: {self.pitchUp()}) { Text("➕") }
                        .foregroundColor(.orange)
                    Button(action: {self.resetPitch()}) { Text("Reset") }
                        .foregroundColor(.orange)
                    VStack {
                        Text("Pitch").bold()
                        Text("\(pitchLabel)")
                    }
                }.buttonStyle(CircleStyle())
                
                HStack (spacing: 15) {
                    Button(action: {self.reverbDown()}) { Text("➖") }
                        .foregroundColor(.blue)
                    Button(action: {self.reverbUp()}) { Text("➕") }
                        .foregroundColor(.blue)
                    Button(action: {self.reverbReset()}) { Text("Reset") }
                        .foregroundColor(.blue)
                    VStack {
//                        Text("Reverb").bold()+Text(" (\(reverbValue))")
                        Text("Reverb").bold()
                        Text("\(reverbLabel)")
                    }
                }.buttonStyle(CircleStyle())
                
                HStack (spacing: 15) {
                    Button(action: {self.distortionDown()}) { Text("➖") }
                        .foregroundColor(.gray)
                    Button(action: {self.distortionUp()}) { Text("➕") }
                        .foregroundColor(.gray)
                    Button(action: {self.distortionReset()}) { Text("Reset") }
                        .foregroundColor(.gray)
                    VStack {
//                        Text("Distortion").bold()+Text(" (\(distortionValue))")
                        Text("Distortion").bold()
                        Text("\(distortionLabel)")
                    }
                }.buttonStyle(CircleStyle())
                
                HStack {
                    Button(action: {self.stop()}) { Image(systemName: "stop.fill") .imageScale(.large) }
                        .foregroundColor(.red)
                    Button(action: {self.reset()}) { Text("Reset") }
                        .foregroundColor(.red)
                }.buttonStyle(CircleStyle())
                
            }
            .navigationBarItems( trailing: aboutButton)
            .navigationBarTitle(Text("\(appDisplayName())"), displayMode: .automatic)
        }
        .onAppear(perform: initValues)
    }
    
    func initValues() {
        
        
        speedValue = speedControl.rate
        speedDefault = speedControl.rate
        speedLabel = String(format: "%.02f", arguments: [speedValue])
        
        pitchValue = pitchControl.pitch
        pitchDefault = pitchControl.pitch
        pitchLabel = String(format: "%.02f", arguments: [pitchValue])
    }
    
    private var aboutButton: some View {
        Button(action: {
            self.isPresentingModal = true
        }) {
            Image(systemName: "info.circle.fill")
                .font(.title)
        }.sheet(isPresented: $isPresentingModal) {
            AboutView()
        }
    }
    
    func stop() {
        
        audioEngine.stop()
        activeButton = 0
    }
    
    func reverbDown() {
        reverbValue = reverbDownNow(currentReverbValue: reverbValue)
        reverb.loadFactoryPreset(AVAudioUnitReverbPreset(rawValue: reverbValue)!)
        reverb.wetDryMix = 50
        reverbLabel = getReverbDesc(currentReverbValue: reverbValue)
        self.playBuffer(buttonNo: activeButton)
    }
    
    func reverbUp() {
        reverbValue = reverbUpNow(currentReverbValue: reverbValue)
        reverb.loadFactoryPreset(AVAudioUnitReverbPreset(rawValue: reverbValue)!)
        reverb.wetDryMix = 50
        reverbLabel = getReverbDesc(currentReverbValue: reverbValue)
        self.playBuffer(buttonNo: activeButton)
    }
    
    func reverbReset() {
        reverb.reset()
        reverbValue = 0
        //        reverbDefault = AVAudioUnitReverbPreset.smallRoom.rawValue
        reverbLabel = ""
        self.playBuffer(buttonNo: activeButton)
    }
    
    func distortionDown() {
        distortionValue = distortionDownNow(distortionValue: distortionValue)
        distortionLabel = distortionDesc(distortionValue: distortionValue)
        distortion.loadFactoryPreset(AVAudioUnitDistortionPreset(rawValue: distortionValue)!)
        
        distortion.wetDryMix = 25
        self.playBuffer(buttonNo: activeButton)
    }
    
    func distortionUp() {
        
        distortionValue = distortionUpNow(distortionValue: distortionValue)
        distortionLabel = distortionDesc(distortionValue: distortionValue)
        distortion.loadFactoryPreset(AVAudioUnitDistortionPreset(rawValue: distortionValue)!)
        
        distortion.wetDryMix = 25
        self.playBuffer(buttonNo: activeButton)
        
    }
    
    func distortionReset() {
        distortionValue = 0
        
        distortionLabel = ""
        
        distortion.reset()
        self.playBuffer(buttonNo: activeButton)
        
    }
    
    func reset() {
        resetSpeed()
        resetPitch()
        reverbReset()
        distortionReset()
        
        self.playBuffer(buttonNo: activeButton)
        
    }
    
    func resetSpeed() {
        speedControl.rate = speedDefault
        speedValue = speedDefault
        speedLabel = String(format: "%.02f", arguments: [speedValue])
    }
    
    func resetPitch() {
        print("pitchControl.pitch=\(pitchControl.pitch)")
        pitchControl.pitch = pitchDefault
        pitchValue = pitchDefault
        pitchLabel = String(format: "%.02f", arguments: [pitchValue])
    }
    
    func pitchUp() {
        pitchControl.pitch += 25
        pitchValue = pitchControl.pitch
        pitchLabel = String(format: "%.02f", arguments: [pitchValue])
    }
    func pitchDown() {
        pitchControl.pitch -= 25
        pitchValue = pitchControl.pitch
        pitchLabel = String(format: "%.02f", arguments: [pitchValue])
    }
    func speedUp() {
        speedControl.rate += 0.05
        speedValue = speedControl.rate
        speedLabel = String(format: "%.02f", arguments: [speedValue])
        print("speedValue=\(speedValue) speedLabel=\(speedLabel)")
    }
    func speedDown() {
        speedControl.rate -= 0.05
        speedValue = speedControl.rate
        speedLabel = String(format: "%.02f", arguments: [speedValue])
    }
    
    func playBuffer(buttonNo: Int) {
        
        activeButton = buttonNo
        
        if activeButton == 0 {
            return
        }
        
        let filename = "sbLoop\(buttonNo).wav"
        let filePath = Bundle.main.path(forResource: filename, ofType:nil)!
        print("\(filePath)")
        let fileURL: URL = URL(fileURLWithPath: filePath)
        guard let audioFile = try? AVAudioFile(forReading: fileURL) else{ return }
        
        let audioFormat = audioFile.processingFormat
        let audioFrameCount = UInt32(audioFile.length)
        guard let audioFileBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount)  else{ return }
        do{
            try audioFile.read(into: audioFileBuffer)
        } catch{
            print("over")
        }
        
        audioEngine.attach(audioFilePlayer)
        
        if reverbValue != 0 {
            audioEngine.attach(reverb)
        }
        
        audioEngine.attach(pitchControl)
        audioEngine.attach(speedControl)
        if distortionValue != 0 {
            audioEngine.attach(distortion)
        }
        
        if reverbValue != 0 {
            audioEngine.connect(audioFilePlayer, to: reverb, format: nil)
            audioEngine.connect(reverb, to: speedControl, format: nil)
        } else {
            audioEngine.connect(audioFilePlayer, to: speedControl, format: nil)
        }
        audioEngine.connect(speedControl, to: pitchControl, format: nil)
        if distortionValue != 0 {
            audioEngine.connect(pitchControl, to: distortion, format: nil)
            audioEngine.connect(distortion, to: audioEngine.mainMixerNode, format: nil)
        } else {
            audioEngine.connect(pitchControl, to: audioEngine.mainMixerNode, format: nil)
        }
        
        try? audioEngine.start()
        audioFilePlayer.play()
        audioFilePlayer.scheduleBuffer(audioFileBuffer, at: nil, options:AVAudioPlayerNodeBufferOptions.loops)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
