import SwiftUI

struct ForthView: View {
    @Binding var selectedButtons: SelectedButtons
    @Binding var selectedSquare: String
    @Binding var selectedSquare2: String
    @Binding var selectedSquare3: String
    @State private var chatResponse = ""
    @State private var isIngredientsSelected = true
    @State private var isAnimating = true
    @State private var recipe: Recipe?
    
    @State private var isFavorite = false
    
    @State private var showFoodEmojis = false
    
    @State private var savedRecipe: Recipe?

    
    let allBreakfasEasyCold: [Recipe] = [frittataRecipe,breadPuddingRecipe,bakedOmeletsRecipe,appleCrispRecipe,miniQuicheRecipe,chiaPuddingRecipe,fruitSaladMintRecipe,bananaOatMuffinsRecipe,mushroomCheeseOmeletRecipe,salmonHerbLemonRecipe,eggsVeggiesCheeseRecipe,buckwheatCucumberYogurtRecipe,tomatoMozzarellaToastRecipe,buckwheatYogurtFruitRecipe,spinachFetaQuicheRecipe,buckwheatCottageCheeseRecipe,pancakesRecipe,cottageCheesePieRecipe,buckwheatEggRecipe,salmonRollsRecipe,fruitSaladRecipe,buckwheatSaladRecipe,omeletRecipe,ricePuddingRecipe,oatmealRecipe,miniVegetableOmeletsRecipe,sweetRollsCottageCheeseFruitsRecipe,eggsSalmonAvocadoRecipe,oatmealBerriesHoneyRecipe,bulgurCucumberMintRecipe,appleCheesecakeRecipe,buckwheatChickenVeggiesRecipe,quicheRecipe,omeletteRecipe,scrambledEggsRecipe,buckwheatOmeletRecipe,vegetableOmeletRecipe,buckwheatYogurtRecipe,recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10,bananaHoneyToastRecipe,salmonOmeletRecipe,buckwheatWithJamRecipe,microwaveQuicheRecipe,microwaveOmeletRecipe,recipe11,recipe22,recipe33,recipe44,recipe55,recipe66,recipe77,recipe88,cottageCheeseFruitPureeRecipe,muesliYogurtBerriesRecipe,omeletVeggiesCheeseRecipe,avocadoSalmonToastRecipe,recipe100,recipe999,recipe888,recipe777,recipe555,recipe666,recipe444,recipe333,recipe222,recipe111]

    let DuhovkaBreakfasEasyCold: [Recipe] = [frittataRecipe,breadPuddingRecipe,bakedOmeletsRecipe,appleCrispRecipe,miniQuicheRecipe,chiaPuddingRecipe,fruitSaladMintRecipe,bananaOatMuffinsRecipe,mushroomCheeseOmeletRecipe,salmonHerbLemonRecipe,eggsVeggiesCheeseRecipe,buckwheatCucumberYogurtRecipe,tomatoMozzarellaToastRecipe,buckwheatYogurtFruitRecipe,spinachFetaQuicheRecipe]
    
    let MultiBreakfasEasyCold: [Recipe] = [buckwheatCottageCheeseRecipe,pancakesRecipe,cottageCheesePieRecipe,buckwheatEggRecipe,salmonRollsRecipe,fruitSaladRecipe,buckwheatSaladRecipe,omeletRecipe,ricePuddingRecipe,oatmealRecipe,miniVegetableOmeletsRecipe,sweetRollsCottageCheeseFruitsRecipe,eggsSalmonAvocadoRecipe,oatmealBerriesHoneyRecipe,bulgurCucumberMintRecipe,appleCheesecakeRecipe,buckwheatChickenVeggiesRecipe,quicheRecipe,omeletteRecipe]
    
    let SkovorodaBreakfasEasyCold: [Recipe] = [scrambledEggsRecipe,buckwheatOmeletRecipe,vegetableOmeletRecipe,buckwheatYogurtRecipe,recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10]
    
    let MivrowaveBreakfasEasyCold: [Recipe] = [bananaHoneyToastRecipe,salmonOmeletRecipe,buckwheatWithJamRecipe,microwaveQuicheRecipe,microwaveOmeletRecipe,recipe11,recipe22,recipe33,recipe44,recipe55,recipe66,recipe77,recipe88]
    
