import CoreData

extension GenreList {
    @NSManaged public var title: String
    @NSManaged public var books: [Book]
    
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<GenreList> {
        return NSFetchRequest<GenreList>(entityName: "GenreList")
    }
    
    static func createWith(title: String, using managedObjectContext: NSManagedObjectContext) {
        let genre = GenreList(context: managedObjectContext)
        genre.title = title
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Fetching return error -> \(error.localizedDescription)")
        }
    }
}

extension GenreList: Identifiable {}
