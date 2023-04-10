//
//  LearningAppV1App.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/10/23.
//

import SwiftUI

@main
struct LearningAppV1App: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