    let HolodBreakfasEasyCold: [Recipe] = [cottageCheeseFruitPureeRecipe,muesliYogurtBerriesRecipe,omeletVeggiesCheeseRecipe,avocadoSalmonToastRecipe,recipe100,recipe999,recipe888,recipe777,recipe555,recipe666,recipe444,recipe333,recipe222,recipe111]
    
    //-------//
    
    let allBreakfasEasyHot: [Recipe] = [recipeforhot,recipeforhot1,recipeforhot2,recipeforhot3,recipeforhot4,recipeforhot5,recipeforhot6,recipeforhot7,recipeforhot8,recipeforhot9,recipeforhot10,recipeforhot11,recipeforhot12,recipeforhot13,recipeforhot14,recipeforhot15,recipeforhot16,recipeforhot17,recipeforhot18,recipeforhot19,recipe21,recipe2222,recipe23,recipe24,recipe25,recipe26,recipe27,recipe28,recipe29,recipe30,recipe31,recipe32,recipe3333,recipe34,recipe35,recipe36,recipe37,recipe38,recipe39,recipe40,recipe41,recipe42,recipe43,recipe4444,recipe45,recipe46,recipe47,recipe48,recipe49,recipe50,recipe51,recipe52,recipe53,recipe54,recipe5555,recipe56,recipe57,recipe58,recipe59,recipe60,recipeforhot,recipeforhot1,recipeforhot2,recipeforhot3,recipeforhot4,recipeforhot5,recipeforhot6,recipeforhot7,recipeforhot8,recipeforhot9,recipeforhot10,recipeforhot11,recipeforhot12,recipeforhot13,recipeforhot14,recipeforhot15,recipeforhot16,recipeforhot17,recipeforhot18,recipeforhot19,recipe21,recipe2222,recipe23,recipe24,recipe25,recipe26,recipe27,recipe28,recipe29,recipe30,recipe31,recipe32,recipe3333,recipe34,recipe35,recipe36,recipe37,recipe38,recipe39,recipe40]
    
    let DuhovkaBreakfasEasyHot: [Recipe] = [recipeforhot,recipeforhot1,recipeforhot2,recipeforhot3,recipeforhot4,recipeforhot5,recipeforhot6,recipeforhot7,recipeforhot8,recipeforhot9,recipeforhot10,recipeforhot11,recipeforhot12,recipeforhot13,recipeforhot14,recipeforhot15,recipeforhot16,recipeforhot17,recipeforhot18,recipeforhot19]
    
    let MultiBreakfasEasyHot: [Recipe] = [recipe21,recipe2222,recipe23,recipe24,recipe25,recipe26,recipe27,recipe28,recipe29,recipe30,recipe31,recipe32,recipe3333,recipe34,recipe35,recipe36,recipe37,recipe38,recipe39,recipe40]
    
    let SkovorodaBreakfasEasyHot: [Recipe] = [recipe41,recipe42,recipe43,recipe4444,recipe45,recipe46,recipe47,recipe48,recipe49,recipe50,recipe51,recipe52,recipe53,recipe54,recipe5555,recipe56,recipe57,recipe58,recipe59,recipe60]
    
    let MivrowaveBreakfasEasyHot: [Recipe] = [recipe61,recipe62,recipe63,recipe64,recipe65,recipe6666,recipe67,recipe68,recipe69,recipe70,recipe71,recipe72,recipe73,recipe74,recipe75,recipe76,recipe7777,recipe78,recipe79]
    
    let HolodBreakfasEasyHot: [Recipe] = [recipeforhot,recipeforhot1,recipeforhot2,recipeforhot3,recipeforhot4,recipeforhot5,recipeforhot6,recipeforhot7,recipeforhot8,recipeforhot9,recipeforhot10,recipeforhot11,recipeforhot12,recipeforhot13,recipeforhot14,recipeforhot15,recipeforhot16,recipeforhot17,recipeforhot18,recipeforhot19,recipe21,recipe2222,recipe23,recipe24,recipe25,recipe26,recipe27,recipe28,recipe29,recipe30,recipe31,recipe32,recipe3333,recipe34,recipe35,recipe36,recipe37,recipe38,recipe39,recipe40]
    
    
    //------//
    
