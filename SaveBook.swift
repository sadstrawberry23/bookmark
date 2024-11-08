import SwiftUI

struct Bookmark {
    var title: String
    var link: String
}

struct SaveBook: View {
    @State private var showSheet = false
    @State private var bookmarkTitle: String = ""
    @State private var bookmarkLink: String = ""
    @State private var bookmarks: [Bookmark] = [] //for save
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(bookmarks, id: \.title) { bookmark in
                        HStack {
                            VStack(alignment: .leading){
                                Text(bookmark.title)
                                    .font(.headline)
                                Text(bookmark.link)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .onTapGesture {
                                        openBookmarkLink(bookmark.link)
                                    }
                            }
                            Spacer()
                            Image(systemName: "arrow.up.forward.app")
                        }
                        .padding()
                    }
                    .onDelete(perform: deleteItem)
                }

                Spacer()
                
                Button (action:{
                    showSheet = true
                }) {
                    ZStack {
                        Rectangle()
                            .cornerRadius(16)
                            .frame(width: 358, height: 58)
                            .foregroundColor(.black)
                        Text("Add bookmark")
                            .foregroundColor(.white)
                    }
                }
                .sheet(isPresented: $showSheet) {
                    VStack(spacing: 20) {
                            Text ("Change")
                        .font(.title)
                        
                            TextField("Bookmark title", text: $bookmarkTitle)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                                .padding(.top, 10)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                            
                            TextField("Bookmark link", text: $bookmarkLink)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                                .padding(.top, 10)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        
                        Button("Save") {
                            let newBookmark = Bookmark(title: bookmarkTitle, link: bookmarkLink)
                            bookmarkTitle = ""
                            bookmarkLink = ""
                            showSheet = false
                            bookmarks.append(newBookmark)
                            print("Save bookmark: Title = \(bookmarkTitle), Link = \(bookmarkLink)")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.top, 20)
                        
                        
                        Button("Cancel") {
                            showSheet = false
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.top, 10)
                        }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(16)
                    .padding()
                }
            }
            .navigationBarTitle("List", displayMode: .inline)
        }
        .navigationBarBackButtonHidden(true)
    }
    private func openBookmarkLink (_ link: String) {
        guard let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url)
    }
    private func deleteItem(at offsets: IndexSet) {
        bookmarks.remove(atOffsets: offsets)
    }
}



#Preview {
    SaveBook()
}
