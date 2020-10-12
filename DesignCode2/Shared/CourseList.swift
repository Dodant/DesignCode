//
//  CourseList.swift
//  DesignCode2
//
//  Created by Junggyun Oh on 2020/10/12.
//

import SwiftUI

struct CourseList: View {
	@ViewBuilder
	var body: some View {
		#if os(iOS)
		content
			.listStyle(InsetGroupedListStyle())
		#else
		content
			.frame(minWidth: 800, minHeight: 600)
		#endif
	}
	
	var content: some View{
		List(0 ..< 20) { item in
			CourseRow()
		}
		.navigationTitle("Courses")
	}
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
