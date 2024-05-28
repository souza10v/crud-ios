import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    @State private var itemToDelete: String?

    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item)
                        Spacer()
                        Button(action: {
                            itemToDelete = item
                            showAlert = true
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Delete Item"),
                message: Text("Are you sure you want to delete this item?"),
                primaryButton: .destructive(Text("Yes")) {
                    if let item = itemToDelete {
                        deleteItem(item)
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }

    private func deleteItem(_ item: String) {
        items.removeAll { $0 == item }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
