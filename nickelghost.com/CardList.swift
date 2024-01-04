import SwiftUI

struct CardList<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                content()
                
                Spacer()
            }
            .padding()
        }
    }
}
