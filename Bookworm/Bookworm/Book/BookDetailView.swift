import SwiftUI

struct BookDetailView: View {
    let book: Book
    
    var body: some View {
        Form {
            createSectionWith(title: Strings.BookDetailView.TitleSection.title, text: book.title)
            createSectionWith(title: Strings.BookDetailView.AuthorSection.title, text: book.author)
            createSectionWith(title: Strings.BookDetailView.GenreSection.title, text: book.genre.title)
            createSectionWith(title: Strings.BookDetailView.NotesSection.title, text: book.notes ?? "")
            ratingSection
        }
    }
}

private extension BookDetailView {
    private func createSectionWith(title: String, text: String) -> some View {
        Section(title) {
            Text(text)
        }
    }
    
    private var ratingSection: some View {
        HStack {
            Text(Strings.BookDetailView.RatingSection.title(book.rating))
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        BookDetailView(book: Book(context: context))
    }
}
