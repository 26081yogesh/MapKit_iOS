import SwiftUI

@main
struct MapKitIOSApp: App {
    @State private var locationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environment(locationsViewModel)
        }
    }
}
