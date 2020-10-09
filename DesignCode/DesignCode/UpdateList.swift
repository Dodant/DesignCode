//
//  UpdateList.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/03.
//

import SwiftUI

struct UpdateList: View {
	@ObservedObject var store = UpdateStore()
	
	func addUpdate() {
		store.updates.append(Update(image: "Card1", title: "New Item", text: "Text", date: "Jan 1"))
	}
	
    var body: some View {
		NavigationView {
			List {
				ForEach(store.updates) { update in
					NavigationLink(destination: UpdateDetail(update: update)) {
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
								.foregroundColor(.primary)
							
							Text(update.date)
								.font(.caption)
								.fontWeight(.bold)
								.foregroundColor(.secondary)
						  }
					  }
					  .padding(.vertical, 8)
					}
				}
				.onDelete { index in
					self.store.updates.remove(at: index.first!)
				}
				.onMove { (source: IndexSet, destination: Int) in
					self.store.updates.move(fromOffsets: source, toOffset: destination)
				}
			}
			.navigationBarTitle(Text("Updates"))
			.navigationBarItems(leading: Button(action: addUpdate) {
				Text("Add Update")
			}, trailing: EditButton())
			
		}
		.navigationViewStyle(DoubleColumnNavigationViewStyle())
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
