import SwiftUI

struct ExperienceView: View {
    @State private var fetchError: NickelghostAPI.Error?
    @State private var isLoading = true
    @State private var workplaces = [Workplace]() {
        didSet { isLoading = false }
    }
    
    func fetchWorkplaces() async {
        do {
            workplaces = try await NickelghostAPI.getWorkplaces()
        } catch {
            fetchError = error as? NickelghostAPI.Error
        }
    }
    
    var body: some View {
        WrapperView {
            if isLoading {
                ProgressView()
            }
            CardList {
                ForEach(workplaces, id: \.priority) { workplace in
                    Card(
                        heading: workplace.title+" @ "+workplace.companyName,
                        technologies: workplace.technologies,
                        description: workplace.description
                    ) {
                        HStack {
                            Image(systemName: "calendar")
                                .imageScale(.large)
                            Text(workplace.startDate+" - "+workplace.endDate)
                                .font(.custom("Poppins-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
                        }
                        .padding()
                    }
                }
            }
        }
        .modifier(Page(name: "Experience"))
        .task { await fetchWorkplaces() }
        .alert(isPresented: .constant(fetchError != nil), error: fetchError) { }
    }
}

#Preview {
    CustomNavigationStack {
        ExperienceView()
    }
}
