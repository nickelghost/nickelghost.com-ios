import SwiftUI

struct Card<Content: View>: View {
    let heading: String
    let imageUrl: String?
    let technologies: [String]?
    let description: String?
    let content: () -> Content
    
    init(
        heading: String,
        imageUrl: String? = nil,
        technologies: [String]? = nil,
        description: String? = nil,
        content: @escaping () -> Content
    ) {
        self.heading = heading
        self.imageUrl = imageUrl
        self.technologies = technologies
        self.description = description
        self.content = content
        return
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(heading)
                .font(.custom("Poppins-SemiBold", size: UIFont.preferredFont(forTextStyle: .title2).pointSize))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.customPrimary)
            
            if let imageUrl = imageUrl {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                }
            }
            
            if let technologies = technologies {
                Text(technologies.joined(separator: "     "))
                    .font(.custom("Poppins-SemiBold", size: UIFont.preferredFont(forTextStyle: .headline).pointSize))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.025))
                
                Color.customAccent.frame(height: 1)
            }
            
            if let description = description {
                Text(description)
                    .font(.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize))
                    .padding()
            }
            
            VStack(spacing: 0) {
                Color.customAccent.frame(height: 1)
                
                content()
            }
        }
        .border(.customAccent)
    }
}

#Preview {
    WrapperView {
        Card(
            heading: "My Card Here",
            imageUrl: "https://images.pexels.com/photos/9502636/pexels-photo-9502636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            technologies: ["React", "PHP", "Laravel"],
            description: "I'm describing it very well here"
        ) {
            Text("Custom content")
                .padding()
        }
        .padding()
    }
}
