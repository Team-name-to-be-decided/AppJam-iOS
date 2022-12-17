import SwiftUI

@main
struct AppJamApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

enum SceneState: String {
    case intro
    case main
}
