import SwiftUI

struct AccessibilityDemoView: View {
    @State private var quantity: Int = 1

    var body: some View {
        Form {
            Section("Dynamic Type") {
                Text("This text scales with the user's preferred font size.")
                    .font(.body) // Scales automatically
            }

            Section("VoiceOver Labels & Hints") {
                Stepper(value: $quantity, in: 1...10) {
                    Text("Quantity: \(quantity)")
                }
                .accessibilityLabel("Quantity")
                .accessibilityValue("\(quantity)")
                .accessibilityHint("Increases or decreases the number.")
            }

            Section("Images & Decorative") {
                HStack {
                    Image(systemName: "birthday.cake.fill")
                        .font(.largeTitle)
                        .accessibilityLabel("Birthday cake icon")
                    Text("Celebration")
                }

                Image(systemName: "rectangle.portrait")
                    .accessibilityHidden(true) // purely decorative
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AccessibilityDemoView()
}
