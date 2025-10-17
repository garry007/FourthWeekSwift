import SwiftUI

struct FeaturesListView: View {
    @StateObject var viewModel: FeaturesViewModel

    init(viewModel: FeaturesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            List(viewModel.items) { item in
                NavigationLink {
                    destinationView(for: item.route)
                        .navigationTitle(item.title)
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: item.systemImage)
                            .font(.title3)
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.tint)
                            .accessibilityHidden(true)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .font(.headline)
                                .accessibilityAddTraits(.isHeader)
                            Text(item.subtitle)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("FourthWeekSwift")
        }
    }

    @ViewBuilder
    private func destinationView(for route: FeatureRoute) -> some View {
        switch route {
        case .loadingErrorEmpty:
            LoadingErrorEmptyView()
        case .jsonDecodingStatus:
            JSONDecodingStatusView()
        case .mvvmRefactor:
            MVVMRefactorView()
        case .animationsDemo:
            AnimationsDemoView()
        case .accessibilityDemo:
            AccessibilityDemoView()
        case .reviewShare:
            ReviewShareView()
        }
    }
}

#Preview {
    FeaturesListView(viewModel: FeaturesViewModel())
}
