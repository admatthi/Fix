//
//  HomeViewController.swift
//  Physical Therapy App
//
//  Created by Alek Matthiessen on 7/13/20.
//  Copyright © 2020 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher
var selectedgenre = String()
var selectedindex = Int()
var genres = [String]()


        var bookindex = Int()
        var selectedauthorname = String()
        var selectedtitle = String()
        var selectedurl = String()
        var selectedbookid = String()
        var selectedamazonurl = String()
        var selecteddescription = String()
        var selectedduration = String()
        var selectedheadline = String()
        var selectedprofession = String()
        var selectedauthorimage = String()
        var selectedbackground = String()

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var backimage2: UIImageView!
    @IBOutlet weak var titleCollectionView: UICollectionView!
    @IBOutlet weak var backimage: UIImageView!
    
    var books: [Book] = [] {
        didSet {
            
            self.titleCollectionView.reloadData()
            
        }
    }
    var genreindex = Int()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case self.genreCollectionView:
            return genres.count
        case self.titleCollectionView:
            return books.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        refer = "On Tap Discover"
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        self.view.endEditing(true)
        titleCollectionView.isUserInteractionEnabled = true
        
        if collectionView.tag == 1 {
            
            selectedindex = indexPath.row
            
            genreCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            
            collectionView.alpha = 0
            
            selectedgenre = genres[indexPath.row]
            
            
            genreindex = indexPath.row
            
            queryforids { () -> Void in
                
            }
            
            //            titleCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
            
            
            genreCollectionView.reloadData()
            
        } else {
            
            let book = self.book(atIndexPath: indexPath)
            
            //
            //                headlines.removeAll()
            //
                            bookindex = indexPath.row
                            selectedauthorname = book?.author ?? ""
                            selectedtitle = book?.title ?? ""
                            selectedurl = book?.videoURL ?? ""
                            selectedbookid = book?.bookID ?? ""
                            selectedgenre = book?.genre ?? ""
                            selectedamazonurl = book?.amazonURL ?? ""
                            selecteddescription = book?.description ?? ""
                            selectedheadline = book?.headline1 ?? ""
                            selectedprofession = book?.profession ?? ""
                            selectedauthorimage = book?.authorImage ?? ""
                            selectedbackground = book?.imageURL ?? ""
            //
            //
            //                headlines.append(book?.headline1 ?? "x")
            //                headlines.append(book?.headline2 ?? "x")
            //                headlines.append(book?.headline3 ?? "x")
            //                headlines.append(book?.headline4 ?? "x")
            //                headlines.append(book?.headline5 ?? "x")
            //                headlines.append(book?.headline6 ?? "x")
            //                headlines.append(book?.headline7 ?? "x")
            //                headlines.append(book?.headline8 ?? "x")
            //
            //                headlines = headlines.filter{$0 != "x"}
            
            let alert = UIAlertController(title: "What would you like to do?", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Read", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            alert.addAction(UIAlertAction(title: "Listen", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                    self.performSegue(withIdentifier: "DiscoverToWrite", sender: self)
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
            
            self.performSegue(withIdentifier: "DiscoverToWrite", sender: self)
            
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        // Genre collection
        case self.genreCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories", for: indexPath) as! GenreCollectionViewCell
            
            collectionView.alpha = 1
            cell.titlelabel.text = genres[indexPath.row]
            //            cell.titlelabel.sizeToFit()
            
            cell.selectedimage.layer.cornerRadius = 10.0
            cell.selectedimage.layer.masksToBounds = true
            
            
            
            genreCollectionView.alpha = 1
            
            if selectedindex == 0 {
                
                if indexPath.row == 0 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
            }
            
            if selectedindex == 1 {
                
                if indexPath.row == 1 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 2 {
                
                if indexPath.row == 2 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 3 {
                
                if indexPath.row == 3 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 4 {
                
                if indexPath.row == 4 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
            }
            
            if selectedindex == 5 {
                
                if indexPath.row == 5 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 6 {
                
                if indexPath.row == 6 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 7 {
                
                if indexPath.row == 7 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            if selectedindex == 8 {
                
                if indexPath.row == 8 {
                    
                    cell.titlelabel.alpha = 1
                    cell.selectedimage.alpha = 1
                    
                } else {
                    
                    cell.titlelabel.alpha = 0.25
                    cell.selectedimage.alpha = 0
                    
                }
                
            }
            
            
            if selectedindex == 1000 {
                
                cell.titlelabel.alpha = 0.25
                cell.selectedimage.alpha = 0
            }
            
            return cell
            
        case self.titleCollectionView:
            let book = self.book(atIndexPath: indexPath)
            titleCollectionView.alpha = 1
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Books", for: indexPath) as! TitleCollectionViewCell
            //
            //            if book?.bookID == "Title" {
            //
            //                return cell
            //
            //            } else {
            
            
            cell.layer.cornerRadius = 10.0
            cell.clipsToBounds = true
            
            let duration = book?.duration ?? 15
            
            cell.titlelabel.text = book?.title ?? "x"
            cell.upvoteslabel.text = "\(duration)m"
//            cell.promptlabel.text = book?.headline1 ?? "x"
            
            //                cell.tapup.tag = indexPath.row
            //
            //                cell.tapup.addTarget(self, action: #selector(DiscoverViewController.tapWishlist), for: .touchUpInside)
            
            if let imageURLString = book?.imageURL, let imageUrl = URL(string: imageURLString) {
                
                                cell.titleImage.kf.setImage(with: imageUrl)
                //                cell.backlabel.kf.setImage(with: imageUrl)
                
                var randomint = Int.random(in: 10..<100)
                
//                cell.titleImage.layer.borderColor = UIColor.white.cgColor
//                cell.titleImage.layer.borderWidth = 3.5
                
                cell.viewslabel.text = "\(String(randomint))K"
                
                //                cell.titleImage.layer.cornerRadius = 5.0
                cell.titleImage.clipsToBounds = true
                //                cell.titleImage.alpha = 1
                
                
                
                //
                //                                    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                //                                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                //                                    blurEffectView.frame = cell.backlabel.bounds
                //                                    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                //                                    cell.backlabel.addSubview(blurEffectView)
                //
                
            }
            
            let isWished = Bool()
            
            
            
            
            
            
            
            return cell
            
            //            }
            
        default:
            
            return UICollectionViewCell()
        }
        
    }
    
    
    
    @IBOutlet weak var depression: UIImageView!
    var selectedindex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genres.removeAll()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backimage.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backimage.addSubview(blurEffectView)
        
        let blurEffect2 = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView2 = UIVisualEffectView(effect: blurEffect2)
        blurEffectView2.frame = backimage2.bounds
        blurEffectView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backimage2.addSubview(blurEffectView2)
        //                            genres.append("Depression")
        //                            genres.append("Insecurity")
        //                            genres.append("Panic")
        //                            genres.append("Anxiety")
        //                            genres.append("Nervous")
        //                            genres.append("Grieving")
        //                            genres.append("Addiction")
        //                            genres.append("Anger")
        
        genres.append("All")
        genres.append("Back")
        genres.append("Shoulder")
        genres.append("Knee")
        genres.append("Wrist")
        genres.append("Neck")
        
        
        ref = Database.database().reference()
        
        queryforinfo()
        
        selectedgenre = "All"
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        let result = dateFormatter.string(from: date)
        
        
        //        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        //        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //        blurEffectView.frame = backimage.bounds
        //        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        backimage.addSubview(blurEffectView)
        //
        
        
        if selectedgenre == "" || selectedgenre == "None" {
            
            selectedgenre = "Money"
            
            selectedindex = genres.firstIndex(of: selectedgenre)!
            
            genreCollectionView.reloadData()
            
        } else {
            
            print(selectedindex)
            
            selectedindex = genres.firstIndex(of: selectedgenre)!
            
            genreCollectionView.reloadData()
            
        }
        
        titleCollectionView.reloadData()
        
        //        addstaticbooks()
        
        
        
        //        dayofmonth = "15"
        
        
        var screenSize = titleCollectionView.bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 10, right: 0)
        //        layout.itemSize = CGSize(width: screenWidth/2.3, height: screenWidth/1.35)
        
        layout.itemSize = CGSize(width: screenWidth/2.3, height: screenWidth/1.7)

        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        titleCollectionView!.collectionViewLayout = layout
        
        
        queryforids { () -> Void in
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    func queryforids(completed: @escaping (() -> Void) ) {
        
        titleCollectionView.alpha = 0
        
        var functioncounter = 0
        
        
        
        ref?.child("Plans").child(selectedgenre).observeSingleEvent(of: .value, with: { (snapshot) in
            
            var value = snapshot.value as? NSDictionary
            
            print (value)
            
            if let snapDict = snapshot.value as? [String: AnyObject] {
                
                let genre = Genre(withJSON: snapDict)
                
                if let newbooks = genre.books {
                    
                    self.books = newbooks
                    
                    self.books = self.books.sorted(by: { $0.popularity ?? 0  > $1.popularity ?? 0 })
                    
                }
                
                //                                for each in snapDict {
                //
                //                                    functioncounter += 1
                //
                //                                    let ids = each.key
                //
                //                                    seemoreids.append(ids)
                //
                //
                //                                    if functioncounter == snapDict.count {
                //
                //                                        self.updateaudiostructure()
                //
                //                                    }
                //                                }
                
            }
            
        })
    }
    
    func queryforinfo() {
        
        ref?.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            
            
            
            if let purchased = value?["Purchased"] as? String {
                
                if purchased == "True" {
                    
                    didpurchase = true
                    
                } else {
                    
                    didpurchase = false
                    self.performSegue(withIdentifier: "DailyToSale", sender: self)

                    
                }
                
            } else {
                
                didpurchase = false
                self.performSegue(withIdentifier: "DailyToSale", sender: self)

            }
            
        })
        
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

    extension HomeViewController {
        func book(atIndex index: Int) -> Book? {
            if index > books.count - 1 {
                return nil
            }

            return books[index]
        }

        func book(atIndexPath indexPath: IndexPath) -> Book? {
            return self.book(atIndex: indexPath.row)
        }
    }