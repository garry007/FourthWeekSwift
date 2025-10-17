import Foundation

enum FeatureRoute: String, CaseIterable, Identifiable {
    case loadingErrorEmpty
    case jsonDecodingStatus
    case mvvmRefactor
    case animationsDemo
    case accessibilityDemo
    case reviewShare

    var id: String { rawValue }

    var title: String {
        switch self {
        case .loadingErrorEmpty: return "Loading / Error / Empty States"
        case .jsonDecodingStatus: return "JSON Decoding & Status Codes"
        case .mvvmRefactor:      return "MVVM Deep Dive (Refactor)"
        case .animationsDemo:    return "SwiftUI Animations"
        case .accessibilityDemo: return "Accessibility (Dynamic Type / VoiceOver)"
        case .reviewShare:       return "Review & Share (Mini Demo)"
        }
    }

    var subtitle: String {
        switch self {
        case .loadingErrorEmpty: return "Show skeletons, retries, and empty placeholders"
        case .jsonDecodingStatus: return "Decode JSON and handle server statuses"
        case .mvvmRefactor: return "Separate View, ViewModel, and Model"
        case .animationsDemo: return "Fade & move effects"
        case .accessibilityDemo: return "Scalable text, labels, hints"
        case .reviewShare: return "Prepare GitHub share"
        }
    }

    var systemImage: String {
        switch self {
        case .loadingErrorEmpty: return "arrow.triangle.2.circlepath"
        case .jsonDecodingStatus: return "curlybraces.square"
        case .mvvmRefactor: return "square.stack.3d.up"
        case .animationsDemo: return "sparkles"
        case .accessibilityDemo: return "figure.wave"
        case .reviewShare: return "square.and.arrow.up"
        }
    }
}
