import SwiftUI

struct CustomNavigationStack<Content: View>: View {
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(.customText),
            .font: UIFont(name: "Poppins-Bold", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)!,
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(.customText),
            .font: UIFont(name: "Poppins-SemiBold", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)!
        ]
    }
    
    var body: some View {
        NavigationStack {
            content()
        }
        .tint(.customLink)
    }
}

#Preview {
    VStack {
        CustomNavigationStack {
            WrapperView {
                Text("test")
                    .navigationTitle("LargeTitle")
            }
        }
        CustomNavigationStack {
            WrapperView {
                Text("test")
                    .navigationTitle("Smaller title")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
