
import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController, VoiceOverlayDelegate
{
    
    
let voiceOverlay = VoiceOverlayController()
    
@IBOutlet var myButton: UIButton!
@IBOutlet weak var dictationMessage: UILabel!
@IBOutlet weak var convertedMessage: UILabel!
@IBOutlet weak var textMessage: UILabel!
@IBOutlet weak var convertedText: UILabel!
    
    @IBOutlet var entryField: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var button: UIView!
    
    @IBAction func entryTextEnd(_ sender: UITextField) {
        entryField.resignFirstResponder()
    }



    override func viewDidLoad()
    {
        super.viewDidLoad()
        //myButton.backgroundColor = .systemRed
        //myButton.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func convertButton(_ sender: Any) {
 
        //let inputText = "Hello How are you"
        //self.textMessage.text = inputText
        //self.textMessage.adjustsFontForContentSizeCategory = true
        //self.textMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
        //self.textMessage.numberOfLines = 0
        //self.convertedText.text = inputText
        //self.convertedText.adjustsFontForContentSizeCategory = true
        //self.convertedText.lineBreakMode = NSLineBreakMode.byWordWrapping
        //self.convertedText.numberOfLines = 0

    }
    
        

    @IBAction func didTapbutton(){
        
        func button(_ sender: Any) {
        }
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        }

}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
    }
   

    
    
    @IBAction func didTapButton() {
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStopTimeout = 5
        voiceOverlay.start(on:self, textHandler: {text, final, _ in
            if final{
                print("Final text: \(text)")
                self.dictationMessage.text = text
                self.dictationMessage.adjustsFontForContentSizeCategory = true
                self.dictationMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
                self.dictationMessage.numberOfLines = 0
                //self.convertedMessage.font = UIfont(name: "GALLAUDET", size: UIFont.labelFontSize)
                self.convertedMessage.text = text
                self.convertedMessage.adjustsFontForContentSizeCategory = true
                self.convertedMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
                self.convertedMessage.numberOfLines = 0

            }
            else{
                //print("In progress: \(text)")
            }
        }, errorHandler: {error in
            
        })
    }
    func recording(text: String?, final: Bool?, error: Error?){
        
    }
    
   
    
    
}
    

