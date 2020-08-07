//
//  ViewController.swift
//  Project One
//
//  Created by Thomas Wessel on 8/3/20.
//  Copyright © 2020 Team Creative Name. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //globals
    var pictures = [String](); // Create a String array

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.prefersLargeTitles = true;
        title = "Storm Viewer";
        let fileManager = FileManager.default;
        let path = Bundle.main.resourcePath!;
        let items = try! fileManager.contentsOfDirectory(atPath: path);
        for item in items {
            if item.hasPrefix("nssl"){
                //This means that we have something that needs to be loaded.
                pictures.append(item);
            }
        }

        //might as well make sure that the array is sorted
        pictures.sort();

        //print the picture locations to the console
        print(pictures);
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath);
        cell.textLabel?.text = pictures[indexPath.row];
        return cell;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //load the Detail view controller if it exists
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            //if we are here, we were able to get the Detail View Controller
            vc.selectedImage = pictures[indexPath.row];
            vc.imageNumber = indexPath.row + 1;
            vc.numOfImages = pictures.count;

            //now present this view
            navigationController?.pushViewController(vc, animated: true);
        }

    }
}

