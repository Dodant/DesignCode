//
//  CourseStore.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/05.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "ek9sypiw1ut0", accessToken: "qLAIkrusrdw5H8AiZ2Lbn1LMxt6_gRzj3ADk2_5nbyE")

func getArray(id: String, completion: @escaping([Entry]) -> ()){
	let query = Query.where(contentTypeId: id)
	client.fetchArray(of: Entry.self, matching: query) { result in
		switch result {
			case .success(let array):
				DispatchQueue.main.async {
					completion(array.items)
				}
			case .failure(let error):
				print(error)
		}
	}
}

class CourseStore: ObservableObject {
	@Published var courses: [Course] = courseData
	
	init(){
		getArray(id: "coursen") { (items) in
			items.forEach { (item) in
				self.courses.append(Course(
					title: item.fields["title"] as! String,
					subtitle: item.fields["subtitle"] as! String,
					image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), show: false))
			}
		}
	}
}
