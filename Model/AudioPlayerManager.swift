//
//  AudioPlayerManager.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/21/25.
//

import Foundation
import AVFoundation

class AudioPlayerManager: NSObject {
    
    // MARK: - Properties
    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    
    // Computed properties
    var isPlaying: Bool {
        return audioPlayer?.isPlaying ?? false
    }
    
    var duration: TimeInterval {
        return audioPlayer?.duration ?? 0.0
    }
    
    var currentTime: TimeInterval {
        return audioPlayer?.currentTime ?? 0.0
    }
    
    // MARK: - Init
    override init() {
        super.init()
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Audio Control Methods
    func playAudio(named fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
            print("Audio file not found: \(fileName)")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        playAudioFromURL(url.absoluteString)
    }
    
    func playAudioFromURL(_ urlString: String) {
        // Stop any currently playing audio
        stopAudio()
        
        guard let url = URL(string: urlString) ?? Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Invalid audio URL: \(urlString)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
    }
    
    func resumeAudio() {
        audioPlayer?.play()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
    func seek(to time: TimeInterval) {
           guard let player = audioPlayer else { return }
           
           // Ensure that the time is within the bounds of the audio duration
           let newTime = max(0, min(time, player.duration))
           player.currentTime = newTime
    }
}

// MARK: - AVAudioPlayerDelegate
extension AudioPlayerManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Notify listeners that playback has finished if needed
        NotificationCenter.default.post(name: NSNotification.Name("AudioPlayerDidFinishPlaying"), object: nil)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let error = error {
            print("Audio player decode error: \(error.localizedDescription)")
        }
    }
}
