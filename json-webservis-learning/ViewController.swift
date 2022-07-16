//
//  ViewController.swift
//  json-webservis-learning
//
//  Created by Anıl AVCI on 16.07.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    @IBOutlet weak var tableView: UITableView!
    var photos = [Photo]()
    override func viewDidLoad() {
        super.viewDidLoad()
       loadLogo()
        getPhotos()
        
        
        //tableview in borderı görünmez yapar.
        tableView.separatorStyle = .none
    }
    
    /* Tableviews*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        let row = photos[indexPath.row]
        
        cell.myTitle.text = row.title
        cell.myImage.load(url: URL(string: row.url)!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = photos[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let desVC = segue.destination as! DetailViewController
            desVC.photo = sender as! Photo
        }
    }
    
    /* methods */
    
    //logo yükleme
    func loadLogo() {
        if let logo = UIImage(named: "logo.png") {
            let newLogo = Util.app.resizeImageWithAspect(image: logo, scaledToMaxWidth: 200, maxHeight: 50)
            let imageView = UIImageView(image: newLogo)
            self.navigationItem.titleView = imageView
    }
}
 
    //get methodu
    
    
    func getPhotos() {
        
        photos = []
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            }else {
                //status kod bakılır. servisin vereceği hatayı kontrol eder
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                }
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        //print(json)
                        
                        for dic in json {
                            
                            self.photos.append(Photo(dic))
                            
                        }
                        // gelen veriyi kısıtlamak için 10 tane içerik çeker
                        self.photos = Array(self.photos.prefix(10))
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                        
                    }
                    
                }
                catch let error as NSError {
                    print("error: \(error.localizedDescription)")
                }
                
            }
            
            
        }
        task.resume()
        
    }
    
   

}
    
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
