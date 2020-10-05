//
//  CourseStore.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/05.
//

import SwiftUI
import Contentful

let client = Client(spaceId: "ek9sypiw1ut0", accessToken: "qLAIkrusrdw5H8AiZ2Lbn1LMxt6_gRzj3ADk2_5nbyE")

func getArray(){
	let query = Query.where(contentTypeId: "coursen")
	client.fetchArray(of: Entry.self, matching: query) { result in
		print(result)
	}
}
