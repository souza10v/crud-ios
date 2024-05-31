import SwiftUI

struct EditUserView: View {
    
    @Binding var isPresented: Bool
    @State var shouldShowHStack: Bool

    var item: UserModel
    
    @StateObject private var viewModel = EditingUserViewModel()
    
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userPosition: String = ""
    @State var status: Bool = false
    @State var message: String = ""
    @State var selectedUserStatus = true
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            
            
            Section(header: Text("")) {
                TextField("Username", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $userEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                TextField("Function", text: $userPosition)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker("", selection: $selectedUserStatus) {
                    Text("Active").tag(true)
                    Text("Inactive").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Text(message)
                .foregroundColor(message.contains("failed") ? .red : .blue)
                .padding(.top, 10.0)
            
            Button(action: {
                if validate() {
                    viewModel.updateUser(userID: item.id, userName: userName, userEmail: userEmail, userPosition: userPosition, userStatus: selectedUserStatus)
                    
                    userName = ""
                    userEmail = ""
                    userPosition = ""
                    
                    message = "Updated"
                    isPresented = false
                    
                }
            }, label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .controlSize(.large)
            .frame(width: 100, height: 50)
            .padding(.top, 20.0)
            
        }
        .padding(30)
        .onAppear {
            userName = item.name
            userEmail = item.email
            userPosition = item.position ?? ""
            selectedUserStatus = item.status
        }
        
        Spacer()
    }
    
    func validate() -> Bool {
        if userName.isEmpty || userEmail.isEmpty || userPosition.isEmpty {
            message = "Please complete all fields."
            return false
        } else {
            message = ""
            return true
        }
    }

}

#Preview {
    EditUserView(isPresented: .constant(true), shouldShowHStack: true, item: UserModel(id: "345f534", name: "John Doe", email: "john@example.com", position: "Crew", status: false))
}
