import Foundation
import MapKit
import SwiftUI

@Observable
class LocationsViewModel {
    var locations: [Location]
    var mapLocation: Location
    var cameraPosition: MapCameraPosition
    
    var showSheetForLocation: Location? = nil

    /// For Toggling Location List
    var showLocationList: Bool = false

    init() {
        let loadedLocations = LocationsDataService.locations
        locations = loadedLocations

        let defaultLocation = loadedLocations.first!

        mapLocation = defaultLocation

        cameraPosition = .region(
            MKCoordinateRegion(
                center: defaultLocation.coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        )
    }

    func toggleShowLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }

    func nextBtnPressed(loc: Location) {
        guard let currentIndex = locations.firstIndex(of: loc) else { return }

        let nextIndex = currentIndex + 1

        if locations.indices.contains(nextIndex) {
            let nextLocation = locations[nextIndex]
            updateMapRegion(location: nextLocation)
        } else {
            if let firstLocation = locations.first {
                updateMapRegion(location: firstLocation)
            }
        }
    }

    func updateNextLocation(location: Location) {
        mapLocation = location
        updateMapRegion(location: location)
        showLocationList = false
    }

    func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            self.cameraPosition = .region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                )
            )
        }
    }
}
