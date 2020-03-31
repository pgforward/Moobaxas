//
//  SoundInfo.swift
//  Moobaxas
//
//  Created by Peter Forward on 3/19/20.
//  Copyright © 2020 Peter Forward. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

func reverbUpNow(currentReverbValue: Int) -> Int {
    switch currentReverbValue {
    case AVAudioUnitReverbPreset.cathedral.rawValue:
        return AVAudioUnitReverbPreset.smallRoom.rawValue
    case AVAudioUnitReverbPreset.largeHall.rawValue:
        return AVAudioUnitReverbPreset.cathedral.rawValue
    case AVAudioUnitReverbPreset.largeRoom.rawValue:
        return AVAudioUnitReverbPreset.largeHall.rawValue
    case AVAudioUnitReverbPreset.mediumHall.rawValue:
        return AVAudioUnitReverbPreset.largeRoom.rawValue
    case AVAudioUnitReverbPreset.mediumRoom.rawValue:
        return AVAudioUnitReverbPreset.mediumHall.rawValue
    case AVAudioUnitReverbPreset.smallRoom.rawValue:
        return AVAudioUnitReverbPreset.mediumRoom.rawValue
    default:
        return AVAudioUnitReverbPreset.largeHall.rawValue
    }
}

func reverbDownNow(currentReverbValue: Int) -> Int {
    print("currentReverbValue=\(currentReverbValue)")
    switch currentReverbValue {
    case AVAudioUnitReverbPreset.cathedral.rawValue:
        return AVAudioUnitReverbPreset.largeHall.rawValue
    case AVAudioUnitReverbPreset.largeHall.rawValue:
        return AVAudioUnitReverbPreset.largeRoom.rawValue
    case AVAudioUnitReverbPreset.largeRoom.rawValue:
        return AVAudioUnitReverbPreset.mediumHall.rawValue
    case AVAudioUnitReverbPreset.mediumHall.rawValue:
        return AVAudioUnitReverbPreset.mediumRoom.rawValue
    case AVAudioUnitReverbPreset.mediumRoom.rawValue:
        return AVAudioUnitReverbPreset.smallRoom.rawValue
    case AVAudioUnitReverbPreset.smallRoom.rawValue:
        return AVAudioUnitReverbPreset.cathedral.rawValue
    default:
        return AVAudioUnitReverbPreset.smallRoom.rawValue
    }
}

func getReverbDesc(currentReverbValue: Int) -> String {
    switch currentReverbValue {
    case AVAudioUnitReverbPreset.cathedral.rawValue:
        return "Cathedral"
    case AVAudioUnitReverbPreset.largeHall.rawValue:
        return "Large Hall"
    case AVAudioUnitReverbPreset.largeRoom.rawValue:
        return "Large Room"
    case AVAudioUnitReverbPreset.mediumHall.rawValue:
        return "Medium Hall"
    case AVAudioUnitReverbPreset.mediumRoom.rawValue:
        return "Medium Room"
    case AVAudioUnitReverbPreset.smallRoom.rawValue:
        return "Small Room"
    default:
        return "Who Knows"
    }
}

func distortionUpNow(distortionValue: Int) -> Int {
    switch distortionValue {
    case AVAudioUnitDistortionPreset.drumsBitBrush.rawValue:
        return AVAudioUnitDistortionPreset.drumsBufferBeats.rawValue
    case AVAudioUnitDistortionPreset.drumsBufferBeats.rawValue:
        return AVAudioUnitDistortionPreset.multiBrokenSpeaker.rawValue
    case AVAudioUnitDistortionPreset.multiBrokenSpeaker.rawValue:
        return AVAudioUnitDistortionPreset.multiCellphoneConcert.rawValue
    case AVAudioUnitDistortionPreset.multiCellphoneConcert.rawValue:
        return AVAudioUnitDistortionPreset.multiDistortedFunk.rawValue
    case AVAudioUnitDistortionPreset.multiDistortedFunk.rawValue:
        return AVAudioUnitDistortionPreset.multiDistortedCubed.rawValue
    case AVAudioUnitDistortionPreset.multiDistortedCubed.rawValue:
        return AVAudioUnitDistortionPreset.multiDistortedSquared.rawValue
    case AVAudioUnitDistortionPreset.multiDistortedSquared.rawValue:
        return AVAudioUnitDistortionPreset.multiEcho1.rawValue
    case AVAudioUnitDistortionPreset.multiEcho1.rawValue:
        return AVAudioUnitDistortionPreset.multiEchoTight1.rawValue
    case AVAudioUnitDistortionPreset.multiEchoTight1.rawValue:
        return AVAudioUnitDistortionPreset.multiEverythingIsBroken.rawValue
    case AVAudioUnitDistortionPreset.multiEverythingIsBroken.rawValue:
        return AVAudioUnitDistortionPreset.speechAlienChatter.rawValue
    case AVAudioUnitDistortionPreset.speechAlienChatter.rawValue:
        return AVAudioUnitDistortionPreset.speechCosmicInterference.rawValue
    case AVAudioUnitDistortionPreset.speechCosmicInterference.rawValue:
        return AVAudioUnitDistortionPreset.speechGoldenPi.rawValue
    case AVAudioUnitDistortionPreset.speechGoldenPi.rawValue:
        return AVAudioUnitDistortionPreset.speechRadioTower.rawValue
    case AVAudioUnitDistortionPreset.speechRadioTower.rawValue:
        return AVAudioUnitDistortionPreset.speechWaves.rawValue
    case AVAudioUnitDistortionPreset.speechWaves.rawValue:
        return AVAudioUnitDistortionPreset.drumsBitBrush.rawValue
    default:
        return AVAudioUnitDistortionPreset.speechWaves.rawValue
    }
}

