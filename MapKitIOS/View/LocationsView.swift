import MapKit
import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) private var locationsViewModel
    @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    ))

    var body: some View {
        @Bindable var viewModel = locationsViewModel
        ZStack {
            Map(position: $viewModel.cameraPosition) {
                ForEach(locationsViewModel.locations) { loc in
                    Annotation(loc.name, coordinate: loc.coordinates) {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                            .onTapGesture {
                                viewModel.updateMapRegion(location: loc)
                            }
                    }
                }
            }
            .ignoresSafeArea()
            VStack {
                header
                    .padding()
                Spacer()

                ZStack {
                    ForEach(locationsViewModel.locations) { location in
                        if locationsViewModel.mapLocation == location {
                            LocationPreviewView(location: location)
                                .padding()
                                .shadow(color: .black.opacity(0.5), radius: 20)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
                .sheet(item: $viewModel.showSheetForLocation) { location in
                    LocationDetailView(location: location)
                }
            }
        }
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Text(locationsViewModel.mapLocation.name + ", " + locationsViewModel.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.bold)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .padding()
                        .rotationEffect(Angle(degrees: locationsViewModel.showLocationList ? 180 : 0))
                }
                .onTapGesture {
                    locationsViewModel.toggleShowLocationList()
                }

            if locationsViewModel.showLocationList {
                LocationsListView()
            }
        }
        .background(
            .thickMaterial
        )
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 15)
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
