//
//  UpdateList.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/03.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
		NavigationView {
			List(updateData) { update in
				NavigationLink(destination: Text(update.text)) {
					HStack {
						Image(update.image)
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 80, height: 80)
							.background(Color.black)
							.cornerRadius(20)
							.padding(.trailing, 4)
						
						VStack(alignment: .leading, spacing: 8.0) {
						  Text(update.title)
							  .font(.system(size: 20, weight: .bold))
						  
						  Text(update.text)
							  .lineLimit(2)
							  .font(.subheadline)
							  .foregroundColor(Color.red)
						  
						  Text(update.date)
							  .font(.caption)
							  .fontWeight(.bold)
							  .foregroundColor(.secondary)
						}
					}
					.padding(.vertical, 8)
				}
			}
			.navigationBarTitle(Text("Updates"))
		}
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
	var id = UUID()
	var image: String
	var title: String
	var text: String
	var date: String
}

let updateData = [
	Update(image: "Card1", title: "SwiftUI Advanced", text: "Build a multi-platform app for iOS, iPadOS and Big Sur", date: "JAN 1"),
	Update(image: "Card2", title: "Webflow", text: "Create inner shadows with background color layers", date: "OCT 17"),
	Update(image: "Card3", title: "ProtoPie", text: "Create an Apple Watch-like using trim, stroke and rotation", date: "AUG 27"),
	Update(image: "Card4", title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUN 26"),
	Update(image: "Card5", title: "Framer Playground", text: "Let's use SwiftUI to quickly prototype interactions from a design in Figma.", date: "JUN 11")
]