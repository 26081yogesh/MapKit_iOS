

import SwiftUI

struct LocationDetailView: View {
    @Environment(LocationsViewModel.self) var vm
    let location: Location
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)

                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        
        .ignoresSafeArea()
        .overlay(alignment: .topLeading, content: {
            Button{
                vm.showSheetForLocation = nil
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .padding(16)
                    .foregroundColor(.primary)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
            }
        })
        
    }
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }

    private var descSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link){
                Link("Read More On Wikipedia...", destination: url)
                    .tint(.blue)
                    .fontWeight(.semibold)
            }
            
            
        }
    }
}

#Preview {
    LocationDetailView(
        location: LocationsDataService.locations.first!
    )
    .environment(LocationsViewModel())
}
