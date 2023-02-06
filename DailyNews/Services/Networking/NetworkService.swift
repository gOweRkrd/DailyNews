import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d05f1b12009d457a877881f7cbde2e84")
    }
    
    private init() {}
    
    // GET functions
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NetworkModel.self, from: data)
                    
                    print("Articles: \(result.articles?.count)")
                    completion(.success(result.articles!))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
