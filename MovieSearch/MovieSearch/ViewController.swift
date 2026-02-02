//
//  ViewController.swift
//  MovieSearch
//
//  Created by Deepinderpal Singh on 05/11/24.
//

//https://www.omdbapi.com/?apikey=3aea79ac&s=fast%20and&type=movie

import UIKit


struct MovieResult: Codable {
    let Search: [Movie]
}
// Define a struct to parse movie data from the API
struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
        private enum CodingKeys: String, CodingKey {
            case Title,Year, imdbID,_Type = "Type",Poster
        }
}



class ViewController: UIViewController {

    
  
    @IBOutlet weak var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var movieData = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarSetup()
        collectionView.delegate=self
        collectionView.dataSource=self
    }

    private func searchBarSetup(){
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    // Fetch movies from OMDb API
       private func fetchMovies(query: String) {
           let urlString = "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie"
           
           guard let url = URL(string: urlString) else { return }
           
           URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
               if let error = error {
                   print("Failed to fetch data:", error)
                   return
               }
               
               guard let data = data else { return }
               
               do {
                   let searchResponse = try JSONDecoder().decode(MovieResult.self, from: data)
                   self?.movieData = searchResponse.Search
                   
                   DispatchQueue.main.async {
                       self?.collectionView.reloadData()
                   }
               } catch let jsonError {
                   print("Failed to decode JSON:", jsonError)
               }
           }.resume()
       }

}

extension ViewController: UISearchControllerDelegate, UISearchBarDelegate{
    
}

extension ViewController: UISearchResultsUpdating{
   func updateSearchResults(for searchController: UISearchController) {
      guard let searchText = searchController.searchBar.text else { return }
//        if searchText == ""{
//           // intializeDataModel()
//            collectionView.reloadData()
//            
//        }else{
//            //intializeDataModel()
//            movieData = movieData.filter{
//                $0.title.contains(searchText)
//            }
//        }
        collectionView.reloadData()
       
       
       // Call API to fetch movies
              fetchMovies(query: searchText)
   }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        let movie = movieData[indexPath.row]
        
        // Configure cell
        cell.titleLabel.text = movie.Title
        cell.yearLabel.text = movie.Year
        
       // cell.imgView.image = arrData[indexPath.row]
      // cell.posterImageview.contentMode = .scaleAspectFill
       cell.posterImageview.clipsToBounds = true
        
        // Debugging background colors
    //    cell.backgroundColor = UIColor.lightGray
      //  cell.posterImageview.backgroundColor = UIColor.red
        // Load poster image asynchronously
        if let imageURL = URL(string: movie.Poster) {
            URLSession.shared.dataTask(with: imageURL) { data, _, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    cell.posterImageview.image = UIImage(data: data)
                }
            }.resume()
        }
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/2, height: collectionWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }

}



