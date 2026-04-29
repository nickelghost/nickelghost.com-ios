import SwiftUI

struct ProjectsView: View {
    @State private var fetchError: NickelghostAPI.Error?
    @State private var isLoading = true
    @State private var projects = [Project]()

    func fetchProjects() async {
        do {
            projects = try await NickelghostAPI.getProjects()
        } catch {
            fetchError = error as? NickelghostAPI.Error
        }
        isLoading = false
    }

    var body: some View {
        WrapperView {
            if isLoading {
                ProgressView()
            } else {
                CardList {
                    ForEach(projects, id: \.priority) { project in
                        Card(
                            heading: project.name,
                            imageUrl: project.image?.src,
                            imageAlt: project.imageAlt,
                            technologies: project.technologies,
                            description: project.description
                        ) {
                            CardLinks(project.links)
                        }
                    }
                }
            }
        }
        .modifier(Page(name: "Projects"))
        .task { await fetchProjects() }
        .alert(isPresented: .constant(fetchError != nil), error: fetchError) { }
    }
}

#Preview {
    CustomNavigationStack {
        ProjectsView()
    }
}
