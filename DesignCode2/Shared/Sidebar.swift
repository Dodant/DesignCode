import SwiftUI

struct Sidebar: View {
	var body: some View {
		NavigationView {
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
			.navigationTitle("Learn")
			
			CoursesView()
		}
		
	}
}

struct Sidebar_Previews: PreviewProvider {
	static var previews: some View {
		Group {
//			Sidebar()
			Sidebar()
				.previewDevice("iPad Pro (11-inch) (2nd generation)")
		}
	}
}
