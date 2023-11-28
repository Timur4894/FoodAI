import SwiftUI

class ChatData: ObservableObject {
    @Published var selectedButtons: SelectedButtons
    @Published var chatResponse: String = ""

    init(selectedButtons: SelectedButtons) {
        self.selectedButtons = selectedButtons
    }
}
