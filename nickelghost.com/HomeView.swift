import SwiftUI

struct HomeView: View {
    @State private var fetchError: NickelghostAPI.Error?
    @State private var isLoading = true
    @State private var homePage: HomePage? {
        didSet {
            isLoading = false
        }
    }
    
    func fetchHomepage() async {
        do {
            homePage = try await NickelghostAPI.getHomepage()
        } catch {
            fetchError = error as? NickelghostAPI.Error
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if isLoading {
                ProgressView()
            }
            
            if let homePage = homePage {
                Text(homePage.heading)
                    .font(.custom("Poppins-SemiBold", size: UIFont.preferredFont(forTextStyle: .title1).pointSize))
                
                HomeTextView(homePage: homePage)
                    .font(.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("nickelghost.com")
        .task { await fetchHomepage() }
        .alert(isPresented: .constant(fetchError != nil), error: fetchError) { }
        .toolbar { HomeMenu.body }
    }
}

#Preview {
    CustomNavigationStack {
        WrapperView {
            HomeView()
        }
    }
}
