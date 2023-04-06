//
//  NewsfeedViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 15.01.2023.
//

import UIKit


class NewsfeedViewController: UIViewController {
    
    var expandedcell:IndexSet = []
    var newsfeeds = FeedResponse(items: [], profiles: [], groups: [])
    
    private var photoServiceCach: PhotoServiceCach?
    
    @IBOutlet weak var tableView: UITableView!
    
    var nextFrom = ""
    var isLoading = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoServiceCach = PhotoServiceCach(container: tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        
        setupRefreshControl()
        
        NewsfeedService().loadData { [weak self] data in
            guard let self else { return }
            NewsfeedService().parse(data: data) { newsfeeds, nextFrom in
                //print(newsfeeds)
                self.newsfeeds = newsfeeds
                self.nextFrom = nextFrom
                //self.lastDate = String(news.items.first?.date ?? 0)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension NewsfeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsfeeds.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

//        else if indexPath.row == 2 { return view.frame.width } //квадратная картинка
        
        switch indexPath.row {
            
        case 0:
            return UITableView.automaticDimension
       
        case 1:
            guard let textPost = newsfeeds.items[indexPath.section].text, !textPost.isEmpty else { return 0 }
            return UITableView.automaticDimension
            
        case 2:
            guard let urls = newsfeeds.items[indexPath.section].photosURL, !urls.isEmpty else { return 0 }
            let width = view.frame.width
            let post = newsfeeds.items[indexPath.section]
            let cellHeight = width * post.aspectRatio
            return cellHeight
            
        case 3:
            return UITableView.automaticDimension

        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell1", for: indexPath) as! NewsTableViewCell1
            
            let source = newsfeeds.items[indexPath.section].sourceID
            var name, string: String?

            if source < 0 {
                newsfeeds.groups.forEach {
                    if $0.id == abs(source) {
                        print($0.id)
                        name = $0.name
                        string = $0.avatarURL
                    }
                }
            } else {
                newsfeeds.profiles.forEach {
                    if $0.id == source {
                        print($0.id)
                        name = ($0.firstName ?? "") + "" + ($0.lastName ?? "")
                        string = $0.avatarURL
                    }
                }
            }

            let data = self.newsfeeds.items[indexPath.section].date

            cell.config(name: name ?? "", imageURL: string ?? "", datePublication: data)
            return cell

        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell2", for: indexPath) as! NewsTableViewCell2

            let text = newsfeeds.items[indexPath.section].text
            cell.postLabel.text = text
            
            if cell.postLabel.text?.count ?? 0 > 49 {
                cell.buttonText.isHidden = false
            } else {
                cell.buttonText.isHidden = true
            }
            
            let indexPath = IndexPath(row: 1, section: indexPath.section)

            if expandedcell.contains(indexPath.section) {
                cell.postLabel.numberOfLines = 0
                cell.buttonText.setTitle("See Less", for: .normal)
                
            }else {
                cell.postLabel.numberOfLines = 1
                cell.buttonText.setTitle("See More", for: .normal)
                
            }
            
            cell.butttonClicked = {
                if self.expandedcell.contains(indexPath.section) {
                    self.expandedcell.remove(indexPath.section)
                }else {
                    self.expandedcell.insert(indexPath.section)
                }

                tableView.reloadRows(at: [indexPath], with: .automatic)
            
            }
            return cell
        
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell3", for: indexPath) as! NewsTableViewCell3
            
            guard let urlImage = newsfeeds.items[indexPath.section].photosURL?.first else { return UITableViewCell() }
            cell.postImage?.image = photoServiceCach?.photo(atIndexPath: indexPath, byURL: urlImage)
            
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell4", for: indexPath) as! NewsTableViewCell4
            
            let item = self.newsfeeds.items[indexPath.section]
            let numLikes = item.likes.count ?? 0
            let numComments = item.comments.count ?? 0
            let numReposts = item.reposts.count ?? 0
            let numView = item.views.count ?? 0
            cell.config(numLike: numLikes, numComments: numComments, numReposts: numReposts, numViews: numView)
           
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    fileprivate func setupRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Обновление...")
        tableView.refreshControl?.tintColor = .orange
        tableView.refreshControl?.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
    }
    
    @objc func refreshNews() {
    
        tableView.refreshControl?.beginRefreshing()
        let latestNewsDate = newsfeeds.items.first?.date ?? Date().timeIntervalSince1970

        NewsfeedService().loadData(startTime: latestNewsDate + 1) { [weak self] data in
            guard let self = self else { return }
            
            NewsfeedService().parse(data: data) { newsfeeds in
                DispatchQueue.main.async {
                    self.tableView.refreshControl?.endRefreshing()
                }
                guard newsfeeds.items.count > 0 else { return }
                self.newsfeeds.items = newsfeeds.items + self.newsfeeds.items
                self.newsfeeds.groups = newsfeeds.groups + self.newsfeeds.groups
                self.newsfeeds.profiles = newsfeeds.profiles + self.newsfeeds.profiles
                let indexSet = IndexSet(integersIn: 0 ..< newsfeeds.items.count)
                DispatchQueue.main.async {
                    self.tableView.insertSections(indexSet, with: .automatic)
                }
            }
        }
    }
}

extension NewsfeedViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        guard let maxSection = indexPaths.map({ $0.section }).max(),
              maxSection > newsfeeds.items.count  - 3,
              !isLoading
        else { return }
        
        isLoading = true
        
        NewsfeedService().loadData(startFrom: nextFrom) { [weak self] data in
            guard let self = self else { return }
            NewsfeedService().parse(data: data) { newsfeeds, nextFrom in
                let indexSet = IndexSet(integersIn: self.newsfeeds.items.count ..< self.newsfeeds.items.count + newsfeeds.items.count)
                self.newsfeeds.items.append(contentsOf: newsfeeds.items)
                self.newsfeeds.groups.append(contentsOf: newsfeeds.groups)
                self.newsfeeds.profiles.append(contentsOf: newsfeeds.profiles)
                self.nextFrom = nextFrom
                DispatchQueue.main.async {
                    self.tableView.insertSections(indexSet, with: .automatic)
                    self.isLoading = false
                }
            }
        }
    }
}
        
        

