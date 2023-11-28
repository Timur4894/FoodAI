import SwiftUI


struct EmojisFlyingView: View {
    @Binding var isActive: Bool
    @State private var emojiData: [EmojiData] = []

    
    let emojis = ["🍔", "🥓", "🍌", "🌶️", "🥞", "🥗", "🍳", "🧆", "🥘", "🌮", "🌯", "🍕", "🍖", "🧀", "🥐", "🥕", "🍝", "🥟", "🍜"]

    struct EmojiData: Identifiable {
        let id: Int
        let emoji: String
        let position: CGPoint
        let rotation: Double
    }

    var body: some View {
        ZStack {
            if isActive {
                ForEach(emojiData) { data in
                    Text(data.emoji)
                        .font(.system(size: 30))
                        .position(data.position)
                        .rotationEffect(.degrees(data.rotation))
                }
            }
        }
        .onAppear {
            setupEmojis()
        }
    }

    private func setupEmojis() {
        for i in 0..<18 {
            let randomEmoji = emojis.randomElement() ?? "🍔"
            let position = randomEmojiPosition()
            let rotation = Double.random(in: 0...360)
            let data = EmojiData(id: i, emoji: randomEmoji, position: position, rotation: rotation)
            emojiData.append(data)
        }
    }

    private func randomEmojiPosition() -> CGPoint {
        return CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
    }
}



struct ContentView: View {
    @State private var isButton1Tapped = false
    @State private var isButton2Tapped = false
    @State private var isButton3Tapped = false
    @State private var isButton4Tapped = false
    @State private var isButton5Tapped = false
    @State private var isButton6Tapped = false

    @State private var isContinueButtonTapped = false
    @State private var isSecondViewActive = false
    
    @State private var selectedButtons = SelectedButtons(button1: false, button2: false, button3: false, button4: false, button5: false, button6: false)

    @StateObject private var chatData: ChatData = ChatData(selectedButtons: SelectedButtons(button1: false, button2: false, button3: false, button4: false, button5: false, button6: false))
    
    @State private var savedRecipe: Recipe?

    @State private var isAnimating = true


    
    