    let allDinnerEasyCold: [Recipe] = [recipe161,recipe162,recipe163,recipe164,recipe165,recipe166,recipe167,recipe168,recipe169,recipe170,recipe171,recipe172,recipe173,recipe174,recipe175,recipe176,recipe177,recipe178,recipe179,recipe180,recipe181,recipe182,recipe183,recipe184,recipe185,recipe186,recipe187,recipe188,recipe189,recipe190,recipe191,recipe192,recipe193,recipe194,recipe195,recipe196,recipe197,recipe198,recipe199,recipe200,recipe201,recipe202,recipe203,recipe204,recipe205,recipe206,recipe207,recipe208,recipe209,recipe210,recipe211,recipe212,recipe213,recipe214,recipe215,recipe216,recipe217,recipe218,recipe219,recipe220,recipe221,recip1222,recipe223,recipe224,recipe225,recipe226,recipe227,recipe228,recipe229,recipe230,recipe231,recipe232,recipe233,recipe234,recipe235,recipe236,recipe237,recipe238,recipe239,recipe240,recipe241,recipe242,recipe243,recipe244,recipe245,recipe246,recipe247,recipe248,recipe249,recipe250,recipe251,recipe252,recipe253,recipe254,recipe255,recipe256,recipe257,recipe258,recipe259,recipe260]
    
    let DuhovkaDinnerEasyCold: [Recipe] = [recipe161,recipe162,recipe163,recipe164,recipe165,recipe166,recipe167,recipe168,recipe169,recipe170,recipe171,recipe172,recipe173,recipe174,recipe175,recipe176,recipe177,recipe178,recipe179,recipe180]
    
    let MultiDinnerEasyCold: [Recipe] = [recipe181,recipe182,recipe183,recipe184,recipe185,recipe186,recipe187,recipe188,recipe189,recipe190,recipe191,recipe192,recipe193,recipe194,recipe195,recipe196,recipe197,recipe198,recipe199,recipe200]
    
    let SkovorodaDinnerEasyCold: [Recipe] = [recipe201,recipe202,recipe203,recipe204,recipe205,recipe206,recipe207,recipe208,recipe209,recipe210,recipe211,recipe212,recipe213,recipe214,recipe215,recipe216,recipe217,recipe218,recipe219,recipe220]
    
    let MivrowaveDinnerEasyCold: [Recipe] = [recipe221,recip1222,recipe223,recipe224,recipe225,recipe226,recipe227,recipe228,recipe229,recipe230,recipe231,recipe232,recipe233,recipe234,recipe235,recipe236,recipe237,recipe238,recipe239,recipe240]
    
    let HolodDinnerEasyCold: [Recipe] = [recipe241,recipe242,recipe243,recipe244,recipe245,recipe246,recipe247,recipe248,recipe249,recipe250,recipe251,recipe252,recipe253,recipe254,recipe255,recipe256,recipe257,recipe258,recipe259,recipe260]

    //----//
    
    let allDinnerEasyHot: [Recipe] = [recipe80,recipe81,recipe82,recipe83,recipe84,recipe85,recipe86,recipe87,recipe8888,recipe89,recipe90,recipe91,recipe92,recipe93,recipe94,recipe95,recipe96,recipe97,recipe98,recipe99,recipe1000,recipe101,recipe102,recipe103,recipe104,recipe105,recipe106,recipe107,recipe108,recipe109,recipe110,recipe1111,recipe112,recipe113,recipe114,recipe115,recipe116,recipe117,recipe118,recipe119,recipe120,recipe121,recipe122,recipe123,recipe124,recipe125,recipe126,recipe127,recipe128,recipe129,recipe130,recipe131,recipe132,recipe133,recipe134,recipe135,recipe136,recipe137,recipe138,recipe139,recipe140,recipe141,recipe142,recipe143,recipe144,recipe145,recipe146,recipe147,recipe148,recipe149,recipe150,recipe151,recipe152,recipe153,recipe154,recipe155,recipe156,recipe157,recipe158,recipe159,recipe160]
    
    let DuhovkaDinnerEasyHot: [Recipe] = [recipe80,recipe81,recipe82,recipe83,recipe84,recipe85,recipe86,recipe87,recipe8888,recipe89,recipe90,recipe91,recipe92,recipe93,recipe94,recipe95,recipe96,recipe97,recipe98,recipe99,recipe1000,recipe261,recipe262,recipe263,recipe264,recipe265,recipe266,recipe267,recipe268,recipe269,recipe270]
    
