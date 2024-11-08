import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("mark")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                WelcomeText()
                
            }
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        VStack(spacing: 30){
            Spacer()
            Text("Save all interesting links in one app")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            NavigationLink(destination: SaveBook()){
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .frame(width: 358, height: 58)
                        .foregroundColor(.white)
                        
                    Text("Let's start collecting")
                        .foregroundColor(.black)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
