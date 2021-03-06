import SwiftUI

struct Sidebar: View {
	var body: some View {
		NavigationView {
			#if os(iOS)
			content
				.navigationTitle("Learn")
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						Image(systemName: "person.crop.circle")
					}
				}
			#else
			content
				.frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
				.toolbar {
					ToolbarItem(placement: .automatic) {
						Button(action: {}) {
							Image(systemName: "person.crop.circle")
						}
					}
				}
			#endif
			
			CoursesView()
		}
	}
	
	var content: some View {
		List {
			NavigationLink(destination: CoursesView()){
				Label("Course", systemImage: "book.closed")
			}
			Label("Tutorial", systemImage: "list.bullet.rectangle")
			Label("Livestream", systemImage: "tv")
			Label("Certificates", systemImage: "mail.stack")
			Label("Search", systemImage: "magnifyingglass")
		}
		.listStyle(SidebarListStyle())
	}
}

struct Sidebar_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			Sidebar()
		}
	}
}
