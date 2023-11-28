import SwiftUI



struct SecondView: View {
    @State private var selectedTabIndex = 0
    @State private var selectedSquare: String = ""
    @State private var selectedSquare2: String = ""
    @State private var selectedSquare3: String = ""

    // Массив текстов для квадратов
    let squareTexts = ["Завтрак", "Обед", "Ужин", "Десерт"]
    
    let squareTexts2 = ["Легко", "Нормально", "Сложно"]
    
    let squareTexts3 = ["Холодное", "Горячее"]
    
    
    @State private var isButtonEnabled = false
    
    @State private var isSquareSelected: [Bool] = Array(repeating: false, count: 5)
    @State private var isSquare2Selected: [Bool] = Array(repeating: false, count: 3)
    @State private var isSquare3Selected: [Bool] = Array(repeating: false, count: 2)

    

    @Binding var selectedButtons: SelectedButtons
    @State private var isAnimating = true
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)) // Устанавливаем цвет фона
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    

                    Text("Что будем готовить?")
                        .font(.system(size: 25)) // Регулируйте размер и жирность шрифта здесь
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                        .padding(.top, 10)
                        .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                            .opacity(0.9)
                    
                    TabView {
                        ForEach(0..<4) { index in
                            ZStack {
                                Image("image\(index + 1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 310, height: 130)
                                    .cornerRadius(10)
                                if !isSquareSelected[index] {
                                    Color.red
                                        .opacity(0.3)
                                        .frame(width: 310, height: 130)
                                    .cornerRadius(10)}
                                else{
                                    Color.green
                                        .opacity(0.3)
                                        .frame(width: 310, height: 130)
                                    .cornerRadius(10)}
                                    
                                
                                
                                
                                
                                Text(squareTexts[index])
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .multilineTextAlignment(.center)
                            }
                            .onTapGesture {
                                // Сбрасываем выбор других квадратов в этом ряду
                                isSquareSelected = Array(repeating: false, count: 5)
                                selectedSquare = squareTexts[index]
                                checkButtonEnabled()
                                withAnimation {
                                    isSquareSelected[index] = true
                                }
                            }
                         
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(maxWidth: .infinity, maxHeight: 170)
                    .padding(.top, -20)
                    .onAppear {
                        selectedTabIndex = 0
                    }
                    Divider()
                        .frame(height: 1)
                        .background(Color.black)
                        .frame(width: 350)
                        .padding(.vertical, 5)
                    
                    Text("Выберете сложность")
                        .font(.system(size: 25)) // Регулируйте размер и жирность шрифта здесь
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                        .padding(.top, 10)
                        .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                            .opacity(0.9)
                    
                    TabView {
                        ForEach(0..<3) { index in
                            ZStack {
                                Image("imageee\(index + 1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 310, height: 130)
                                    .cornerRadius(10)
                                if !isSquare2Selected[index] {
                                    Color.red
                                        .opacity(0.3)
                                        .frame(width: 310, height: 130)
                                    .cornerRadius(10)}
                                else{
                                    Color.green
                                        .opacity(0.3)
                                        .frame(width: 310, height: 130)
                                    .cornerRadius(10)}
                                
                                
                                
                                Text(squareTexts2[index])
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .multilineTextAlignment(.center)
                            }
                            .onTapGesture {
                                // Сбрасываем выбор других квадратов в этом ряду
                                isSquare2Selected = Array(repeating: false, count: 3)
                                selectedSquare2 = squareTexts2[index]
                                checkButtonEnabled()
                                withAnimation {
                                    isSquare2Selected[index] = true
                                }
                            }
                         
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(maxWidth: .infinity, maxHeight: 170)
                    .padding(.top, -20)
                    .onAppear {
                        selectedTabIndex = 0
                    }
                    Divider()
                        .frame(height: 1)
                        .background(Color.black)
                        .frame(width: 350)
                        .padding(.vertical, 5)
                    
                    Text("Выберете температуру")
                        .font(.system(size: 25)) // Регулируйте размер и жирность шрифта здесь
                        .multilineTextAlignment(.center)
                        .padding(.bottom, -7)
                        .padding(.top, 10)
                        .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                            .opacity(0.9) // Настройте уровень прозрачности (от 0.0 до 1.0)
                   
                    
                    TabView {
                        ForEach(0..<2) { index in
                            ZStack {
                                Image("imagee\(index + 1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 310, height: 130)
                                    .cornerRadius(10)
                                    
                                if !isSquare3Selected[index] {
                                    Color.red
                                        .opacity(0.3)
                                        .frame(width: 310, height: 130)
                                        .transition(.opacity)
                                    .cornerRadius(10)}
                                else{
                                    Color.green
                                        .opacity(0.3)
                                        .frame(width: 310, height: 130)
                                    .cornerRadius(10)}
                                
                                
                                
                                Text(squareTexts3[index])
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .multilineTextAlignment(.center)
                            }
                            .onTapGesture {
                                isSquare3Selected = Array(repeating: false, count: 2)
                                selectedSquare3 = squareTexts3[index]
                                checkButtonEnabled()
                                withAnimation {
                                    isSquare3Selected[index] = true
                                }
                            }
                           
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(maxWidth: .infinity, maxHeight: 170)
             
                    .onAppear {
                        selectedTabIndex = 0
                    }
                    
                    NavigationLink(
                        destination: ThirdView(selectedButtons: $selectedButtons, selectedSquare: $selectedSquare, selectedSquare2: $selectedSquare2, selectedSquare3: $selectedSquare3),
                        label: {
                            Text("Сгенерировать рецепт")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .frame(maxWidth: 280)
                                .padding(.horizontal, 20)
                                .background(isButtonEnabled ? Color(#colorLiteral(red: 0.545098066329956, green: 0.2705882489681244, blue: 0.07058823853731155, alpha: 1)) : Color.brown)
                                .cornerRadius(10)
                                .padding(.top, 10)
                                .font(.system(size: 20, weight: .bold))
                        }
                    )
                    .disabled(!isButtonEnabled)
                    .navigationBarItems(leading: NavigationLink(destination: ContentView()) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Назад")
                        }
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                    })
                    Text("Для выбора нажмите на прямоугольник*")
                        .font(.system(size: 10))
                    
                }
                .preferredColorScheme(.light) // Гарантия светлой темы
                .background(
                    EmojisFlyingView(isActive: $isAnimating)
                )
            }

        }
        .navigationBarBackButtonHidden(true)
    }
    
        private func checkButtonEnabled() {
            isButtonEnabled = !selectedSquare.isEmpty && !selectedSquare2.isEmpty && !selectedSquare3.isEmpty
        }
}
    



struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(selectedButtons: .constant(SelectedButtons(button1: false, button2: false, button3: false, button4: false, button5: false, button6: false)))
    }
}

