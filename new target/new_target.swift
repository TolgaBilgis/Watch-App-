//
//  new_target.swift
//  new target
//
//  Created by Tolga Bilgis on 6/3/25.
//

import AppIntents

struct new_target: AppIntent {
    static var title: LocalizedStringResource { "new target" }
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
