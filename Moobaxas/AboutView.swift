//
//  AboutView.swift
//  Moobaxas
//
//  Created by Peter Forward on 3/29/20.
//  Copyright © 2020 Peter Forward. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showAnimation = false
    @State var rotation: Double = 0
    
    @State var scale: CGFloat = 0.8
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("saxmusic")
                    .resizable()
                    .frame(width: 241, height: 241)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .offset(x: 35)
                //                .padding(.bottom, 15)
                HStack{
                    Spacer()
                    
                    VStack {
                        
                        Text("M")
                            .padding(12)
                            .background(Color.purple)
                            .opacity(Double(scale))
                            .scaleEffect(scale)
                            .rotationEffect(.degrees(rotation))
                            .onAppear {
                                let baseAnimation = Animation.easeInOut(duration: 1).delay(3)
                                let repeated = baseAnimation.repeatForever(autoreverses: true)
                                return withAnimation(repeated) {
                                    if self.rotation == 45 {
                                        self.rotation = 315
                                    } else {
                                        self.rotation = 45
                                    }
                                    self.scale = 1
                                }
                        }
                        CustomTextField(placeHolder: "O", rotation: rotation, scale: scale)
                        CustomTextField(placeHolder: "O", rotation: rotation, scale: scale)
                        CustomTextField(placeHolder: "B", rotation: rotation, scale: scale)
                        CustomTextField(placeHolder: "A", rotation: rotation, scale: scale)
                        CustomTextField(placeHolder: "X", rotation: rotation, scale: scale)
                        CustomTextField(placeHolder: "A", rotation: rotation, scale: scale)
                        CustomTextField(placeHolder: "S", rotation: rotation, scale: scale)
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text(appVersion()).font(.body)
                        Text("Created by Peter Forward 2020").font(.body)
                            .padding(.bottom, 35)
                    }
                    Spacer()
                }.font(.largeTitle)
                Spacer()
            } .navigationBarItems(leading: cancelButton)
                .navigationBarTitle(Text(""), displayMode: .inline)
        }.onAppear(perform: initValues)
    }
    
    func initValues() {
        withAnimation {
            self.rotation = 45
            self.showAnimation.toggle();
        }
        
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
