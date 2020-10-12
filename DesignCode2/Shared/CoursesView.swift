//
//  CoursesView.swift
//  DesignCode2
//
//  Created by Junggyun Oh on 2020/10/12.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
		List(0 ..< 20) { item in
			CourseRow()
		}
		.listStyle(InsetGroupedListStyle())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
