import SwiftUI

struct HomeMenu {
    static var body: some ToolbarContent {
        ToolbarItem {
            Menu {
                NavigationLink {
                    ProjectsView()
                } label: {
                    Text("Projects")
                }

                NavigationLink {
                    ExperienceView()
                } label: {
                    Text("Experience")
                }
                
                Link("GitHub", destination: URL(string: "https://github.com/nickelghost")!)
            } label: {
                Label("Menu", systemImage: "book.pages")
            }
        }
    }
}
