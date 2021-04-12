import UIKit

func snapshotUrl(file: StaticString, function: String) -> URL {
  return snapshotDirectoryUrl(file: file)
    .appendingPathComponent(String(function.dropLast(2)))
}

func snapshotDirectoryUrl(file: StaticString) -> URL {
  let fileUrl = URL(fileURLWithPath: "\(file)")
  let directoryUrl = fileUrl
    .deletingLastPathComponent()
    .appendingPathComponent("__Snapshots__")
    .appendingPathComponent(fileUrl.deletingPathExtension().lastPathComponent)
  try! FileManager.default.createDirectory(at: directoryUrl, withIntermediateDirectories: true)
  return directoryUrl
}

enum Diff {
  static func images(_ old: UIImage, _ new: UIImage, precision: Float = 1) -> UIImage? {
    if compare(old, new, precision: precision) { return nil }
    return diff(old, new)
  }
}

private func compare(_ old: UIImage, _ new: UIImage, precision: Float) -> Bool {
  guard let oldCgImage = old.cgImage else { return false }
  guard let newCgImage = new.cgImage else { return false }
  guard oldCgImage.width != 0 else { return false }
  guard newCgImage.width != 0 else { return false }
  guard oldCgImage.width == newCgImage.width else { return false }
  guard oldCgImage.height != 0 else { return false }
  guard newCgImage.height != 0 else { return false }
  guard oldCgImage.height == newCgImage.height else { return false }
  let byteCount = oldCgImage.width * oldCgImage.height * 4
  var oldBytes = [UInt8](repeating: 0, count: byteCount)
  guard let oldContext = context(for: oldCgImage, data: &oldBytes) else { return false }
  guard let newContext = context(for: newCgImage) else { return false }
  guard let oldData = oldContext.data else { return false }
  guard let newData = newContext.data else { return false }
  if memcmp(oldData, newData, byteCount) == 0 { return true }
  let newer = UIImage(data: new.pngData()!)!
  guard let newerCgImage = newer.cgImage else { return false }
  var newerBytes = [UInt8](repeating: 0, count: byteCount)
  guard let newerContext = context(for: newerCgImage, data: &newerBytes) else { return false }
  guard let newerData = newerContext.data else { return false }
  if memcmp(oldData, newerData, byteCount) == 0 { return true }
  if precision >= 1 { return false }
  var differentPixelCount = 0
  let threshold = 1 - precision
  for x in 0..<oldCgImage.width {
    for y in 0..<oldCgImage.height * 4 {
      if oldBytes[x + x * y] != newerBytes[x + x * y] { differentPixelCount += 1 }
      if Float(differentPixelCount) / Float(byteCount) > threshold { return false}
    }
  }
  return true
}

private func context(for cgImage: CGImage, data: UnsafeMutableRawPointer? = nil) -> CGContext? {
  guard
    let space = cgImage.colorSpace,
    let context = CGContext(
      data: data,
      width: cgImage.width,
      height: cgImage.height,
      bitsPerComponent: cgImage.bitsPerComponent,
      bytesPerRow: cgImage.bytesPerRow,
      space: space,
      bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
    )
    else { return nil }

  context.draw(cgImage, in: CGRect(x: 0, y: 0, width: cgImage.width, height: cgImage.height))
  return context
}

private func diff(_ old: UIImage, _ new: UIImage) -> UIImage {
  let oldCiImage = CIImage(cgImage: old.cgImage!)
  let newCiImage = CIImage(cgImage: new.cgImage!)
  let differenceFilter = CIFilter(name: "CIDifferenceBlendMode")!
  differenceFilter.setValue(oldCiImage, forKey: kCIInputImageKey)
  differenceFilter.setValue(newCiImage, forKey: kCIInputBackgroundImageKey)
  let differenceCiImage = differenceFilter.outputImage!
  let invertFilter = CIFilter(name: "CIColorInvert")!
  invertFilter.setValue(differenceCiImage, forKey: kCIInputImageKey)
  let invertCiImage = invertFilter.outputImage!
  let context = CIContext()
  let invertCgImage = context.createCGImage(invertCiImage, from: invertCiImage.extent)!
  return UIImage(cgImage: invertCgImage)
}
