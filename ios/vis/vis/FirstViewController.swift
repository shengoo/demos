//
//  FirstViewController.swift
//  vis
//
//  Created by Qing Sheng on 15/7/20.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = ["We", "Heart", "Swift"]
    
    var movies = [Movie]()
    
    var service:MovieService!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        var nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        
        service = MovieService()
        service.getAll({
            (response) in
            self.loadMovies(response)
        })
        
    }
    
    
    func loadMovies(movies:NSArray){
        for movie in movies {
            println(movie["title"])
            var id = movie["id"] as! Int
            var title = movie["title"] as! String
            var description = movie["description"] as! String
            var date = movie["date"] as! String
            var category = movie["category"] as! String
            var length = movie["length"] as! Int
            var image = movie["image"] as! String
            var video = movie["video"] as! String
            var dataItem = Movie(id: id, title: title, desc: description, date: date, category: category, length: length, image: image, video: video)
            self.movies.append(dataItem)
        }
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
//        var imageview = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width * 3 / 4))
//        imageview.image = UIImage(named: "图1")
//        cell.contentView.addSubview(imageview)
        
        var cell:MovieTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! MovieTableViewCell
        
        // this is how you extract values from a tuple
//        var (title, image) = items[indexPath.row]
        var movie = movies[indexPath.row]
        
        cell.loadItem(movie.title, image: "图1",category: movie.category)
        
        return cell
        
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return CGFloat(UIScreen.mainScreen().bounds.width)
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath)
    }


}

