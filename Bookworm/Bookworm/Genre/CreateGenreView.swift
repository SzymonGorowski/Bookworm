import SwiftUI

struct CreateGenreView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var titleText = ""
    
    var body: some View {
        NavigationView {
            mainContent
        }
    }
}

private extension CreateGenreView {
    private var mainContent: some View {
        VStack(alignment: .leading) {
            Text(Strings.CreateGenreView.Genre.title)
                .font(.subheadline)
            TextField(Strings.CreateGenreView.TextField.placeholder, text: $titleText)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .navigationTitle(Strings.CreateGenreView.Navigation.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { closeButton }
            ToolbarItem(placement: .navigationBarTrailing) { addGenreButton }
        }
    }
    
    private var closeButton: some View {
        Button {
            dismiss()
        } label: {
            Text(Strings.CreateGenreView.CloseButton.title)
        }
    }
    
    private var addGenreButton: some View {
        Button {
            GenreList.createWith(title: titleText, using: viewContext)
            dismiss()
        } label: {
            Text(Strings.CreateGenreView.AddButton.title)
        }
        .disabled(self.titleText.isEmpty)
    }
}

struct CreateGenreView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGenreView()
    }
}
