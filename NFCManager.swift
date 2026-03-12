import Foundation
import CoreNFC

class NFCManager: NSObject, NFCNDEFReaderSessionDelegate, ObservableObject {

    var session: NFCNDEFReaderSession?
    @Published var scannedData: String = ""

    func startScan() {
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session?.alertMessage = "Поднесите NFC карту"
        session?.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                if let text = String(data: record.payload, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.scannedData = text
                    }
                }
            }
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print(error.localizedDescription)
    }
}
