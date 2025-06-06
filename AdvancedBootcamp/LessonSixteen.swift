//
//  LessonSixteen.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-06.

import SwiftUI
import Combine

protocol DataService {
    func getData() -> AnyPublisher<[PostsModel], Error>
}

struct PostsModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class MockDataService: DataService {
    
    let testData: [PostsModel]
    
    init(testData: [PostsModel]?) {
        self.testData = testData ?? []
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
            Just(testData)
                .tryMap {$0}
                .eraseToAnyPublisher()
    }
}

class ProductionDataService: DataService {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostsModel] = []
    var cancellables: Set<AnyCancellable> = []
    let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { completion in
                switch completion {
                case .finished:
                    print("DEBUG: Success!!!")
                case .failure(let error):
                    print("DEBUG: !-!-! Error !-!-! \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedPosts in
                print("DEBUG: Data received - \(returnedPosts.count)")
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)

    }
}

struct LessonSixteen: View {
    
    @StateObject private var viewModel: DependencyInjectionViewModel
    
    init(dataService: DataService) {
        
        _viewModel = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.dataArray.isEmpty {
                    Spacer()
                    ProgressView()
                    Text("Loading Posts...")
                } else {
                    ForEach(viewModel.dataArray) { post in
                        Text(post.title)
                    }
                }
                
            }
        }
    }
}

#Preview {
    
//    let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    
    let mockService = MockDataService(testData: [
        PostsModel(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem voluptatem quaerat"),
        PostsModel(userId: 1, id: 2, title: "qui est esse", body: "qui est esse"),
    ])
    
    LessonSixteen(dataService: mockService)
}
