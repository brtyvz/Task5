import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @Environment(\.presentationMode) var presentationMode

    let tabs: [Tab] = [
        .init( title: "Music"),
        .init( title: "Movies"),
        .init( title: "Books")
    ]

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }

    var body: some View {
           NavigationView {
               GeometryReader { geo in
                   VStack(spacing: 0) {
                       // Tabs
                       Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)

                       // Views
                       TabView(selection: $selectedTab,
                               content: {
                                   PlaylistsView()
                                       .tag(0)
                                   SongsView()
                                       .tag(1)
                                   SoundsView()
                                       .tag(2)
                               })
                               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                   }
                   .foregroundColor(Color.white)
                   .navigationBarTitleDisplayMode(.inline)
                   .navigationTitle("TabsSwiftUIExample")
                   .ignoresSafeArea()
                   .navigationBarItems(leading: MyBackButton())
               }
           }
       }
}


struct MyBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.title)
                    .foregroundColor(.white)
                Text("Back")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
