import SwiftUI

struct Page: ViewModifier {
    let name: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButton())
    }
}
