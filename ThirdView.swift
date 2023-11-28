import SwiftUI


import OpenAISwift


struct ThirdView: View {
    @State private var emojis: [String] = ["🍔", "🥓", "🍌", "🌶️", "🥞", "🥗", "🍳", "🧆", "🥘", "🌮", "🌯", "🍕", "🍖", "🧀", "🥐", "🥕", "🍝", "🥟", "🍜"]
    @State private var emojiPositions: [CGPoint] = Array(repeating: .zero, count: 19)
    @State private var isAnimationCompleted = false

    @Binding var selectedButtons: SelectedButtons
    @Binding var selectedSquare: String
    @Binding var selectedSquare2: String
    @Binding var selectedSquare3: String
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)

                VStack {
                    Text("FoodAI")
                        .font(.system(size: 67, weight: .bold))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, -350)
                }

                ForEach(0..<emojis.count, id: \.self) { index in
                    Text(emojis[index])
                        .font(.system(size: 50))
                        .position(emojiPositions[index])
                        .rotationEffect(.degrees(Double.random(in: 0...360)))
                }

                Text("Ищем рецепт")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 20)
 
            }



            .onAppear {
                withAnimation(Animation.linear(duration: 4.0)) {
                    for index in 0..<emojis.count {
                        emojiPositions[index] = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                            y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    isAnimationCompleted = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(
            NavigationLink(
                destination: ForthView(selectedButtons: $selectedButtons, selectedSquare: $selectedSquare,selectedSquare2: $selectedSquare2, selectedSquare3: $selectedSquare3), // Передаем выбранные кнопки
                isActive: $isAnimationCompleted
            ) {
                EmptyView()
            }
        )
    }
}


struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedButtons = Binding.constant(SelectedButtons(button1: false, button2: false, button3: false, button4: false, button5: false, button6: false))
        let selectedSquare = Binding.constant("Ужин")
        let selectedSquare2 = Binding.constant("Сложно")
        let selectedSquare3 = Binding.constant("Горячее")
        
        return ThirdView(selectedButtons: selectedButtons, selectedSquare: selectedSquare, selectedSquare2: selectedSquare2, selectedSquare3: selectedSquare3)
    }
}

