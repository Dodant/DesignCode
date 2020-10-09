//
//  UserStore.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/09.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
	@Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
		didSet {
			UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
		}
	}
	@Published var showLogin = false
}
