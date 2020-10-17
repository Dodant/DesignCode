//
//  CourseDetail.swift
//  DesignCode2
//
//  Created by Junggyun Oh on 2020/10/17.
//

import SwiftUI

struct CourseDetail: View {
	var course: Course = courses[0]
	var namespace: Namespace.ID
	
    var body: some View {
		VStack {
			ScrollView {
				CourseItem(course: course)
					.matchedGeometryEffect(id: course.id, in: namespace)
					.frame(height: 300)
				
				VStack {
					ForEach(courseSections) { item in
						CourseRow(item: item)
						Divider()
					}
				}
				.padding()
			}
		}
		.background(Color("Background 1"))
		.clipShape(RoundedRectangle(cornerRadius: 22))
		.matchedGeometryEffect(id: "container\(course.id)", in: namespace)
		.edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
	@Namespace static var namespace
	
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
