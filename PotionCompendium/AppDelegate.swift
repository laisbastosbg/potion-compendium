//
//  AppDelegate.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 14/10/22.
//

import UIKit
import CoreData
import AVFAudio

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var backgroundMusicPlayer: AVAudioPlayer?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        window?.rootViewController = IngredientsGatheringViewController()
//        window?.rootViewController = PotionBrewingViewController()
        window?.makeKeyAndVisible()
        setuptBackgroundMusic()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func setuptBackgroundMusic() {
        if let asset = NSDataAsset(name: "magetheme") {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            backgroundMusicPlayer?.play()
            backgroundMusicPlayer?.numberOfLoops = -1
        }
    }

//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "PotionCompendiumData")
//
//        container.loadPersistentStores(completionHandler: {
//            (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    func saveContext() {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
}
