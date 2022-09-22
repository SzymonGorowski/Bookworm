import SwiftUI

struct GenreListView: View {
    @State private var isShowingCreatingView = false
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)], animation: .default)
    var genreList: FetchedResults<GenreList>
    
    var body: some View {
        Form {
            genreSection
        }
        .sheet(isPresented: $isShowingCreatingView) { CreateGenreView() }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                addGenreButton
            }
        }
    }
}

private extension GenreListView {
    private var addGenreButton: some View {
        Button {
            isShowingCreatingView.toggle()
            print(genreList)
        } label: {
            Image(systemName: "plus")
        }
    }
    
    private var genreSection: some View {
        Section(Strings.GenreList.Section.title) {
            ForEach(genreList, id: \.self) { genre in
                NavigationLink {
                    BooksView(genreList: genre)
                } label: {
                    Text(genre.title)
                }
            }
            .onDelete(perform: delete)
        }
    }
    
    private func delete(at offset: IndexSet) {
        let genre = offset.map { self.genreList[$0] }
        do {
            try PersistenceController.deleteList(genre[0])
        } catch {
            print("Error when deleting genre list -> \(error.localizedDescription)")
        }
    }
}

struct GenreListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        return GenreListView().environment(\.managedObjectContext, context)
    }
}