    var body: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1))
                    .opacity(1) // Настройте уровень прозрачности (от 0.0 до 1.0)
                    .ignoresSafeArea()

                
                
                VStack(spacing: 20) {
                    
                    
//                    Text("Food    ")
//                        .font(.custom("Helvetica Neue", size: 66)) // Замените шрифт и размер на подходящие
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                    
//                        .overlay(
//                            Text("     AI")
//                                .font(.custom("Helvetica Neue", size: 66)) // Замените шрифт и размер на подходящие
//                                .fontWeight(.bold)
//                                .foregroundColor(.green)
//                                .offset(x: 40) // Регулируйте значение, чтобы подогнать под ваши нужды
//                        )
//                        .padding(.bottom, 40)
                    
                    
                    
                    Text("Укажите доступные способы")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25, weight: .bold))
                            .padding(.bottom, -20)
                        
                        Text("приготовления")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25, weight: .bold))

                    Divider()
                        .frame(height: 1)
                        .background(Color.black)
                        .frame(width: 350)
                        .padding(.vertical, 5)
                    
                    Button("Все") {
                        if isButton1Tapped || isButton2Tapped || isButton3Tapped || isButton4Tapped || isButton5Tapped || isButton6Tapped {
                            // Сбросить все кнопки
                            isButton1Tapped = false
                            isButton2Tapped = false
                            isButton3Tapped = false
                            isButton4Tapped = false
                            isButton5Tapped = false
                            isButton6Tapped = false
                            
                            selectedButtons.button1 = false
                            selectedButtons.button2 = false
                            selectedButtons.button3 = false
                            selectedButtons.button4 = false
                            selectedButtons.button5 = false
                            selectedButtons.button6 = false
                        } else {
                            // Выбрать все кнопки
                            isButton1Tapped = true
                            isButton2Tapped = true
                            isButton3Tapped = true
                            isButton4Tapped = true
                            isButton5Tapped = true
                            isButton6Tapped = true
                            
                            selectedButtons.button1 = true
                            selectedButtons.button2 = true
                            selectedButtons.button3 = true
                            selectedButtons.button4 = true
                            selectedButtons.button5 = true
                            selectedButtons.button6 = true
                        }

                        updateContinueButtonState()
                    }
                    .buttonStyle(MyButtonStyle(isTapped: isButton1Tapped))
                    .font(.system(size: 20, weight: .bold))
                    .opacity(0.9)


                    
                    Button("Духовка") {
                        isButton2Tapped.toggle()
                        selectedButtons.button2.toggle()
                        updateContinueButtonState()
                    }
                    .buttonStyle(MyButtonStyle(isTapped: isButton2Tapped))
                    .font(.system(size: 20, weight: .bold)) //
                    .opacity(0.9)
                    
                    Button("Мультиварка") {
                        isButton3Tapped.toggle()
                        selectedButtons.button3.toggle()
                        updateContinueButtonState()
                    }
                    .buttonStyle(MyButtonStyle(isTapped: isButton3Tapped))
                    .font(.system(size: 20, weight: .bold)) //
                    .opacity(0.9)
                    
                    Button("Сковорода / Кастрюля") {
                        isButton4Tapped.toggle()
                        selectedButtons.button4.toggle()
                        updateContinueButtonState()
                    }
                    .buttonStyle(MyButtonStyle(isTapped: isButton4Tapped))
                    .font(.system(size: 20, weight: .bold)) //
                    .opacity(0.9)
                    
                    Button("Микроволновая печь") {
                        isButton5Tapped.toggle()
                        selectedButtons.button5.toggle()
                        updateContinueButtonState()
                    }
                    .buttonStyle(MyButtonStyle(isTapped: isButton5Tapped))
                    .font(.system(size: 20, weight: .bold)) //
                    .opacity(0.9)
                    
                    Button("Холодильник/морозильник") {
                        isButton6Tapped.toggle()
                        selectedButtons.button6.toggle()
                        updateContinueButtonState()
                    }
                    .buttonStyle(MyButtonStyle(isTapped: isButton6Tapped))
                    .font(.system(size: 20, weight: .bold)) //
                    .opacity(0.9)
                    .padding(.bottom, 20)
                    
                    Button("Продолжить") {
                        isSecondViewActive = true
                        
                    }
                    
                    .font(.system(size: 20, weight: .bold)) //
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isContinueButtonTapped ? Color(#colorLiteral(red: 0.545098066329956, green: 0.2705882489681244, blue: 0.07058823853731155, alpha: 1)) : Color.brown)

                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .disabled(!isContinueButtonTapped)
                    .background(
                        NavigationLink("", destination: SecondView(selectedButtons: $selectedButtons), isActive: $isSecondViewActive)
                            .opacity(0)
                    )
                    
                    
                }
                
                .background(      EmojisFlyingView(isActive: $isAnimating)
                )
                .preferredColorScheme(.light) // Гарантия светлой темы
                
            }
            
        }
        
       
        .navigationBarBackButtonHidden(true)
        
 
        
    }
    


        private func updateContinueButtonState() {
            isContinueButtonTapped = isButton1Tapped || isButton2Tapped || isButton3Tapped || isButton4Tapped || isButton5Tapped || isButton6Tapped
        }
    
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
    
}

struct MyButtonStyle: ButtonStyle {
    var isTapped: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(isTapped ? Color.green : Color.white)
            .foregroundColor(isTapped ? Color.white : Color.black)
            .cornerRadius(isTapped ? 10 : 10)
            
            .padding(.horizontal, 30)
            .scaleEffect(isTapped ? 1 : 1)
            .animation(.easeInOut(duration: 0.4))
            .onHover { isHovered in
                if isHovered {
                    // Действие при наведении курсора на кнопку
                }
            }
        
    }
    
    
}
