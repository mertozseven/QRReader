import UIKit
import VisionKit

public class QRReader: NSObject {
    
    // MARK: - Properties
    public var overlayColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    public var cornerColor: UIColor = .systemGreen
    public var instructionText: String = "Align the QR code within the frame to scan"
    public var padding: CGFloat = 8
    public var windowSize: CGFloat = 250
    
    private var scanCompletion: ((String) -> Void)?
    private var dataScannerViewController: DataScannerViewController?
    
    // MARK: - Inits
    public override init() {
        super.init()
    }
    
    // MARK: - Public Methods
    @MainActor public func isScanningAvailable() -> Bool {
        return DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    
    @MainActor public func presentScanner(from viewController: UIViewController, completion: @escaping (String) -> Void) {
        self.scanCompletion = completion
        
        guard isScanningAvailable() else {
            print("Scanner not available on this device")
            return
        }
        
        let scannerVC = QRScannerViewController()
        scannerVC.delegate = self
        scannerVC.overlayColor = overlayColor
        scannerVC.cornerColor = cornerColor
        scannerVC.instructionText = instructionText
        scannerVC.padding = padding
        scannerVC.windowSize = windowSize
        
        viewController.present(scannerVC, animated: true)
    }
}

// MARK: - QRScannerViewControllerDelegate Methods
extension QRReader: QRScannerViewControllerDelegate {
    func qrScannerDidCancel() {
        
    }
    
    func qrScanner(didScanCode code: String) {
        scanCompletion?(code)
    }
} 
