//
//  UserStore.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/09.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
	@Published var isLogged = false
	@Published var showLogin = false
}