    let MultiDinnerEasyHot: [Recipe] = [recipe101,recipe102,recipe103,recipe104,recipe105,recipe106,recipe107,recipe108,recipe109,recipe110,recipe1111,recipe112,recipe113,recipe114,recipe115,recipe116,recipe117,recipe118,recipe119,recipe120]
    
    let SkovorodaDinnerEasyHot: [Recipe] = [recipe121,recipe122,recipe123,recipe124,recipe125,recipe126,recipe127,recipe128,recipe129,recipe130,recipe131,recipe132,recipe133,recipe134,recipe135,recipe136,recipe137,recipe138,recipe139,recipe140]
    
    let MivrowaveDinnerEasyHot: [Recipe] = [recipe141,recipe142,recipe143,recipe144,recipe145,recipe146,recipe147,recipe148,recipe149,recipe150,recipe151,recipe152,recipe153,recipe154,recipe155,recipe156,recipe157,recipe158,recipe159,recipe160]
    
    let HolodDinnerEasyHot: [Recipe] = [recipe261,recipe262,recipe263,recipe264,recipe265,recipe266,recipe267,recipe268,recipe269,recipe270]
        
    
//-------//
    
    let allDinnerEasyCold2: [Recipe] = [recipe271,recipe272,recipe273,recipe274,recipe275,recipe276,recipe277,recipe278,recipe279,recipe280,recipe281,recipe282,recipe283,recipe283,recipe284,recipe285,recipe286,recipe287,recipe288,recipe289,recipe290,recipe291,recipe292,recipe293,recipe294,recipe295,recipe296,recipe297,recipe298,recipe299,recipe300,recipe301,recipe302,recipe303,recipe304,recipe305,recipe306,recipe307,recipe308,recipe309,recipe311,recipe312,recipe313,recipe314,recipe315,recipe316,recipe317,recipe318,recipe319,recipe320,recipe321,recipe322,recipe323,recipe324,recipe325,recipe326,recipe327,recipe328,recipe329,recipe330,recipe331,recipe332,recipe1333,recipe334,recipe335,recipe336,recipe337,recipe338,recipe339,recipe340,recipe341,recipe342,recipe343,recipe344,recipe345,recipe346,recipe347,recipe348,recipe349,recipe350]
    
    
    let DuhovkaDinnerEasyCold2: [Recipe] = [recipe271,recipe272,recipe273,recipe274,recipe275,recipe276,recipe277,recipe278,recipe279,recipe280,recipe281,recipe282,recipe283,recipe283,recipe284,recipe285,recipe286,recipe287,recipe288,recipe289,recipe290,recipe351,recipe352,recipe353,recipe354,recipe355,recipe356,recipe357,recipe358,recipe359,recipe360,recipe361,recipe362,recipe363,recipe364,recipe365,recipe366,recipe367,recipe368,recipe369,recipe370]
    
    let MultiDinnerEasyCold2: [Recipe] = [recipe291,recipe292,recipe293,recipe294,recipe295,recipe296,recipe297,recipe298,recipe299,recipe300,recipe301,recipe302,recipe303,recipe304,recipe305,recipe306,recipe307,recipe308,recipe309]
    
    let SkovorodaDinnerEasyCold2: [Recipe] = [recipe311,recipe312,recipe313,recipe314,recipe315,recipe316,recipe317,recipe318,recipe319,recipe320,recipe321,recipe322,recipe323,recipe324,recipe325,recipe326,recipe327,recipe328,recipe329,recipe330]
    
    let MivrowaveDinnerEasyCold2: [Recipe] = [recipe331,recipe332,recipe1333,recipe334,recipe335,recipe336,recipe337,recipe338,recipe339,recipe340,recipe341,recipe342,recipe343,recipe344,recipe345,recipe346,recipe347,recipe348,recipe349,recipe350]
    
    let HolodDinnerEasyCold2: [Recipe] = [recipe351,recipe352,recipe353,recipe354,recipe355,recipe356,recipe357,recipe358,recipe359,recipe360,recipe361,recipe362,recipe363,recipe364,recipe365,recipe366,recipe367,recipe368,recipe369,recipe370]

    //----//
    
