//
//  CourseRow.swift
//  DesignCode2
//
//  Created by Junggyun Oh on 2020/10/12.
//

import SwiftUI

struct CourseRow: View {
	var body: some View {
		HStack(alignment: .top) {
			Image(systemName: "paperplane.circle.fill")
				.renderingMode(.template)
				.frame(width: 48.0, height: 48.0)
				.imageScale(.medium)
				.background(Color.blue)
				.clipShape(Circle())
				.foregroundColor(.white)
			VStack(alignment: .leading) {
				Text("SwiftUI")
					.font(.subheadline)
					.bold()
				Text("Description")
					.font(.footnote)
					.foregroundColor(.secondary)
			}
			Spacer()
		}
		
	}
}

struct CourseRow_Previews: PreviewProvider {
	static var previews: some View {
		CourseRow()
	}
}
