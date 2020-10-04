//
//  CourseList.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/04.
//

import SwiftUI

struct CourseList: View {
	@State var courses = courseData
	
	var body: some View {
		ScrollView {
			VStack(spacing: 30) {
				Text("Courses")
					.font(.largeTitle).bold()
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading, 30)
					.padding(.top, 30)
				
				ForEach(courses.indices, id: \.self) { index in
					GeometryReader { geometry in
						CourseView(show: self.$courses[index].show, course: self.courses[index])
						  .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
				  }
				  .frame(height: self.courses[index].show ? screen.height : 280)
					.frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
				}
			}
			.frame(width: screen.width)
			.animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
			
		}
	}
}

struct CourseList_Previews: PreviewProvider {
	static var previews: some View {
		CourseList()
	}
}

struct CourseView: View {
	
	@Binding var show: Bool
	var course: Course
	
	var body: some View {
		ZStack(alignment: .top) {
			VStack(alignment: .leading, spacing: 30.0) {
				Text("Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
				Text("About this Course")
					.font(.title).bold()
				Text("Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
				Text("Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
			}
			.padding(30)
			.frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
			.offset(y: show ? 460 : 0)
			.background(Color.white)
			.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
			.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
			.opacity(show ? 1 : 0)
			
			VStack {
				HStack(alignment: .top) {
					VStack(alignment: .leading, spacing: 8.0) {
						Text(course.title)
							.font(.system(size: 24, weight: .bold))
							.foregroundColor(.white)
						Text(course.subtitle)
							.foregroundColor(Color.white.opacity(0.7))
						
					}
					Spacer()
					ZStack {
						Image(uiImage: course.logo)
							.opacity(show ? 0 : 1)
						VStack {
							Image(systemName: "xmark")
								.font(.system(size: 16, weight: .medium))
								.foregroundColor(.white)
						}
						.frame(width: 36, height: 36)
						.background(Color.black)
						.clipShape(Circle())
						.opacity(show ? 1 : 0)
					}
				}
				Spacer()
				Image(uiImage: course.image)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: .infinity)
					.frame(height: 140, alignment: .top)
			}
			.padding(show ? 30 : 20)
			.padding(.top, show ? 30 : 0)
			//		.frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
			.frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
			.background(Color(course.color))
			.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
			.shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
			//		.animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
			.onTapGesture {
				self.show.toggle()
			}
		}
		.frame(height: show ? screen.height : 280)
		.edgesIgnoringSafeArea(.all)
		.animation(.easeInOut)
	}
}

struct Course: Identifiable {
	var id = UUID()
	var title: String
	var subtitle: String
	var image: UIImage
	var logo: UIImage
	var color: UIColor
	var show: Bool
}

var courseData = [
	Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
	Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
	Course(title: "UI Design for Developers", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)
]