    let allDinnerEasyHot2: [Recipe] = [recipe371,recipe372,recipe373,recipe374,recipe375,recipe376,recipe377,recipe378,recipe379,recipe380,recipe381,recipe382,recipe383,recipe384,recipe385,recipe386,recipe387,recipe388,recipe389,recipe390,recipe391,recipe392,recipe393,recipe394,recipe395,recipe396,recipe397,recipe398,recipe399,recipe400,recipe401,recipe402,recipe403,recipe404,recipe405,recipe406,recipe407,recipe408,recipe409,recipe410,recipe411,recipe412,recipe413,recipe414,recipe415,recipe416,recipe417,recipe418,recipe419,recipe420,recipe421,recipe422,recipe423,recipe424,recipe425,recipe426,recipe427,recipe428,recipe429,recipe430,recipe451,recipe452,recipe453,recipe454,recipe455,recipe456,recipe457,recipe458,recipe459,recipe460,recipe461,recipe462,recipe463,recipe464,recipe465,recipe466,recipe467,recipe468,recipe469,recipe470]
    
    let DuhovkaDinnerEasyHot2: [Recipe] = [recipe371,recipe372,recipe373,recipe374,recipe375,recipe376,recipe377,recipe378,recipe379,recipe380,recipe381,recipe382,recipe383,recipe384,recipe385,recipe386,recipe387,recipe388,recipe389,recipe390]
    
    let MultiDinnerEasyHot2: [Recipe] = [recipe391,recipe392,recipe393,recipe394,recipe395,recipe396,recipe397,recipe398,recipe399,recipe400,recipe401,recipe402,recipe403,recipe404,recipe405,recipe406,recipe407,recipe408,recipe409,recipe410]
    
    let SkovorodaDinnerEasyHot2: [Recipe] = [recipe411,recipe412,recipe413,recipe414,recipe415,recipe416,recipe417,recipe418,recipe419,recipe420,recipe421,recipe422,recipe423,recipe424,recipe425,recipe426,recipe427,recipe428,recipe429,recipe430]
    
    let MivrowaveDinnerEasyHot2: [Recipe] = [recipe431,recipe432,recipe433,recipe434,recipe435,recipe436,recipe437,recipe438,recipe439,recipe440,recipe441,recipe442,recipe443,recipe1444,recipe445,recipe446,recipe447,recipe448,recipe449,recipe450]
    
    let HolodDinnerEasyHot2: [Recipe] = [recipe451,recipe452,recipe453,recipe454,recipe455,recipe456,recipe457,recipe458,recipe459,recipe460,recipe461,recipe462,recipe463,recipe464,recipe465,recipe466,recipe467,recipe468,recipe469,recipe470]
        
    
    
    
    //----//
    
    let allEasyHot: [Recipe] = [recipe521,recipe522,recipe523,recipe524,recipe525,recipe526,recipe527,recipe528,recipe529,recipe530,recipe531,recipe532,recipe534,recipe535,recipe536,recipe538,recipe539,recipe540,recipe541,recipe542,recipe543,recipe544,recipe545,recipe546,recipe547,recipe548,recipe549,recipe550,recipe551,recipe552,recipe553,recipe554,recipe1555,recipe556,recipe557,recipe558,recipe559,recipe560,recipe561,recipe562,recipe563,recipe564,recipe565]
    
    let DuhovkaEasyHot: [Recipe] = [recipe521,recipe522,recipe523,recipe524,recipe525,recipe526,recipe527,recipe528,recipe529,recipe530]
    
    let MultiEasyHot: [Recipe] = [recipe531,recipe532,recipe534,recipe535,recipe536,recipe538,recipe539,recipe540]
    
    let SkovorodaEasyHot: [Recipe] = [recipe541,recipe542,recipe543,recipe544,recipe545,recipe546,recipe547,recipe548,recipe549,recipe550]
    
    let MivrowaveEasyHot: [Recipe] = [recipe551,recipe552,recipe553,recipe554,recipe1555,recipe556,recipe557,recipe558,recipe559,recipe560]
    
    let HolodEasyHot: [Recipe] = [recipe561,recipe562,recipe563,recipe564,recipe565]
    
    //----//
    
