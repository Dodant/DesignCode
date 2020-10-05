//
//  DataStore.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/05.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
	@Published var posts: [Post] = []
	
	init(){
		self.getPosts()
	}
	
	func getPosts(){
		Api().getPosts { (posts) in
			self.posts = posts
		}
	}
}
