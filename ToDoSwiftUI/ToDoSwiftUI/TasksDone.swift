import SwiftUI
import CoreData

struct TasksDone: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItems.createdAt, ascending: false)],
                  predicate: NSPredicate(format: "taskDone = %d", true))
    
    var fetchedItems: FetchedResults<ToDoItems>
    
    var body: some View {
        List {
            ForEach(fetchedItems, id: \.self) { item in
                ContentTaskDoneRow(item: item)
            }
            .onDelete(perform: removeItems)
            .frame(height: StyleConstant.rowHeight)
        }
        .navigationBarTitle(Text("Task done"))
        .listStyle(GroupedListStyle())
        .navigationBarItems(trailing: EditButton())
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let item = fetchedItems[index]
            managedObjectContext.delete(item)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentTaskDoneRow: View{
    var item: ToDoItems
    
    var body: some View {
        HStack {
            Text(item.taskTitle ?? "Default")
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .imageScale(.large)
                .foregroundColor(.blue)
        }
    }
}

struct TasksDone_Previews: PreviewProvider {
    static var previews: some View {
        TasksDone()
    }
}
