
import UIKit
import MediaPlayer


class ViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        //requesting authorization
        MPMediaLibrary.requestAuthorization{
            (status) in
            
            if status == .authorized{
            self.playSong(genre: sender.currentTitle!)
            }
        }
        playSong(genre: sender.currentTitle!)
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func playSong(genre: String)
    {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predict = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predict)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        
        
    }
    
}
