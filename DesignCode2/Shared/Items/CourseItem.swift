import SwiftUI

struct CourseItem: View {
    var body: some View {
		VStack(alignment: .leading, spacing: 4.0) {
			Spacer()
			HStack {
				Spacer()
				Image("Illustration 1")
					.resizable()
					.aspectRatio(contentMode: .fit)
				Spacer()
			}
			Text("SwiftUI for iOS 14")
				.fontWeight(.bold)
				.foregroundColor(Color.white)
			
			Text("20 Sections")
				.font(.footnote)
				.foregroundColor(Color.white)
			
			
		}
		.padding(.all)
		.background(Color.green)
		.cornerRadius(20.0)
		.shadow(radius: 10)
		
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
