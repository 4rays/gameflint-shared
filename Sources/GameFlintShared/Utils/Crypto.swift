import Foundation

#if os(iOS) || os(macOS)
import CryptoKit
#elseif os(Linux)
import Crypto
#endif

public func base64SignedDigest(
  of value: String,
  key: String
) -> String? {
  guard
    let keyData = key.data(using: .utf8),
    let valueData = value.data(using: .utf8)
  else { return nil }

  let symmetricKey = SymmetricKey(data: keyData)
  let digest = HMAC<SHA256>.authenticationCode(for: valueData, using: symmetricKey)

  return digest
    .compactMap { String(format: "%02x", $0) }
    .joined()
    .data(using: .utf8)?
    .base64EncodedString()
}

