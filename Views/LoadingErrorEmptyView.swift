import SwiftUI

enum FetchState {   // 👈 removed fileprivate
    case idle, loading, empty, error(String), loaded([String])
}

final class LoadingDemoViewModel: ObservableObject {
    @Published var state: FetchState = .idle
    func fetch(success: Bool, returnsEmpty: Bool) {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if !success {
                self.state = .error("Network request failed. Please try again.")
                return
            }
            if returnsEmpty {
                self.state = .empty
            } else {
                self.state = .loaded(["Alpha", "Beta", "Gamma", "Delta"])
            }
        }
    }

    func retry() {
        fetch(success: true, returnsEmpty: false)
    }
}

struct LoadingErrorEmptyView: View {
    @StateObject private var vm = LoadingDemoViewModel()
    @State private var simulateSuccess = true
    @State private var simulateEmpty = false

    var body: some View {
        VStack(spacing: 16) {
            controls

            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    if case .loading = vm.state {
                        ProgressView("Loading…")
                            .padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                            .accessibilityLabel("Loading")
                    }
                }
        }
        .padding()
        .onAppear {
            vm.fetch(success: simulateSuccess, returnsEmpty: simulateEmpty)
        }
    }

    @ViewBuilder
    private var content: some View {
        switch vm.state {
        case .idle:
            Text("Tap Fetch to begin.")
                .foregroundStyle(.secondary)

        case .loading:
            EmptyView()

        case .empty:
            VStack(spacing: 8) {
                Image(systemName: "tray")
                    .font(.largeTitle)
                Text("No items found")
                    .font(.headline)
                Text("Try adjusting your filters or adding something new.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Empty state. No items found.")

        case .error(let message):
            VStack(spacing: 12) {
                Label {
                    Text(message)
                } icon: {
                    Image(systemName: "exclamationmark.triangle.fill")
                }
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .red)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 12).fill(.red.opacity(0.15)))

                Button("Retry") { vm.retry() }
                    .buttonStyle(.borderedProminent)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("An error occurred. \(message)")

        case .loaded(let items):
            List(items, id: \.self) { item in
                Text(item)
            }
            .listStyle(.insetGrouped)
        }
    }

    private var controls: some View {
        HStack(spacing: 12) {
            Toggle("Success", isOn: $simulateSuccess)
            Toggle("Empty", isOn: $simulateEmpty)
            Spacer()
            Button("Fetch") {
                vm.fetch(success: simulateSuccess, returnsEmpty: simulateEmpty)
            }
            .buttonStyle(.borderedProminent)
            .accessibilityHint("Starts a simulated network request.")
        }
    }
}

#Preview {
    LoadingErrorEmptyView()
}
