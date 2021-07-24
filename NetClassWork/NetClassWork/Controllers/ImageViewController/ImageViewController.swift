//
//  ImageViewController.swift
//  NetClassWork
//
//  Created by Martynov Evgeny on 22.07.21.
//

import UIKit

class ImageViewController: UIViewController {
    // MARK: Internal

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true // будет скрываться после остановки
    }

    // MARK: Private

    private let imageUrl = "https://peoplelovescience.com/wp-content/uploads/2017/08/dsc4081-cc.jpg"

    private func fetchImage() {
        guard let url = URL(string: imageUrl) else { return }

//        let session = URLSession.shared // синглтон

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            print("\n",data,"\n")
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}
