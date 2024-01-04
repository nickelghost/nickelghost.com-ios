import SwiftUI

struct HomeTextView: View {
    let homePage: HomePage
    
    var age: Int {
        let components = Calendar.current.dateComponents([.year], from: homePage.dateOfBirth, to: Date.now)

        return components.year ?? 0
    }
    
    var paragraph3Text: String {
        if homePage.isGingerFotoEnabled {
            return homePage.paragraph3[0]+" [\(homePage.paragraph3[1])](https://gingerfoto.com) "+homePage.paragraph3[2]
        } else {
            return homePage.paragraph3.joined(separator: " ")
        }
    }
    
    var body: some View {
        Text(homePage.paragraph1[0]+" iOS app.")
        
        Text(homePage.paragraph2[0]+" "+String(age)+" "+homePage.paragraph2[1])
        
        Text(.init(paragraph3Text))
            .tint(.customLink)
    }
}

#Preview {
    struct AsyncTestView: View {
        @State var homePage: HomePage?
        
        var body: some View {
            WrapperView {
                VStack(alignment: .leading, spacing: 12) {
                    if let homePage = homePage {
                        HomeTextView(homePage: homePage)
                    }
                }
                .padding()
                .task {
                    do {
                        homePage = try await NickelghostAPI.getHomepage()
                    } catch {
                        fatalError("could not fetch homepage")
                    }
                }
            }
        }
    }
    
    return AsyncTestView()
}
