//
//  ViewController.swift
//  JsonTableViewWithImageSwift
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableViewHeroes: UITableView!
    
    let  URL_GET_DATA = "https://simplifiedcoding.net/demos/marvel/"
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        Alamofire.request(URL_GET_DATA).responseJSON { response in
            if let json = response.result.value{
                let heroesArray : NSArray = json as! NSArray
                for i in 0..<heroesArray.count{
                    self.heroes.append(Hero(
                        name:(heroesArray[i] as AnyObject).value(forKey: "name") as? String,
                        team:(heroesArray[i] as AnyObject).value(forKey: "team") as? String,
                        imageUrl:(heroesArray[i] as AnyObject).value(forKey: "imageurl") as? String,
                        realname:(heroesArray[i] as AnyObject).value(forKey: "realname") as? String,
                        firstappearance:(heroesArray[i] as AnyObject).value(forKey: "firstappearance") as? String,
                        bio:(heroesArray[i] as AnyObject).value(forKey: "bio") as? String
                    ))
                }
                self.tableViewHeroes.reloadData()
            }
        }
    } // view did load end
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let hero:Hero
        hero = heroes[indexPath.row]
        cell.labelName.text = hero.name
        cell.labelTeam.text = hero.team
        cell.lblRealName.text = hero.realname
        cell.lblfirstappearance.text = hero.firstappearance
        Alamofire.request(hero.imageUrl!).responseImage { response in
            debugPrint(response)
            if let image = response.result.value {
                cell.heroImage.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 201
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        detailVC.url = self.heroes[indexPath.item].imageUrl
        detailVC.bio = self.heroes[indexPath.item].bio
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

