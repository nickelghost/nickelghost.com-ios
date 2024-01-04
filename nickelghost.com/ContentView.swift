import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavigationStack {
            WrapperView {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
