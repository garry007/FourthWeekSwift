import Foundation

final class FeaturesViewModel: ObservableObject {
    @Published var items: [FeatureRowItem] = FeatureRoute.allCases.map { FeatureRowItem(route: $0) }
}
