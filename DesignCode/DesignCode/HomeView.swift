//
//  HomeView.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/02.
//

import SwiftUI

struct HomeView: View {
	@Binding var showProfile: Bool
	@State var showUpdate = false
	
	var body: some View {
		VStack {
			HStack {
				Text("Watching")
					.font(.system(size: 28, weight: .bold))
				
				Spacer()
				
				AvatarView(showProfile: $showProfile)
				
				Button(action: { self.showUpdate.toggle() }) {
					Image(systemName: "bell")
						.renderingMode(.original)
						.font(.system(size: 16, weight: .medium))
						.frame(width: 36, height: 36)
						.background(Color.white)
						.clipShape(Circle())
//						.shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
						.shadow(color: Color.black.opacity(0.2), radius: 10, x: 1, y: 10)
						
				}
				.sheet(isPresented: $showUpdate, content: {
					ContentView()
				})
			}
			.padding(.horizontal)
			.padding(.top, 30)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(sectionData) { item in
						GeometryReader { geometry in
							SecitonView(section: item)
								.rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
						}
						.frame(width: 275, height: 275)
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
	var section: Section
	
	var body: some View {
		VStack {
			HStack(alignment: .top) {
				Text(section.title)
					.font(.system(size: 24, weight: .bold))
					.frame(width: 160, alignment: .leading)
					.foregroundColor(.white)
				Spacer()
				Image(section.logo)
			}
			Text(section.text.uppercased())
				.frame(maxWidth: .infinity, alignment: .leading)
			section.image
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 210)
		}
		.padding(.top, 20)
		.padding(.horizontal, 20)
		.frame(width:275, height:275)
		.background(section.color)
		.cornerRadius(20)
		.shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
	}
}

struct Section: Identifiable {
	var id = UUID()
	var title: String
	var text: String
	var logo: String
	var image: Image
	var color: Color
}

let sectionData = [
	Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
	Section(title: "Build a SwiftUI app", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))),
	Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card5")), color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
]


