import SwiftUI

struct ContentView: View {
	@ViewBuilder
	var body: some View {
		#if os(iOS)
		Sidebar()
		#else
		Sidebar()
			.frame(minWidth: 1000, minHieght: 600)
		#endif
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ContentView()
		}
	}
}
