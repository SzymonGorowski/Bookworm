import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GenreListView()
                .navigationTitle(Strings.ContentView.Navigation.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
