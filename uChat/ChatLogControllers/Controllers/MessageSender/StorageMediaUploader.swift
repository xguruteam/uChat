//
//  StorageMediaUploader.swift
//  uChat-project
//
//  Created by Luccas Beck on 5/19/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit
import Firebase

class StorageMediaUploader: NSObject {
  
  func upload(_ image: UIImage, progress: ((_ progress: StorageTaskSnapshot?) -> Void)? = nil, completion: @escaping (_ imageUrl: String) -> ()) {
    let imageName = UUID().uuidString
    let ref = Storage.storage().reference().child("messageImages").child(imageName)

    guard let uploadData =  image.jpegData(compressionQuality: 1) else { return }
    let uploadTask = ref.putData(uploadData, metadata: nil, completion: { (metadata, error) in
      guard error == nil else { return }
      
      ref.downloadURL(completion: { (url, error) in
        guard error == nil, let imageURL = url else { completion(""); return }
        completion(imageURL.absoluteString)
      })
    })
    uploadTask.observe(.progress) { (progressSnap) in
      progress!(progressSnap)
    }
  }
  
  func upload(_ uploadData: Data, progress: ((_ progress: StorageTaskSnapshot?) -> Void)? = nil, completion: @escaping (_ videoUrl: String) -> ()) {
    
    let videoName = UUID().uuidString + ".mov"
    let ref = Storage.storage().reference().child("messageMovies").child(videoName)
    
    let uploadTask = ref.putData(uploadData, metadata: nil, completion: { (metadata, error) in
      guard error == nil else { return }
      ref.downloadURL(completion: { (url, error) in
        guard error == nil, let videoURL = url else { completion(""); return }
        completion(videoURL.absoluteString)
      })
    })
    uploadTask.observe(.progress) { (progressSnap) in
      progress!(progressSnap)
    }
  }
}

