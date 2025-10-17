import SwiftUI

// Example MVVM mini-flow: Counter

// MODEL
struct CounterState {
    var value: Int = 0
}

// VIEWMODEL
@MainActor
final class CounterViewModel: ObservableObject {
    @Published private(set) var state = CounterState()

    func increment() { state.value += 1 }
    func decrement() { state.value -= 1 }
    func reset()     { state.value = 0 }
}

// VIEW
struct MVVMRefactorView: View {
    @StateObject private var vm = CounterViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Text("MVVM Example")
                .font(.title2)
                .bold()

            Text("Count: \(vm.state.value)")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .accessibilityLabel("Current count \(vm.state.value)")

            HStack {
                Button("−") { vm.decrement() }
                Button("+") { vm.increment() }
                Button("Reset") { vm.reset() }
            }
            .buttonStyle(.borderedProminent)

            Text("View ➜ binds to @Published state\nViewModel ➜ contains logic\nModel ➜ simple data")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    MVVMRefactorView()
}
