//
//  DetailViewController.swift
//  JsonTableViewWithImageSwift
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    var bio:String?
    var url:String?
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var lblBio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        lblBio.text = bio
        Alamofire.request(url!).responseImage { response in
            debugPrint(response)
            if let image = response.result.value {
                self.imageview.image = image
            }
        }
    }
}
