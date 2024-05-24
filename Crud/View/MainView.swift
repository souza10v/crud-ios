//
//  ContentView.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
              
        NavigationView {
            
            VStack {
                
                Text("Control Panel")
                
                HStack {
                    
                    NavigationLink {
                        CreateUserView(isPresented: .constant(false), shouldShowHStack: false)
                    } label: {
                        Text("Create")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .controlSize(.large)
                    .frame(width: 100, height: 50)
                    

                    
                    NavigationLink {
                        ListUserView()
                    } label: {
                        Text("Read")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .controlSize(.large)
                    .frame(width: 100, height: 50)

                    
                    
                }
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Update")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .controlSize(.large)
                    .frame(width: 100, height: 50)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Delete")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .controlSize(.large)
                    .frame(width: 100, height: 50)
                }
            
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
