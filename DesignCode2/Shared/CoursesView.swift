import SwiftUI

struct CoursesView: View {
	@State var show = false
	@Namespace var namespace
	@State var selectedItem: Course? = nil
	@State var isDisabled = false
	
	var body: some View {
		ZStack {
			ScrollView {
				LazyVGrid(
					columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
					spacing: 16
				) {
					ForEach(courses) { item in
						VStack {
							CourseItem(course: item)
								.matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
								.frame(height: 200)
								.onTapGesture {
									withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
										show.toggle()
										selectedItem = item
										isDisabled = true
									}
								}
								.disabled(isDisabled)
						}
						.matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
					}
				}
				.padding(16)
				.frame(maxWidth: .infinity)
			}
			.zIndex(1)
			
			if selectedItem != nil {
				ZStack (alignment: .topTrailing) {
					CourseDetail(course: selectedItem!, namespace: namespace)
					
					CloseButton()
						.padding(.trailing, 16)
						.onTapGesture {
							withAnimation(.spring()) {
								show.toggle()
								selectedItem = nil
								DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
									isDisabled = false
								}
							}
						}
						
				}
				.zIndex(2)
			}
		}
	}
}

struct CoursesView_Previews: PreviewProvider {
	static var previews: some View {
		CoursesView()
	}
}
