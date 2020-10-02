//
//  HomeView.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/02.
//

import SwiftUI

struct HomeView: View {
	@Binding var showProfile: Bool
	
	var body: some View {
		VStack {
			HStack {
				Text("Watching")
					.font(.system(size: 28, weight: .bold))
				
				Spacer()
				
				AvatarView(showProfile: $showProfile)
			}
			.padding(.horizontal)
			.padding(.top, 30)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 30) {
					ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
						SecitonView()
					}
				}
				.padding(30)
				.padding(.leading, 14)
				.padding(.bottom, 30)
			}
			
			Spacer()
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(showProfile: .constant(false))
	}
}

struct SecitonView: View {
	var body: some View {
		VStack {
			HStack(alignment: .top) {
				Text("Prototype designs in SwiftUI")
					.font(.system(size: 24, weight: .bold))
					.frame(width: 160, alignment: .leading)
					.foregroundColor(.white)
				Spacer()
				Image("Logo1")
			}
			Text("18 Sections".uppercased())
				.frame(maxWidth: .infinity, alignment: .leading)
			Image("Card1")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 210)
		}
		.padding(.top, 20)
		.padding(.horizontal, 20)
		.frame(width:275, height:275)
		.background(Color("card1"))
		.cornerRadius(20)
		.shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
	}
}
