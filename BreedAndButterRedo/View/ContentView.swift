//
//  ContentView.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    @State var arrayOfUsers = [User]()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(users) { user in
                    NavigationLink{
                        SecondView(users: user)
                    } label: {
                        Text(user.wrappedName)
                    }
                   
                }
                .onDelete(perform: removeRow)
            }
            .task{
                if arrayOfUsers.isEmpty {
                    if let data = await loadUsers(){
                        arrayOfUsers = data
                    }
                }
                await MainActor.run {
                    for i in arrayOfUsers {
                        let newU = CachedUser(context: moc)
                        newU.name = i.name
                        newU.address = i.address
                        newU.id = i.id
                        newU.registered = i.registered
                        newU.about = i.about
                        newU.company = i.company
                        
                        for f in i.friends {
                            let newF = CachedFriends(context: moc)
                            newF.name = f.name
                            newF.id = f.id
                            
                            
                            if moc.hasChanges {
                                try? moc.save()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Breed&Butter")
            .toolbar{
                Button{
                    removeAll()
                } label: {
                     Image(systemName: "trash")
                }
            }
        }
    }
    
    func removeRow(offset: IndexSet){
        for i in offset {
            let index = users[i]
            moc.delete(index)
            if moc.hasChanges{
                try? moc.save()
            }
        }
    }
    
    func removeAll() {
        for i in users {
            moc.delete(i)
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
    
    func loadUsers() async -> [User]? {
         let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
         let urlRequest = URLRequest(url: url!)
        
        if let (data, _) = try? await URLSession.shared.data(for: urlRequest) {
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode([User].self, from: data)
                return decodedData
            } catch {
                print("Failed to decode data from \(data)")
            }
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
