import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
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
