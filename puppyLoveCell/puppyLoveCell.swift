//
//  puppyLoveCell.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/7/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class puppyLoveCell: UITableViewCell {
    
    @IBOutlet weak var puppyLoveImage: UIImageView!
    @IBOutlet weak var puppyLoveName: UILabel!
    @IBOutlet weak var puppyLoveBreed: UILabel!
    @IBOutlet weak var puppyLoveLocation: UILabel!
    @IBOutlet weak var puppyLoveAge: UILabel!

   // keep track of the cell's image url string to prevent flickering caused by dequeueReusableCell
     private var urlString = ""
     
     func configureCell(for puppy: PuppyLove) {
       
        puppyLoveName.text = puppy.name
       puppyLoveBreed.text = puppy.breed
        puppyLoveAge?.text = puppy.details.first??.age
        puppyLoveLocation.text = puppy.location.first?.address
        
        let urlImage = puppy.dogImage.first?.image ?? ""

        puppyLoveImage.getImage(with: urlImage) { [weak self]
            (result)  in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.puppyLoveImage.image = image
                }
            case .failure(let error):
                print("configureCell image error \(error)")
            }
        }
}
}
