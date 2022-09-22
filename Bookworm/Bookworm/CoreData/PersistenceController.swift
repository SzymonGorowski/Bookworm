import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        for _ in 0..<10 {
            let genre = GenreList(context: controller.container.viewContext)
            genre.title = "Example"
            let book = Book(context: controller.container.viewContext)
            book.title = "Book title"
            book.author = "Book author"
            book.rating = 5
            book.notes = "Notes"
            book.genre = genre
        }
        return controller
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Bookworm")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error { fatalError("Error: \(error.localizedDescription)") }
        }
    }
    
    static func deleteBook(_ book: Book) throws {
        let taskContext = shared.container.viewContext
        taskContext.delete(book)
        try taskContext.save()
    }
    
    static func deleteList(_ list: GenreList) throws {
        let taskContext = shared.container.viewContext
        taskContext.delete(list)
        try taskContext.save()
    }
}
