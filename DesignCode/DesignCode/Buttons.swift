//
//  Buttons.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/06.
//

import SwiftUI

struct Buttons: View {
	@State var tap = false
	@State var press = false
	
	var body: some View {
		VStack {
			Text("Button")
				.font(.system(size: 20, weight: .semibold, design: .rounded))
				.frame(width: 200, height: 60)
				.background(
					ZStack {
						Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
						
						RoundedRectangle(cornerRadius: 16, style: .continuous)
							.foregroundColor(Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
							.blur(radius: 4)
							.offset(x: -8, y: -8)
						
						RoundedRectangle(cornerRadius: 16, style: .continuous)
							.fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
							.padding(2)
							.blur(radius: 2)
					}
				)
				.clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
				.overlay(
					HStack {
						Image(systemName: "person.crop.circle")
							.font(.system(size: 24, weight: .light))
							.foregroundColor(press ? Color.white.opacity(0) : Color.white)
							.frame(width: press ? 64: 54, height: press ? 4 : 50)
							.background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
							.clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
							.shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
							.offset(x: press ? 68 : -10, y: press ? 16 : 0)
						
						Spacer()
					}
					
					
					
				)
				.shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
				.shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
				.scaleEffect(tap ? 1.1 : 1)
				.gesture(
					LongPressGesture(minimumDuration: 0.5, maximumDistance: 10)
						.onChanged { value in
							self.tap = true
							DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
								self.tap = false
							}
						}
						.onEnded { value in
							self.press.toggle()
						}
				)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
		.edgesIgnoringSafeArea(.all)
		.animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
	}
}

struct Buttons_Previews: PreviewProvider {
	static var previews: some View {
		Buttons()
	}
}
