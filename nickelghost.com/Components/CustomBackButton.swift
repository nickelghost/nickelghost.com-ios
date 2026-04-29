import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            self.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                Text("Back")
            }
            .font(.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
        }
    }
}

#Preview {
    WrapperView {
        CustomBackButton()
            .foregroundStyle(.customLink)
    }
}
