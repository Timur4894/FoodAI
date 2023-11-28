import SwiftUI

@main
struct foodAI: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}



struct LoadingView: View {
    @State private var isInitialLoading = true

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text("FoodAI")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .offset(y: -50)
                .opacity(isInitialLoading ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isInitialLoading = false
                            // После загрузки, переходите к ContentView
                            let contentView = ContentView()
                            
                            // После чего устанавливаем его как представление
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: contentView)
                        }
                    }
                }
        }
    }
}
