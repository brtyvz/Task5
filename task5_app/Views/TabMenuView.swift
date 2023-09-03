import SwiftUI

struct Tab {
    var title: String
}

struct Tabs: View {
    var fixed = true
    var tabs: [Tab]
    var geoWidth: CGFloat = 100
    @Binding var selectedTab: Int
    @State private var selectedTabIndex = 0

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                    selectedTabIndex = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        Text(tabs[row].title)
                                            .font(Font.system(size: 18, weight: .semibold))
                                            .foregroundColor(Color.white)
                                            .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 32) //
                                    .background(
                                       
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(selectedTabIndex == row ? Color.gray : Color.clear)
                                    )
                                }.fixedSize()
                            })
                            .accentColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 40) 
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = UIColor.black
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(fixed: true,
             tabs: [.init( title: "Tab 1"),
                    .init( title: "Tab 2"),
                    .init( title: "Tab 3")],
             geoWidth: 375,
             selectedTab: .constant(0))
    }
}
