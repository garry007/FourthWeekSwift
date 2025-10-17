import SwiftUI

struct ReviewShareView: View {
    private let repoURL = URL(string: "https://github.com/garry007/FourthWeekSwift")!

    var body: some View {
        VStack(spacing: 16) {
            Text("Mini Demo Ready?")
                .font(.title2).bold()

            Text("Run through each feature, record a 30–60s screen capture, and push to GitHub.\nThen use ShareLink below.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            ShareLink(item: repoURL, subject: Text("FourthWeekSwift Demo"), message: Text("Check out my Week 4 iOS demo"))
                .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ReviewShareView()
}
