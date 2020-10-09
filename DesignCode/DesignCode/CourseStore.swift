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
		let colors = [#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
		var index = 0
		
		getArray(id: "coursen") { (items) in
			items.forEach { (item) in
				self.courses.append(Course(
					title: item.fields["title"] as! String,
					subtitle: item.fields["subtitle"] as! String,
										image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!, logo: #imageLiteral(resourceName: "Logo1"), color: colors[index], show: false))
				index = index + 1
			}
		}
	}
}

struct CourseStore_Previews: PreviewProvider {
	static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
	}
}
