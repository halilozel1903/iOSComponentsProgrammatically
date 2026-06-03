# iOS Components Programmatically

Swift ve UIKit kullanarak temel iOS bileşenlerini tamamen kodla oluşturmayı gösteren örnek projeler.

## Örnekler

- **LabelProgrammatically**: `UILabel` bileşenini modern UIKit yaklaşımlarıyla, Auto Layout ve Dynamic Type desteğiyle oluşturur.
- **ButtonProgrammatically**: `UIButton.Configuration` kullanan, Auto Layout ile hizalanan modern bir buton örneği içerir.

## Modernizasyon Notları

- Bileşenler sabit `frame` değerleri yerine Auto Layout constraint'leriyle konumlandırılır.
- Sistem renkleri ve Dynamic Type desteği kullanılarak koyu mod ve erişilebilirlik uyumu artırıldı.
- Projeler storyboard'a bağlı kalmadan doğrudan `AppDelegate` üzerinden kök view controller oluşturur.
- Swift dili ayarı Swift 5'e, minimum iOS sürümü iOS 15'e güncellendi.
