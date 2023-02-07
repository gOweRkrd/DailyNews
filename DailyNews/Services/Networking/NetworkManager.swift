import UIKit

final class NetworkManager {

    static let shared = NetworkManager()
    private var cache = [String: UIImage]()

    enum Constants {
        static let topHeadlinesURL = URL(string: Network.url)
    }
    
    enum NetworkError: Error {
        case invalidData
        case invalidURL
    }

    private init() {}

     func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {

        guard let url = Constants.topHeadlinesURL else {
            return
        }

         let task = URLSession.shared.dataTask(with: url) { data, _, error in
             if let error = error {
                 completion(.failure(error))
             } else if let data = data {
                 do {
                     let result = try JSONDecoder().decode(NetworkModel.self, from: data)

                     if let articles = result.articles {
                         completion(.success(articles))
                     } else {
                         completion(.failure(NetworkError.invalidData))
                     }
                 } catch {
                     completion(.failure(error))
                 }
             }
         }

        task.resume()
    }

    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = String(urlString)

        if let image = cache[cacheKey] {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }

            self.cache[cacheKey] = image
            completed(image)
        }

        task.resume()
    }
}
