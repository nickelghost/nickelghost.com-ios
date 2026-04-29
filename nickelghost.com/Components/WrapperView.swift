import SwiftUI

struct WrapperView<Content: View>: View {
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack {
            Color.customDark
                .ignoresSafeArea()
            content()
        }
        .preferredColorScheme(.dark)
        .foregroundStyle(.customText)
    }
}

#Preview {
    CustomNavigationStack {
        WrapperView {
            Text("Hello world!")
                    .navigationTitle("Wrapper View")
        }
    }
}