    let allEasyCold: [Recipe] = [recipe480,recipe471,recipe472,recipe473,recipe474,recipe475,recipe476,recipe477,recipe478,recipe479,recipe481,recipe482,recipe483,recipe484,recipe485,recipe486,recipe487,recipe488,recipe489,recipe490,recipe491,recipe492,recipe493,recipe494,recipe495,recipe497,recipe496,recipe497,recipe498,recipe499,recipe500,recipe501,recipe502,recipe503,recipe504,recipe505,recipe506,recipe507,recipe508,recipe509,recipe510,recipe511,recipe512,recipe513,recipe514,recipe515,recipe516,recipe517,recipe518,recipe519,recipe520]
    
    let DuhovkaEasyCold: [Recipe] = [recipe480,recipe471,recipe472,recipe473,recipe474,recipe475,recipe476,recipe477,recipe478,recipe479]
    
    let MultiEasyCold: [Recipe] = [recipe481,recipe482,recipe483,recipe484,recipe485,recipe486,recipe487,recipe488,recipe489,recipe490]
    
    let SkovorodaEasyCold: [Recipe] = [recipe491,recipe492,recipe493,recipe494,recipe495,recipe497,recipe496,recipe497,recipe498,recipe499,recipe500]
    
    let MivrowaveEasyCold: [Recipe] = [recipe501,recipe502,recipe503,recipe504,recipe505,recipe506,recipe507,recipe508,recipe509,recipe510]
    
