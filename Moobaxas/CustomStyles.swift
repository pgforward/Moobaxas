//
//  CustomStyles.swift
//  Moobaxas
//
//  Created by Peter Forward on 3/19/20.
//  Copyright © 2020 Peter Forward. All rights reserved.
//

import SwiftUI

struct CircleStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View{
        Circle()
            .fill() // Will use the foreground color by default
            .overlay(
                Circle()
                    .fill(Color.white)
                    .opacity(configuration.isPressed ? 0.3 : 0)
        )
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
                    .padding(4)
        )
            .overlay(
                configuration.label
                    .foregroundColor(.white)
        )
            .frame(width: 60, height: 60)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
        
    }
}
struct RectStyle: ButtonStyle {
    
    /// Selected Button?
    var selectedButton: Bool
    
    func makeBody(configuration: ButtonStyleConfiguration) -> some View{
        Circle()
            .fill() // Will use the foreground color by default
            .overlay(
                Circle()
                    .fill(Color.white)
                    .opacity(configuration.isPressed ? 0.3 : 0)
        )
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
                    .padding(4)
        )
            .overlay(
                configuration.label
                    .foregroundColor(.white)
        )
            .frame(width: 60, height: 60)
        
    }
}

struct CustomTextField: View {
    
    var placeHolder: String
    var rotation: Double
    var scale: CGFloat
    var offset: CGFloat
    
    var body: some View {
//        HStack {
            
            Text(self.placeHolder)
                .padding(12)
                .background(Color.purple)
                .opacity(Double(scale))
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .offset(x: offset)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(3)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    return withAnimation(repeated) {}
            }
            
            
//        }
    }
}

struct MyToggleStyle: ToggleStyle {
    let width: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label

            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: width, height: width / 2)
                    .foregroundColor(configuration.isOn ? .green : .red)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: (width / 2) - 4, height: width / 2 - 6)
                    .padding(4)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                }
            }
        }
    }
}
