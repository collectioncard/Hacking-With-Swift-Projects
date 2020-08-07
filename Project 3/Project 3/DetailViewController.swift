//
//  DetailViewController.swift
//  Project One
//
//  Created by Thomas Wessel on 8/3/20.
//  Copyright © 2020 Team Creative Name. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    //struct Picture {
        var selectedImage: String?;
        var imageNumber: Int?;
        var numOfImages: Int?;
    //}
    
    override func viewDidLoad() {
        navigationItem.largeTitleDisplayMode = .never;
        super.viewDidLoad()
        title = "Image \(imageNumber!) of \(numOfImages!)";
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad);

        }

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true;
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false;
    }

    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1.0) else{
            print("No Image Found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
