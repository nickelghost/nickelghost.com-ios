import SwiftUI

struct CardLinks: View {
    let links: [Project.Link]
    
    init(_ links: [Project.Link]) {
        self.links = links
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(links.enumerated()), id: \.element.name) { index, link in
                if index != 0 {
                    Color.customAccent
                        .frame(width: 1)
                }
                
                if let url = URL(string: link.url), UIApplication.shared.canOpenURL(url) {
                    Link(link.name, destination: url)
                        .font(.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
                        .frame(maxWidth: .infinity)
                        .padding(12)
                        .foregroundStyle(.customLink)
                }
            }
        }
    }
}
