import SwiftUI

struct UserItemView: View {
    
    var item: UserModel
    
    @EnvironmentObject var model: ReadingUserViewModel
    @State var isEditViewShowing = false
    @State var showDeleteAlert = false
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .bold()
                Text(item.email)
                    .foregroundColor(Color.black)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text(item.status ? "Active" : "Inactive")
                .font(.headline)
                .foregroundColor(item.status ? .green : .red)
            
            
            HStack {
                
                Button(action: {
                    isEditViewShowing = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "pencil")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                })
            }
            .sheet(isPresented: $isEditViewShowing) {
                EditUserView(isPresented: $isEditViewShowing, shouldShowHStack: true, item: item)
                    .onDisappear {
                        model.fetchUsers()
                    }
            }
            
            HStack {
                
                Button(action: {
                    showDeleteAlert = true
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "trash")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                })
            }
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Delete Item"),
                    message: Text("Are you sure you want to delete this item?"),
                    primaryButton: .destructive(Text("Yes")) {
                        deleteItem()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .padding()
    }
    
    func deleteItem(){
        print("delete")
    }
}

#Preview {
    UserItemView(item: UserModel(id: "345f534", name: "John Doe", email: "john@example.com", position: "Crew", status: true))
}
