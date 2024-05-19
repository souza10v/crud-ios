import SwiftUI

struct UserItemView: View {
    
    var item: UserModel
    
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
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.blue)
                        .frame(width: 30, height: 30)
                    
                    Image(systemName: "pencil")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                
                Image(systemName: "trash")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            
        }
        .padding()
    }
}

#Preview {
    UserItemView(item: UserModel(name: "John Doe", email: "john@example.com", status: true))
}
