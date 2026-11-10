## 🚀 Hướng dẫn cài đặt và chạy ứng dụng

### Yêu cầu môi trường
* Đã cài đặt **Flutter SDK** (khuyến nghị $\ge$ 3.13.0).
* Trình soạn thảo: **VS Code** hoặc **Android Studio** (đã cài Flutter & Dart extension).

### Các bước thực hiện

1. Mở thư mục dự án trong terminal hoặc VS Code:
   
2. Tải các gói thư viện cần thiết:
   ```bash
   flutter pub get
   ```

3. Chạy ứng dụng trên thiết bị (Emulator, Chrome hoặc máy thật kết nối cáp):
   ```bash
   # Chạy trên trình duyệt Chrome
   flutter run -d chrome

   # Hoặc chạy trên thiết bị đang kết nối
   flutter run
   ```

---

## 📂 Cấu trúc thư mục mã nguồn

```text
demo_form/
├── lib/
│   └── main.dart            # Toàn bộ mã nguồn: 3 hàm validator, RegisterPage và UI
├── pubspec.yaml             # Cấu hình dự án và dependencies Flutter
└── README.md                # Cài đặt và chạy app
```
