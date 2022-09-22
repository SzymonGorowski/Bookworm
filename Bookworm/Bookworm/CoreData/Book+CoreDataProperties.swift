import CoreData

extension Book {
    @NSManaged public var title: String
    @NSManaged public var author: String
    @NSManaged public var rating: Int16
    @NSManaged public var notes: String?
    @NSManaged public var genre: GenreList
    
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }
    
    static func createWith(
        title: String,
        author: String,
        rating: Int16,
        notes: String?,
        in genre: GenreList,
        using managedObjectContext: NSManagedObjectContext
    ) {
        let book = Book(context: managedObjectContext)
        book.title = title
        book.author = author
        book.rating = rating
        book.notes = notes
        book.genre = genre
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Failed to create book object with error -> \(error.localizedDescription)")
        }
    }
}

extension Book: Identifiable { }
