//
//  FourthWeekSwiftApp.swift
//  FourthWeekSwift
//
//  Created by Gurpreet Singh on 2025-10-17.
//

import SwiftUI

@main
struct FourthWeekSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            FeaturesListView(viewModel: FeaturesViewModel())
        }
    }
}
