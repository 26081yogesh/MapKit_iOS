import Foundation
import MapKit

class LocationsDataService {
    static let locations: [Location] = [
        Location(
            name: "Taj Mahal",
            cityName: "Agra",
            coordinates: CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421),
            description: "The Taj Mahal is an ivory-white marble mausoleum on the south bank of the Yamuna river in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan to house the tomb of his favourite wife, Mumtaz Mahal.",
            imageNames: ["tajmahal1", "tajmahal2"],
            link: "https://en.wikipedia.org/wiki/Taj_Mahal"
        ),
        Location(
            name: "Hawa Mahal",
            cityName: "Jaipur",
            coordinates: CLLocationCoordinate2D(latitude: 26.9239, longitude: 75.8267),
            description: "The Hawa Mahal is a palace in the city of Jaipur, India. Built from red and pink sandstone, the palace sits on the edge of the City Palace, Jaipur, and extends to the Zenana, or women's chambers. Its unique five-story exterior resembles a honeycomb with its 953 small windows called Jharokhas.",
            imageNames: ["hawamahal1", "hawamahal2"],
            link: "https://en.wikipedia.org/wiki/Hawa_Mahal"
        ),
        Location(
            name: "Gateway of India",
            cityName: "Mumbai",
            coordinates: CLLocationCoordinate2D(latitude: 18.9220, longitude: 72.8347),
            description: "The Gateway of India is an arch-monument built in the early twentieth century in the city of Mumbai. It was erected to commemorate the landing in December 1911 at Apollo Bunder of King-Emperor George V and Queen-Empress Mary, the first British monarch to visit India.",
            imageNames: ["gateway1", "gateway2"],
            link: "https://en.wikipedia.org/wiki/Gateway_of_India"
        ),
        Location(
            name: "Golden Temple",
            cityName: "Amritsar",
            coordinates: CLLocationCoordinate2D(latitude: 31.6200, longitude: 74.8765),
            description: "The Golden Temple, also known as Harmandir Sahib, is a gurdwara located in the city of Amritsar, Punjab, India. It is the preeminent spiritual site of Sikhism and is famous for its stunning golden architecture surrounded by a sacred pool (Amrit Sarovar).",
            imageNames: ["goldentemple1", "goldentemple2"],
            link: "https://en.wikipedia.org/wiki/Golden_Temple"
        ),
        Location(
            name: "Red Fort",
            cityName: "New Delhi",
            coordinates: CLLocationCoordinate2D(latitude: 28.6562, longitude: 77.2410),
            description: "The Red Fort is a historic fort in the Old Delhi neighborhood of Delhi, India, that served as the main residence of the Mughal Emperors. Emperor Shah Jahan commissioned construction of the Red Fort on 12 May 1638, when he decided to shift his capital from Agra to Delhi.",
            imageNames: ["redfort1", "redfort2"],
            link: "https://en.wikipedia.org/wiki/Red_Fort"
        ),
        Location(
            name: "Victoria Memorial",
            cityName: "Kolkata",
            coordinates: CLLocationCoordinate2D(latitude: 22.5448, longitude: 88.3426),
            description: "The Victoria Memorial is a massive marble building in Central Kolkata, built between 1906 and 1921. It is dedicated to the memory of Queen Victoria, then Empress of India, and now serves as a prominent museum and cultural monument.",
            imageNames: ["victoria1", "victoria2"],
            link: "https://en.wikipedia.org/wiki/Victoria_Memorial_(India)"
        )
    ]
}