    let HolodEasyCold: [Recipe] = [recipe511,recipe512,recipe513,recipe514,recipe515,recipe516,recipe517,recipe518,recipe519,recipe520]
        
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)) // Устанавливаем цвет фона
                            .ignoresSafeArea()
                VStack {
                    
                    
                    Spacer().frame(height: 20)
                    
                    if let selectedRecipe = recipe {
                        Text(selectedRecipe.title)
                            .font(.system(size: 35, weight: .bold))
                            .fontWeight(.bold)
                        
                        
                        Image(selectedSquare == "Завтрак" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" ? "Завтрак - Нормально - Горячее" :
                                selectedSquare == "Завтрак" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" ? "Завтрак - Легко - Горячее" :
                                selectedSquare == "Завтрак" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" ? "Завтрак - Сложно - Горячее" :
                                selectedSquare == "Обед" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" ? "Обед - Легко - Холодное" :
                                selectedSquare == "Обед" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" ? "Обед - Нормально - Холодное" :
                                selectedSquare == "Обед" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" ? "Обед - Сложно - Холодное" :
                                selectedSquare == "Обед" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" ? "Обед - Легко - Горячее" :
                                selectedSquare == "Обед" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" ? "Обед - Нормально - Горячее" :
                                selectedSquare == "Обед" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" ? "Обед - Сложно - Горячее" :
                                selectedSquare == "Ужин" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" ? "Ужин - Легко - Горячее" :
                                selectedSquare == "Ужин" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" ? "Ужин - Нормально - Горячее" :
                                selectedSquare == "Ужин" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" ? "Ужин - Сложно - Горячее" :
                                selectedSquare == "Ужин" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" ? "Ужин - Легко - Холодное" :
                                selectedSquare == "Ужин" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" ? "Ужин - Нормально - Холодное" :
                                selectedSquare == "Ужин" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" ? "Ужин - Сложно - Холодное" :
                                //--//
                              selectedSquare == "Десерт" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" ? "Десерт - Легко - Холодное" :
                                selectedSquare == "Десерт" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" ? "Десерт - Легко - Горячее" :
                                selectedSquare == "Десерт" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" ? "Десерт - Сложно - Холодное" :
                                selectedSquare == "Десерт" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" ? "Десерт - Сложно - Горячее" :
                                selectedSquare == "Десерт" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" ? "Десерт - Нормально - Горячее" :
                                selectedSquare == "Десерт" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" ? "Десерт - Нормально - Холодное" :
                                "image1")
                        .resizable()
                        .frame(width: 350, height: 170)
                        .cornerRadius(10)
                        
                        
                        
                        Text(selectedRecipe.description)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom, 50)
                            .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                                .opacity(0.9) // Настройте уровень прозрачности (от 0.0 до 1.0)
                            
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                isIngredientsSelected = true
                            }) {
                                Text("Ингредиенты")
                                    .font(isIngredientsSelected ? .system(size: 20, weight: .bold) : .system(size: 20, weight: .regular))
                            }
                            .foregroundColor(isIngredientsSelected ? Color(#colorLiteral(red: 0.545098066329956, green: 0.2705882489681244, blue: 0.07058823853731155, alpha: 1))  : .black)
                            .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                                .opacity(0.9) // Настройте уровень прозрачности (от 0.0 до 1.0)
                                
                            Button(action: {
                                isIngredientsSelected = false
                            }) {
                                Text("Инструкция")
                                    .font(isIngredientsSelected ? .system(size: 20, weight: .regular) : .system(size: 20, weight: .bold))
                            }
                            .foregroundColor(isIngredientsSelected ? .black : Color(#colorLiteral(red: 0.545098066329956, green: 0.2705882489681244, blue: 0.07058823853731155, alpha: 1)) )
                            .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                                .opacity(0.9) // Настройте уровень прозрачности (от 0.0 до 1.0)
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color.black)
                            .frame(width: 350)
                            .padding(.vertical, 8)
                        Spacer()
                        
                        if isIngredientsSelected {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 20) {
                                    ForEach(selectedRecipe.ingredients, id: \.self) { ingredient in
                                        Text(ingredient)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                            }
                            .padding(.leading, 20)
                        } else {
                            ScrollView {
                                Text(selectedRecipe.instructions)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.horizontal, 20)
                                    .background(Color(#colorLiteral(red: 0.9607843160629272, green: 0.9607843160629272, blue: 0.8627451062202454, alpha: 1)))
                                        .opacity(0.9) // Настройте уровень прозрачности (от 0.0 до 1.0)
                            }
                        }
                    }
                    Spacer()
                    Divider()
                        .frame(height: 1)
                        .background(Color.black)
                        .frame(width: 350)
                        .padding(.vertical, -9)
                    
                    NavigationLink(destination: ThirdView(selectedButtons: $selectedButtons, selectedSquare: $selectedSquare, selectedSquare2: $selectedSquare2, selectedSquare3: $selectedSquare3)) {
                        Image(systemName: "chevron.left")
                            .offset(x: 30)
                            .font(.system(size: 18, weight: .bold))
                        Text("Другой рецепт")
                            .font(.system(size: 18, weight: .bold))
                            .offset(x: 25)
                        
                        
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.545098066329956, green: 0.2705882489681244, blue: 0.07058823853731155, alpha: 1)))
                
                    .offset(x: -130, y: 15)
                    
                    
                    NavigationLink(destination: ContentView()){
                        Text("Закончить")
                            .font(.system(size: 19, weight: .bold))
                            .offset(x: 25)
                        
                        
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.545098066329956, green: 0.2705882489681244, blue: 0.07058823853731155, alpha: 1)))
                    .offset(x: 80, y: -6)
                    
                }
                
                
                .onAppear {
                    if let recipe = getRandomRecipe() {
                        self.recipe = recipe
                    }
                }
                .preferredColorScheme(.light)
                .navigationBarBackButtonHidden(true)
                .background(
                    EmojisFlyingView(isActive: $isAnimating)
                )
            }
                        
        }
        .navigationBarBackButtonHidden(true)
    }

    func getRandomRecipe() -> Recipe? {
        //---Завтрак-Холодное--//
        if selectedSquare == "Завтрак" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allBreakfasEasyCold)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaBreakfasEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiBreakfasEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaBreakfasEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveBreakfasEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodBreakfasEasyCold)
            }
        }
        
        if selectedSquare == "Завтрак" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allBreakfasEasyCold)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaBreakfasEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiBreakfasEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaBreakfasEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveBreakfasEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodBreakfasEasyCold)
            }
        }
        if selectedSquare == "Завтрак" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allBreakfasEasyCold)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaBreakfasEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiBreakfasEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaBreakfasEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveBreakfasEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodBreakfasEasyCold)
            }
        }
    
        
        //---Завтрак-Горячее---//
        if selectedSquare == "Завтрак" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allBreakfasEasyHot)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaBreakfasEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiBreakfasEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaBreakfasEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveBreakfasEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodBreakfasEasyHot)
            }
        }
        if selectedSquare == "Завтрак" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allBreakfasEasyHot)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaBreakfasEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiBreakfasEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaBreakfasEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveBreakfasEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodBreakfasEasyHot)
            }
        }
        if selectedSquare == "Завтрак" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allBreakfasEasyHot)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaBreakfasEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiBreakfasEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaBreakfasEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveBreakfasEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodBreakfasEasyHot)
            }
        }
        
        //----обед-холодный--//
        if selectedSquare == "Обед" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyCold)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyCold)
                
            }else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyCold)
            }
        }
        
        if selectedSquare == "Обед" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyCold)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyCold)
            }
        }
        if selectedSquare == "Обед" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyCold)
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyCold)
            }
        }
    
        
        //----обед-горячий--//
        if selectedSquare == "Обед" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyHot)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyHot)
            }
        }
        if selectedSquare == "Обед" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyHot)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyHot)

            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyHot)
            }
        }
        if selectedSquare == "Обед" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyHot)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyHot)
            }
        }
        
        
        
        
        //----ужин-Горячее--//
        if selectedSquare == "Ужин" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyCold2)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyCold2)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyCold2)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyCold2)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyCold2)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyCold2)
            }
        }
        
        if selectedSquare == "Ужин" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyCold2)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyCold2)
                
            }  else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyCold2)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyCold2)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyCold2)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyCold2)
            }
        }
        if selectedSquare == "Ужин" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyCold2)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyCold2)
                
            }  else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyCold2)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyCold2)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyCold2)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyCold2)
            }
        }
    
        
        //----ужин-Холодное--//
        if selectedSquare == "Ужин" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyHot2)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyHot2)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyHot2)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyHot2)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyHot2)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyHot2)
            }
        }
        if selectedSquare == "Ужин" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyHot2)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyHot2)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyHot2)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyHot2)

            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyHot2)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyHot2)
            }
        }
        if selectedSquare == "Ужин" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allDinnerEasyHot2)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaDinnerEasyHot2)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiDinnerEasyHot2)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaDinnerEasyHot2)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveDinnerEasyHot2)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodDinnerEasyHot2)
            }
        }
        
        
        //-----//
        
        //----Десерт-Горячее--//
        if selectedSquare == "Десерт" && selectedSquare2 == "Легко" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allEasyHot)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaEasyHot)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodEasyHot)
            }
        }
        
        if selectedSquare == "Десерт" && selectedSquare2 == "Нормально" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allEasyHot)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaEasyHot)
                
            }  else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodEasyHot)
            }
        }
        if selectedSquare == "Десерт" && selectedSquare2 == "Сложно" && selectedSquare3 == "Горячее" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allEasyHot)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaEasyHot)
                
            }  else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiEasyHot)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaEasyHot)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveEasyHot)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodEasyHot)
            }
        }
    
        
        //----Десерт-Холодное--//
        if selectedSquare == "Десерт" && selectedSquare2 == "Легко" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allEasyCold)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodEasyCold)
            }
        }
        if selectedSquare == "Десерт" && selectedSquare2 == "Нормально" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allEasyCold)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaEasyCold)

            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodEasyCold)
            }
        }
        if selectedSquare == "Десерт" && selectedSquare2 == "Сложно" && selectedSquare3 == "Холодное" {
            if selectedButtons.button1 {
                return getRandomRecipeFromArray(allEasyCold)
                
            }
            else if selectedButtons.button2 {
                return getRandomRecipeFromArray(DuhovkaEasyCold)
                
            } else if selectedButtons.button3 {
                return getRandomRecipeFromArray(MultiEasyCold)
            } else if selectedButtons.button4 {
                return getRandomRecipeFromArray(SkovorodaEasyCold)
                
            } else if selectedButtons.button5 {
                return getRandomRecipeFromArray(MivrowaveEasyCold)
            } else if selectedButtons.button6 {
                return getRandomRecipeFromArray(HolodEasyCold)
            }
        }
        return nil
    }

    func getRandomRecipeFromArray(_ recipes: [Recipe]) -> Recipe? {
        if recipes.isEmpty {
            return nil
        } else {
            let randomIndex = Int.random(in: 0..<recipes.count)
            return recipes[randomIndex]
        }
    }
}

struct ForthView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedButtons = Binding.constant(SelectedButtons(button1: true, button2: false, button3: false, button4: false, button5: false, button6: false))
        let selectedSquare = Binding.constant("Ужин")
        let selectedSquare2 = Binding.constant("Легко")
        let selectedSquare3 = Binding.constant("Холодное")
        
        return ForthView(selectedButtons: selectedButtons, selectedSquare: selectedSquare, selectedSquare2: selectedSquare2, selectedSquare3: selectedSquare3)
    }
}
