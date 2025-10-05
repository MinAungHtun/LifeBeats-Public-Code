//
//  SceneDelegate.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/1/20.


import UIKit
import SwiftUI
import FirebaseAnalytics
import ActivityKit
import GoogleMobileAds
import FacebookCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate, SPTAppRemoteDelegate, GADRewardedAdDelegate {
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        print("SS")
        
        
    }
    
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        print("connected")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("didFailConnectionAttemptWithError")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("didDisconnectWithError")
    }
    
    @Published var widgetFlag : Bool = false
    @Published var FebeFlag : Bool = false //false(production)
    @Published var widgetFlagNo : Int = 0
    static private let kAccessTokenKey = "access-token-key"
    private let redirectUri = URL(string:"LifeBeats://LogInReturn")!
    private let clientIdentifier = "f1a930e7964045a1964d337bc72d778f"
    
    var escaped:Bool = false
    
    var accessToken = UserDefaults.standard.string(forKey: kAccessTokenKey) {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(accessToken, forKey: SceneDelegate.kAccessTokenKey)
        }
    }

    lazy var appRemote: SPTAppRemote = {
        print("App remote")
        let configuration = SPTConfiguration(clientID: self.clientIdentifier, redirectURL: self.redirectUri)
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.connectionParameters.accessToken = self.accessToken
        appRemote.delegate = self
        //print(self.accessToken)
        return appRemote
    }()
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        
        ApplicationDelegate.shared.application(
                UIApplication.shared,
                open: url,
                sourceApplication: nil,
                annotation: [UIApplication.OpenURLOptionsKey.annotation]
            )
        
        print("scene 1")
        let parameters = appRemote.authorizationParameters(from: url);

        if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = access_token
            self.accessToken = access_token
           // print(self.accessToken)
            //print("SSS")
            GlobalPlayer.sharedInstance.spotify = true
            appRemote.connect()
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(errorDescription)
        }

        maybeOpenedFromWidget(urlContexts: URLContexts)
        maybeOpenedFromWidget1(urlContexts: URLContexts)
        maybeOpenedFromWidget2(urlContexts: URLContexts)
        maybeOpenedFromWidget3(urlContexts: URLContexts)
        maybeOpenedFromWidget4(urlContexts: URLContexts)
        maybeOpenedFromWidget5(urlContexts: URLContexts)
        maybeOpenedFromWidget6(urlContexts: URLContexts)
        maybeOpenedFromWidget7(urlContexts: URLContexts)
        maybeOpenedFromWidget8(urlContexts: URLContexts)
        maybeOpenedFromWidget9(urlContexts: URLContexts)
        maybeOpenedFromWidget10(urlContexts: URLContexts)
        maybeOpenedFromWidget11(urlContexts: URLContexts)
        maybeOpenedFromWidget12(urlContexts: URLContexts)
        maybeOpenedFromWidget13(urlContexts: URLContexts)
        maybeOpenedFromWidget14(urlContexts: URLContexts)
        maybeOpenedFromWidget15(urlContexts: URLContexts)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: HomeBuffer().environmentObject(UserData()))
            self.window = window
            window.makeKeyAndVisible()
        }
        maybeOpenedFromWidget(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget1(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget2(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget3(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget4(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget5(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget6(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget7(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget8(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget9(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget10(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget11(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget12(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget13(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget14(urlContexts: connectionOptions.urlContexts)
        maybeOpenedFromWidget15(urlContexts: connectionOptions.urlContexts)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("Scene did disconnect")
       // GlobalPlayer.sharedInstance.stopMusic()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("Scene did become active")
        UIApplication.shared.isIdleTimerDisabled = true
        if(self.escaped == true)
        {
        GlobalPlayer.sharedInstance.continueMusic()
       //    UserTimer.sharedInstance.timerStarts()
        self.escaped = false
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("Scene will resign active")
        //if(GlobalPlayer.sharedInstance.spotifyAuth == false)
        //{
        
//        let state = WidgetAttribute.ContentState(status: .pause)
//        let attribute = WidgetAttribute(therapyId: 1, therapyName: "something")
//        
//        if #available(iOS 16.1, *) {
//            let activity = try? Activity<WidgetAttribute>.request(attributes: attribute, contentState: state, pushType: nil)
//         
//        Task
//        {
//            await activity?.end(using: state, dismissalPolicy: .immediate)
//        }
//        } else {
//            // Fallback on earlier versions
//            print("Nothing")
//        }
        
        
        if(GlobalPlayer.sharedInstance.playing == true)
        {
            GlobalPlayer.sharedInstance.pauseMusic()
            self.escaped = true
        }
        //}
           // UserTimer.sharedInstance.timerStops()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("Scene will enter foreground")
        if(self.escaped == true)
        {
        GlobalPlayer.sharedInstance.continueMusic()
       //     UserTimer.sharedInstance.timerStarts()
        self.escaped = false
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("Scene did enter background")
        ////if(GlobalPlayer.sharedInstance.spotifyAuth == false)
        ////{
        if(GlobalPlayer.sharedInstance.playing == true)
        {
            
            GlobalPlayer.sharedInstance.pauseMusic()
            self.escaped = true
        }
        ////}
       //UserTimer.sharedInstance.timerStops()
    }
    
    private func maybeOpenedFromWidget(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 17
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget1(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink1" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 14
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget2(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink2" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 7
        Analytics.setScreenName("Widget", screenClass: "Main")
    }

    private func maybeOpenedFromWidget3(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "Febe" }) else { return }
        print("🚀 Launched from widget")
        //self.widgetFlag = true
        self.FebeFlag = true
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget4(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink3" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 21
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget5(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink4" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 12
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget6(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink5" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 22
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget7(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink6" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 18
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget8(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink7" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 31
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget9(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink8" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 32
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget10(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink9" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 29
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget11(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink10" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 16
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget12(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink11" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 8
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget13(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink12" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 24
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget14(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink13" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 11
        Analytics.setScreenName("Widget", screenClass: "Main")
    }
    
    private func maybeOpenedFromWidget15(urlContexts: Set<UIOpenURLContext>) {
        guard let _: UIOpenURLContext = urlContexts.first(where: { $0.url.scheme == "widget-deeplink14" }) else { return }
        print("🚀 Launched from widget")
        self.widgetFlag = true
        self.widgetFlagNo = 33
        Analytics.setScreenName("Widget", screenClass: "Main")
    }

}

