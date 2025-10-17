import SwiftUI

struct AnimationsDemoView: View {
    @State private var show = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Fade & Move")
                .font(.title2).bold()

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.thinMaterial)
                    .frame(height: 180)

                if show {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.tint)
                        .frame(width: 180, height: 60)
                        .overlay(Text("Hello!")
                            .font(.headline)
                            .foregroundStyle(.white))
                        .transition(
                            .asymmetric(
                                insertion: .opacity.combined(with: .move(edge: .bottom)),
                                removal: .opacity.combined(with: .move(edge: .top))
                            )
                        )
                        .accessibilityLabel("Animated banner says Hello")
                }
            }
            .padding(.horizontal)

            Button(show ? "Hide" : "Show") {
                withAnimation(.easeInOut(duration: 0.45)) { show.toggle() }
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AnimationsDemoView()
}
