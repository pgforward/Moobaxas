//
//  AboutView.swift
//  Moobaxas
//
//  Created by Peter Forward on 3/29/20.
//  Copyright © 2020 Peter Forward. All rights reserved.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: nil) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
    }
}

struct AboutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let offsetConst: CGFloat = 0

    @State var rotation: Double = 45
    @State var scale: CGFloat = 1
    @State var moo = true
    @State private var allowAnimations : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("saxmoobaa")
                    .resizable()
                    .frame(width: 241, height: 241)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .offset(x: 35)
                    .animation(nil)
                //                .padding(.bottom, 15)
                HStack{
                    Spacer()
                    
                    VStack {
                        CustomTextField(placeHolder: "M", rotation: rotation, scale: scale, offset: moo ? -40 : 65)
                        CustomTextField(placeHolder: "O", rotation: rotation, scale: scale, offset: moo ? -20 : 50)
                        CustomTextField(placeHolder: "O", rotation: rotation, scale: scale, offset: moo ? 0 : 35)
                        CustomTextField(placeHolder: "B", rotation: rotation, scale: scale, offset: moo ? 20 : 20)
                        CustomTextField(placeHolder: "A", rotation: rotation, scale: scale, offset: moo ? 40 : 5)
                        CustomTextField(placeHolder: "X", rotation: rotation, scale: scale, offset: moo ? 60 : -10)
                        CustomTextField(placeHolder: "A", rotation: rotation, scale: scale, offset: moo ? 80 : -25)
                        CustomTextField(placeHolder: "S", rotation: rotation, scale: scale, offset: moo ? 100 : -40)
                    }
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            //                            self.allowAnimations = true
                            let baseAnimation = Animation.easeInOut(duration: 1.5)
                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                            withAnimation(repeated) {
                                rotation = -45
                                scale = 0.75
                                moo = false
                            }
                        }
                    }
                    .onTapGesture {
                        //                        .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1.5)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        withAnimation(repeated) {
                            rotation = -45
                            moo = false
                        }
                    }
                    
                    //                    .onAppear {
                    //                        let baseAnimation = Animation.easeInOut(duration: 1)
                    //                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                    //
                    //                        withAnimation(repeated) {
                    //                            scale = 0.5
                    //                            mult = 0
                    //                            rotation = 0
                    //                        }
                    //                    }
                    
                    //                    .onAppear {
                    //                        let baseAnimation = Animation.easeInOut(duration: 1).delay(3)
                    //                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                    //                        return withAnimation(repeated) {
                    //                            rotation = 315
                    //                            mult = 1
                    //                            scale = 1
                    //                        }
                    //                    }
                    
                    Spacer()
                    VStack {
                        Spacer()
                        Text(appVersion()).font(.body)
                        Text("Created by Peter Forward 2020").font(.body)
                            .padding(.bottom, 35)
                    }
                    .animation(nil)
                    Spacer()
                }.font(.largeTitle)
                Spacer()
            } .navigationBarItems(leading: cancelButton)
                .navigationBarTitle(Text(""), displayMode: .inline)
        }.onAppear(perform: initValues)
    }
    
    func initValues() {
        
        playSound(sound: "sheep.wav", type: "")
        
        //        withAnimation {
        //            mult = 1
        //            rotation = 25
        //            showAnimation.toggle();
        //        }
    }
    
    private var cancelButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Close")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
