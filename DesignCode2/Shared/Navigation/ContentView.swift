import SwiftUI

struct ContentView: View {
	#if os(iOS)
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	#else
	#endif
	
	@ViewBuilder
	var body: some View {
		#if os(iOS)
		if horizontalSizeClass == .compact {
			CoursesView()
		} else {
			CoursesView()
		}
		#else
		Sidebar()
			.frame(minWidth: 1000, minHeight: 600)
		#endif
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
			ContentView()
	}
}
