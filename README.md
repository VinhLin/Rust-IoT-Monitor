# Rust-IoT-Monitor

## Mục tiêu:
- Viết một **console app** bằng ngôn ngữ **Rust**.
- Kiểm tra thiết bị IoT đã kết nối với MQTT Broker *(EMQX)*
- Sau đó sẽ push những thông tin này cho ThingsBoard *(tạo một dashboard sẵn)*
- Nếu một thiết bị đã kết nối và bị disconnect thì sẽ có một notifi tới Telegram.

## TODO:
- [x] Khởi tạo dữ án rust-lang, code theo hướng **bất đồng bộ**.
- [] Lựa chọn thư viện sẽ sử dụng.
- [] Kết nối đến Broker, kiểm tra kết nối của một thiết bị hợp lệ và lấy thông tin thiết bị.
- [] Tạo dashboard trên ThingsBoard.
- [] Đẩy dữ liệu có được sang ThingsBoard.
- [] Notifi Telegram nếu một thiết bị hợp lệ disconnect. 

-----------------------------------------------------------------------------
### Create Project:
```
cargo new rust-iot-monitor
cd rust-iot-monitor
code .
```
- Thêm [thư viện](https://crates.io/):
```
cargo add tokio --features full
cargo add clap --features derive
```

### Library:
- [Tokio](https://github.com/tokio-rs/tokio)
- [Clap](https://github.com/clap-rs/clap)

### Build & Run
- Tạo file `.cargo/config.toml` *(để có thể **cross-compilation** từ Windows chạy app trên Linux)*
```
[build]
target = "x86_64-unknown-linux-musl"

[target.x86_64-unknown-linux-musl]
linker = "rust-lld"
```
- Mình đã tạo ra một file script chạy trên powershell, giúp tự động build và copy file bin sang linux.
```
.\deploy.ps1
```
- Note: Trước khi upload code lên github, cần thực hiện command
```
cargo clean
```










