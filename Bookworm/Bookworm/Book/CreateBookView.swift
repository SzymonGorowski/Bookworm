import SwiftUI

struct CreateBookView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var titleText = ""
    @State private var authorText = ""
    @State private var rating: Float = 5
    @State private var notes = ""
    
    let genreList: GenreList
    
    var body: some View {
        NavigationView {
            Form {
                titleAndAuthorSection
                ratingSection
                notesSection
            }
            .navigationTitle(Strings.CreateBookView.Navigation.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { addBookButton }
                ToolbarItem(placement: .navigationBarLeading) { closeButton }
            }
        }
    }
}

private extension CreateBookView {
    private var titleAndAuthorSection: some View {
        Section {
            TextField(Strings.CreateBookView.TitleTextField.placeholder, text: $titleText)
            TextField(Strings.CreateBookView.AuthorTextField.placeholder, text: $authorText)
        }
    }
    
    private var ratingSection: some View {
        Section {
            HStack {
                Text(Strings.CreateBookView.RatingSlider.title((Int(rating))))
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Slider(value: $rating, in: 1...10, step: 1) {
                Text("Slider")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("10")
            }
        }
    }
    
    private var notesSection: some View {
        Section(Strings.CreateBookView.NotesSection.title) {
            TextEditor(text: $notes)
        }
    }
    
    private var addBookButton: some View {
        Button {
            Book.createWith(title: self.titleText,
                            author: self.authorText,
                            rating: Int16(self.rating),
                            notes: self.notes,
                            in: self.genreList,
                            using: self.viewContext)
            dismiss()
        } label: {
            Text(Strings.CreateBookView.AddButton.title)
        }
        .disabled(titleText.isEmpty || authorText.isEmpty)
    }
    
    private var closeButton: some View {
        Button {
            dismiss()
        } label: {
            Text(Strings.CreateBookView.CloseButton.title)
        }
    }
}

struct CreateBookView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        CreateBookView(genreList: GenreList(context: context))
    }
}
