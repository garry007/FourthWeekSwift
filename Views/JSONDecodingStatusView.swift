import SwiftUI

struct Todo: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

final class JSONDemoViewModel: ObservableObject {
    @Published var items: [Todo] = []
    @Published var statusText: String = "—"
    @Published var decodeError: String?

    func decodeSample(statusCode: Int = 200) {
        // Simulate a response body (normally from URLSession)
        let json = """
        [
          { "userId": 1, "id": 1, "title": "Buy milk", "completed": false },
          { "userId": 1, "id": 2, "title": "Walk dog", "completed": true }
        ]
        """

        // Handle status code first
        switch statusCode {
        case 200...299:
            statusText = "✅ \(statusCode) OK"
        case 400...499:
            statusText = "⚠️ \(statusCode) Client Error"
        case 500...599:
            statusText = "⛔️ \(statusCode) Server Error"
        default:
            statusText = "ℹ️ \(statusCode)"
        }

        guard (200...299).contains(statusCode) else {
            items = []
            decodeError = "Request failed with status \(statusCode)"
            return
        }

        // Decode
        do {
            let data = Data(json.utf8)
            let decoded = try JSONDecoder().decode([Todo].self, from: data)
            self.items = decoded
            self.decodeError = nil
        } catch {
            self.items = []
            self.decodeError = "Decoding failed: \(error.localizedDescription)"
        }
    }
}

struct JSONDecodingStatusView: View {
    @StateObject private var vm = JSONDemoViewModel()
    @State private var statusCode: Double = 200

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Status: \(Int(statusCode))")
                Slider(value: $statusCode, in: 200...599, step: 1)
                    .accessibilityLabel("HTTP status code")
                Button("Run") { vm.decodeSample(statusCode: Int(statusCode)) }
                    .buttonStyle(.borderedProminent)
            }

            HStack {
                Text(vm.statusText).bold()
                if let err = vm.decodeError {
                    Text("· \(err)").foregroundStyle(.red)
                }
            }

            List(vm.items) { todo in
                HStack {
                    StatusBadge(isDone: todo.completed)
                    Text(todo.title)
                        .accessibilityLabel("\(todo.title), \(todo.completed ? "completed" : "not completed")")
                }
            }
            .listStyle(.insetGrouped)

            Spacer()
        }
        .padding()
        .onAppear { vm.decodeSample(statusCode: 200) }
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct StatusBadge: View {
    let isDone: Bool
    var body: some View {
        Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
            .foregroundStyle(isDone ? .green : .secondary)
            .accessibilityHidden(true)
    }
}

#Preview {
    JSONDecodingStatusView()
}
