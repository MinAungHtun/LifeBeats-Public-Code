//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Sai Kambampati on 3/18/20.
//  Copyright © 2020 Sai Kambmapati. All rights reserved.
//

import SwiftUI
import MediaPlayer
import SDWebImageSwiftUI

struct PlayerView: View {
    @Binding var musicPlayer: MPMusicPlayerController
    @State private var isPlaying = false
    @Binding var currentSong: Song

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 24) {
                WebImage(url: URL(string: self.currentSong.artworkURL.replacingOccurrences(of: "{w}", with: "\(Int(geometry.size.width - 24) * 2)").replacingOccurrences(of: "{h}", with: "\(Int(geometry.size.width - 24) * 2)")))
                    .resizable()
                    .frame(width: geometry.size.width - 120, height: 170)
                    .cornerRadius(20)
                    .shadow(radius: 10).padding(.leading, 10)
                
                VStack(spacing: 8) {
                    Text(self.musicPlayer.nowPlayingItem?.title ?? "Choose a Song (!!Apple Music under maintenance)")
                        .font(Font.system(.headline).bold())
                        .multilineTextAlignment(.center).padding(.leading, 50)
                    Text(self.musicPlayer.nowPlayingItem?.artist ?? "")
                        .font(.system(.headline))
                }
                
                HStack(spacing: 50) {
                    Button(action: {
                        if self.musicPlayer.currentPlaybackTime < 5 {
                            self.musicPlayer.skipToPreviousItem()
                        } else {
                            self.musicPlayer.skipToBeginning()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 55, height: 55)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "backward.fill").resizable().frame(width: 18, height: 20)
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }

                    Button(action: {
                        if self.musicPlayer.playbackState == .paused || self.musicPlayer.playbackState == .stopped {
                            self.musicPlayer.play()
                            self.isPlaying = true
                            GlobalPlayer.sharedInstance.appleMusic = true
                        } else {
                            self.musicPlayer.pause()
                            self.isPlaying = false
                        }
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 55, height: 55)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: self.isPlaying ? "pause.fill" : "play.fill").resizable().frame(width: 18, height: 20)
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }

                    Button(action: {
                        self.musicPlayer.skipToNextItem()
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 55, height: 55)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "forward.fill").resizable().frame(width: 18, height: 20)
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                }.padding(.leading, 50)//.padding(.bottom, 150)

            }
        }
        .onAppear() {
            if self.musicPlayer.playbackState == .playing {
                self.isPlaying = true
            } else {
                self.isPlaying = false
            }
        }
    }
}
