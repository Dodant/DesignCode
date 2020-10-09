//
//  DesignCodeApp.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/02.
//

import SwiftUI
import UIKit
import Firebase

@main
struct DesignCodeApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
//			Home().environmentObject(UserStore())
			CourseList()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		return true
	}
}
