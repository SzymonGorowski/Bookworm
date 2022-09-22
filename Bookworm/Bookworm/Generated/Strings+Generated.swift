// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  public enum BookDetailView {
    public enum AuthorSection {
      /// Author
      public static let title = Strings.tr("Localizable", "BookDetailView.AuthorSection.Title", fallback: "Author")
    }
    public enum GenreSection {
      /// Genre
      public static let title = Strings.tr("Localizable", "BookDetailView.GenreSection.Title", fallback: "Genre")
    }
    public enum NotesSection {
      /// Notes
      public static let title = Strings.tr("Localizable", "BookDetailView.NotesSection.Title", fallback: "Notes")
    }
    public enum RatingSection {
      /// Rating: %@
      public static func title(_ p1: Any) -> String {
        return Strings.tr("Localizable", "BookDetailView.RatingSection.Title", String(describing: p1), fallback: "Rating: %@")
      }
    }
    public enum TitleSection {
      /// Title
      public static let title = Strings.tr("Localizable", "BookDetailView.TitleSection.Title", fallback: "Title")
    }
  }
  public enum BooksView {
    public enum AddBookButton {
      /// Add a book
      public static let title = Strings.tr("Localizable", "BooksView.AddBookButton.Title", fallback: "Add a book")
    }
    public enum Author {
      /// Author
      public static let sortDescriptor = Strings.tr("Localizable", "BooksView.Author.SortDescriptor", fallback: "Author")
    }
    public enum Navigation {
      /// %@ books
      public static func title(_ p1: Any) -> String {
        return Strings.tr("Localizable", "BooksView.Navigation.Title", String(describing: p1), fallback: "%@ books")
      }
    }
    public enum Rating {
      /// Rating
      public static let sortDescriptor = Strings.tr("Localizable", "BooksView.Rating.SortDescriptor", fallback: "Rating")
    }
    public enum Title {
      /// Title
      public static let sortDescriptor = Strings.tr("Localizable", "BooksView.Title.SortDescriptor", fallback: "Title")
    }
  }
  public enum ContentView {
    public enum Navigation {
      /// Bookworm
      public static let title = Strings.tr("Localizable", "ContentView.Navigation.Title", fallback: "Bookworm")
    }
  }
  public enum CreateBookView {
    public enum AddButton {
      /// Add
      public static let title = Strings.tr("Localizable", "CreateBookView.AddButton.Title", fallback: "Add")
    }
    public enum AuthorTextField {
      /// Enter an author
      public static let placeholder = Strings.tr("Localizable", "CreateBookView.AuthorTextField.Placeholder", fallback: "Enter an author")
    }
    public enum CloseButton {
      /// Close
      public static let title = Strings.tr("Localizable", "CreateBookView.CloseButton.Title", fallback: "Close")
    }
    public enum Navigation {
      /// Create a book
      public static let title = Strings.tr("Localizable", "CreateBookView.Navigation.Title", fallback: "Create a book")
    }
    public enum NotesSection {
      /// Notes
      public static let title = Strings.tr("Localizable", "CreateBookView.NotesSection.Title", fallback: "Notes")
    }
    public enum RatingSlider {
      /// Rating: %@
      public static func title(_ p1: Any) -> String {
        return Strings.tr("Localizable", "CreateBookView.RatingSlider.Title", String(describing: p1), fallback: "Rating: %@")
      }
    }
    public enum TitleTextField {
      /// Enter a title
      public static let placeholder = Strings.tr("Localizable", "CreateBookView.TitleTextField.Placeholder", fallback: "Enter a title")
    }
  }
  public enum CreateGenreView {
    public enum AddButton {
      /// Add
      public static let title = Strings.tr("Localizable", "CreateGenreView.AddButton.Title", fallback: "Add")
    }
    public enum CloseButton {
      /// Close
      public static let title = Strings.tr("Localizable", "CreateGenreView.CloseButton.Title", fallback: "Close")
    }
    public enum Genre {
      /// Genre title:
      public static let title = Strings.tr("Localizable", "CreateGenreView.Genre.Title", fallback: "Genre title:")
    }
    public enum Navigation {
      /// Create genre
      public static let title = Strings.tr("Localizable", "CreateGenreView.Navigation.Title", fallback: "Create genre")
    }
    public enum TextField {
      /// Enter a title
      public static let placeholder = Strings.tr("Localizable", "CreateGenreView.TextField.Placeholder", fallback: "Enter a title")
    }
  }
  public enum GenreList {
    public enum Section {
      /// Genre List:
      public static let title = Strings.tr("Localizable", "GenreList.Section.Title", fallback: "Genre List:")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