func distortionDownNow(distortionValue: Int) -> Int {

    switch distortionValue {
    case AVAudioUnitDistortionPreset.drumsBufferBeats.rawValue:
        return AVAudioUnitDistortionPreset.drumsBitBrush.rawValue
    case AVAudioUnitDistortionPreset.multiBrokenSpeaker.rawValue:
        return AVAudioUnitDistortionPreset.drumsBufferBeats.rawValue
    case AVAudioUnitDistortionPreset.multiCellphoneConcert.rawValue:
        return AVAudioUnitDistortionPreset.multiBrokenSpeaker.rawValue
    case AVAudioUnitDistortionPreset.multiDistortedFunk.rawValue:
        return AVAudioUnitDistortionPreset.multiCellphoneConcert.rawValue
    case AVAudioUnitDistortionPreset.multiDistortedCubed.rawValue:
        return AVAudioUnitDistortionPreset.multiDistortedFunk.rawValue
    case AVAudioUnitDistortionPreset.multiDistortedSquared.rawValue:
        return AVAudioUnitDistortionPreset.multiDistortedCubed.rawValue
    case AVAudioUnitDistortionPreset.multiEcho1.rawValue:
        return AVAudioUnitDistortionPreset.multiDistortedSquared.rawValue
    case AVAudioUnitDistortionPreset.multiEchoTight1.rawValue:
        return AVAudioUnitDistortionPreset.multiEcho1.rawValue
    case AVAudioUnitDistortionPreset.multiEverythingIsBroken.rawValue:
        return AVAudioUnitDistortionPreset.multiEchoTight1.rawValue
    case AVAudioUnitDistortionPreset.speechAlienChatter.rawValue:
        return AVAudioUnitDistortionPreset.multiEverythingIsBroken.rawValue
    case AVAudioUnitDistortionPreset.speechCosmicInterference.rawValue:
        return AVAudioUnitDistortionPreset.speechAlienChatter.rawValue
    case AVAudioUnitDistortionPreset.speechGoldenPi.rawValue:
        return AVAudioUnitDistortionPreset.speechCosmicInterference.rawValue
    case AVAudioUnitDistortionPreset.speechRadioTower.rawValue:
        return AVAudioUnitDistortionPreset.speechGoldenPi.rawValue
    case AVAudioUnitDistortionPreset.speechWaves.rawValue:
        return AVAudioUnitDistortionPreset.speechRadioTower.rawValue
    case AVAudioUnitDistortionPreset.drumsBitBrush.rawValue:
        return AVAudioUnitDistortionPreset.speechWaves.rawValue
    default:
        return AVAudioUnitDistortionPreset.speechWaves.rawValue
    }
}

func distortionDesc(distortionValue: Int) -> String {
    switch distortionValue {
    case AVAudioUnitDistortionPreset.drumsBitBrush.rawValue:
        return "Drum Brush"
    case AVAudioUnitDistortionPreset.drumsBufferBeats.rawValue:
        return "Drum Beats"
    case AVAudioUnitDistortionPreset.multiBrokenSpeaker.rawValue:
        return "Broken Speaker"
    case AVAudioUnitDistortionPreset.multiCellphoneConcert.rawValue:
        return "Cellphone Concert"
    case AVAudioUnitDistortionPreset.multiDistortedFunk.rawValue:
        return "Distorted Funk"
    case AVAudioUnitDistortionPreset.multiDistortedCubed.rawValue:
        return "Distorted Cubed"
    case AVAudioUnitDistortionPreset.multiDistortedSquared.rawValue:
        return "Distorted Squared"
    case AVAudioUnitDistortionPreset.multiEcho1.rawValue:
        return "Echo"
    case AVAudioUnitDistortionPreset.multiEchoTight1.rawValue:
        return "Echo Tight"
    case AVAudioUnitDistortionPreset.multiEverythingIsBroken.rawValue:
        return "Everything Broken"
    case AVAudioUnitDistortionPreset.speechAlienChatter.rawValue:
        return "Alien Chatter"
    case AVAudioUnitDistortionPreset.speechCosmicInterference.rawValue:
        return "Cosmic Interference"
    case AVAudioUnitDistortionPreset.speechGoldenPi.rawValue:
        return "Golden Pi"
    case AVAudioUnitDistortionPreset.speechRadioTower.rawValue:
        return "Radio Tower"
    case AVAudioUnitDistortionPreset.speechWaves.rawValue:
        return "Waves"
    default:
        return "Who knows"
    }
}
