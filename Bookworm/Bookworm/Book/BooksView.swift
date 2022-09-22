import SwiftUI

struct BooksView: View {
    @State private var isShowingCreatingView = false
    @State private var activeSortIndex = 0
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    var books: FetchedResults<Book>
    
    let sortDescriptorsType = [
        (name: Strings.BooksView.Title.sortDescriptor, descriptors: [SortDescriptor(\Book.title, order: .forward)]),
        (name: Strings.BooksView.Author.sortDescriptor, descriptors: [SortDescriptor(\Book.author, order: .forward)]),
        (name: Strings.BooksView.Rating.sortDescriptor, descriptors: [SortDescriptor(\Book.rating, order: .reverse)])
    ]
    
    let genreList: GenreList
    
    var body: some View {
        VStack {
            List {
                mainContent
            }
            addBookButton
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) { sortMenu }
        }
        .navigationTitle(Strings.BooksView.Navigation.title(genreList.title))
        .sheet(isPresented: $isShowingCreatingView) { CreateBookView(genreList: self.genreList) }
        .onChange(of: activeSortIndex) { _ in
            books.sortDescriptors = sortDescriptorsType[activeSortIndex].descriptors
        }
    }
}

private extension BooksView {
    private var mainContent: some View {
        Section {
            ForEach(books.filter { $0.genre.title == genreList.title }, id: \.self) { book in
                NavigationLink {
                    BookDetailView(book: book)
                } label: {
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                        }
                        Spacer()
                        HStack {
                            Text("\(book.rating)")
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            .onDelete(perform: delete)
        }
    }
    
    private var addBookButton: some View {
        Button {
            print(genreList)
            isShowingCreatingView.toggle()
        } label: {
            HStack {
                Image(systemName: "plus")
                Text(Strings.BooksView.AddBookButton.title)
            }
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var sortMenu: some View {
        Menu {
            Picker(selection: $activeSortIndex) {
                ForEach(0..<sortDescriptorsType.count, id: \.self) { index in
                    let sortType = sortDescriptorsType[index]
                    Text(sortType.name)
                }
            } label: { }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle.fill")
        }
    }
    
    private func delete(at offset: IndexSet) {
        let book = offset.map { self.books[$0] }
        do {
            try PersistenceController.deleteBook(book[0])
        } catch {
            print("Error when deleting book -> \(error.localizedDescription)")
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        BooksView(genreList: GenreList(context: context))
    }
}
