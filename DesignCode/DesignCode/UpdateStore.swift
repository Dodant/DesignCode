//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/03.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
	@Published var updates: [Update] = updateData
}
