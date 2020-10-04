//
//  Modifiers.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/04.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
			.shadow(color: Color.black.opacity(0.1), radius: 10, x: 1, y: 12)
	}
}

struct FontModifier: ViewModifier {
	var style: Font.TextStyle = .body
	
	func body(content: Content) -> some View {
		content
			.font(.system(style, design: .default))
	}
}


struct CustomFontModifier: ViewModifier {
	var size: CGFloat = 28
	
	func body(content: Content) -> some View {
		content
			.font(.custom("Lato-Bold.ttf", size: size))
	}
}
