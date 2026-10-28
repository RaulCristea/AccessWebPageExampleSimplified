import SwiftUI
import Shared

struct ContentView: View {
    private let reader = WebPageReader()
    
    @State private var
    url = "https://www.google.com"
    
    @State private var
    selector = "title"
    
    @State private var
    result = ""
    
    @State private var
    isLoading = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("URL", text: $url).keyboardType(.URL).textInputAutocapitalization(.never).autocorrectionDisabled()
                
                TextField("CSS Selector", text: $selector).textInputAutocapitalization(.never).autocorrectionDisabled()
                
                Button(isLoading ? "Loading..." : "Extract") {
                    Task {
                        await extract()
                    }
                }.disabled(isLoading)
                
                TextField("Result", text: $result, axis: .vertical)
            }.navigationTitle("Web Page Reader")
        }
    }
    
    private func extract() async {
        isLoading = true
        do {
            result = try await reader.read(url: url, selector: selector)
        } catch {
//            result = "Error: \(error.localizedDescription)"
            result = "Could not read the page"
        }
        isLoading = false
    }
}

