//
//  RingView.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/03.
//

import SwiftUI

struct RingView: View {
    var body: some View {
		ZStack {
			Circle()
				.stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 7))
				.frame(width: 44, height: 44)

			Circle()
			  .trim(from: 0.2, to: 1)
			  .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
					  style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
			  .rotationEffect(Angle(degrees: 90))
			  .rotation3DEffect(
				  Angle(degrees: 180),
				  axis: (x: 1.0, y: 0, z: 0.0))
			  .frame(width: 44, height: 44)
				.shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
			
			Text("82%")
				.font(.subheadline)
				.fontWeight(.medium)
		}
    }
	
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
