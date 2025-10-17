import Foundation

struct FeatureRowItem: Identifiable {
    let id = UUID()
    let route: FeatureRoute
    var title: String { route.title }
    var subtitle: String { route.subtitle }
    var systemImage: String { route.systemImage }
}
