import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItems.createdAt, ascending: false)],
                  predicate: NSPredicate(format: "taskDone = %d", false))
    
    var fetchedItems: FetchedResults<ToDoItems>
    
    @State var newTaskTitle = ""
    
    var body: some View {
        NavigationView{
            ContentToDoList(fetchedItems: fetchedItems,
                            managedObjectContext: managedObjectContext,
                            newTaskTitle: $newTaskTitle)
            .navigationBarTitle("To-Do List")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentToDoList: View{
    var fetchedItems: FetchedResults<ToDoItems>
    var managedObjectContext: NSManagedObjectContext
    
    @Binding var newTaskTitle: String
    
    var body: some View {
        List{
            ForEach(fetchedItems, id: \.self){ item in
                ContentToDoRow(item: item.taskTitle ?? "Empty")
            }
            .frame(height: StyleConstant.rowHeight)
            ContentAddTaskRow(managedObjectContext: managedObjectContext , newTaskTitle: $newTaskTitle)
            ContentTaskDoneRow()
        }
    }
}

struct ContentToDoRow: View {
    var item: String
    
    var body: some View{
        HStack{
            Text(item)
            Spacer()
            Button(action: {print("Task done.")}){
                ContentButton()
            }
        }
    }
}

struct ContentButton: View {
    var body: some View {
        Image(systemName: "circle")
        .imageScale(.large)
        .foregroundColor(.gray)
    }
}

struct ContentAddTaskRow: View{
    var managedObjectContext: NSManagedObjectContext
    
    @Binding var newTaskTitle: String
    
    var body: some View{
        HStack{
            TextField("Add task...",
                      text: $newTaskTitle,
                      onCommit: { print("New task title entered.") })
            Button(action: { self.saveTask() }){
                Image(systemName: "plus")
                    .imageScale(.large)
            }
        }
        .frame(height: StyleConstant.rowHeight)
    }
    
    func saveTask() {
        guard self.newTaskTitle != "" else {
            return
        }
        let newToDoItem = ToDoItems(context: self.managedObjectContext)
        
        newToDoItem.taskTitle = self.newTaskTitle
        newToDoItem.createdAt = Date()
        newToDoItem.taskDone = false
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
        self.newTaskTitle = ""
    }
}

struct ContentTaskDoneRow: View {
    var body: some View {
        Text("Tasks done")
            .frame(height: StyleConstant.rowHeight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return ContentView().environment(\.managedObjectContext, context)
    }
}
