# BÀI LÀM – HACKATHON 02

- **Mã đề:** 01
- **Họ tên:** Lê Hồ Thanh Thảo
- **Lớp:** CNTT2
- **Link repository:** 
- **Hệ điều hành (Windows/macOS):** Windows

## 4.2. Thao tác máy tính cơ bản bằng CLI

### Các lệnh đã chạy

```shell
pwd
ls -force
mv .\ghi_chu_ban_giao.txt .\docs\
mkdir backup
cp .\data\dat_san_thang_10.xlsx .\backup\
rm *.tmp


```

### Kết quả liệt kê toàn bộ dự án (Windows: Get-ChildItem -Recurse -Force; macOS: ls -aR)

```text

    Directory: D:\baitaplon\starter-kit\san-bong-website


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         11/9/2026   3:39 PM                backup
d-----         11/9/2026   3:40 PM                data
d-----         11/9/2026   3:38 PM                docs
d-----         11/8/2026   5:33 AM                evidence
d-----         11/9/2026   3:40 PM                logs
d-----         11/9/2026   3:31 PM                web
-a----         11/9/2026   3:31 PM             76 .env
-a----         11/9/2026   3:31 PM           2409 bai_lam.md


    Directory: D:\baitaplon\starter-kit\san-bong-website\backup


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/9/2026   3:31 PM           6074 dat_san_thang_10.xlsx


    Directory: D:\baitaplon\starter-kit\san-bong-website\data


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/9/2026   3:31 PM           6074 dat_san_thang_10.xlsx


    Directory: D:\baitaplon\starter-kit\san-bong-website\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/9/2026   3:31 PM            154 ghi_chu_ban_giao.txt


    Directory: D:\baitaplon\starter-kit\san-bong-website\logs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/9/2026   3:31 PM            956 access.log


    Directory: D:\baitaplon\starter-kit\san-bong-website\web


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         11/9/2026   3:31 PM                images
-a----         11/9/2026   3:31 PM            590 app.js
-a----         11/9/2026   3:31 PM            529 index.html
-a----         11/9/2026   3:31 PM            460 style.css


    Directory: D:\baitaplon\starter-kit\san-bong-website\web\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/9/2026   3:31 PM           3101 logo-san-bong.png

```

## 4.3. Lọc log truy cập website

### a) Lệnh lọc các dòng status=500

```shell
 get-content .\access.log | select-string "status=500" > ./loi_500.txt
 get-content .\loi_500.txt

```

### 2 dòng đầu tiên trong logs/loi_500.txt

```text
2026-10-28 08:24:34 POST /api/thanh-toan status=500
2026-10-28 08:28:45 POST /api/thanh-toan status=500

```

### b) Lệnh đếm số dòng status=404 và kết quả

```shell
(get-content .\access.log | select-string "status=404").count

```

```text
4

```

## 4.4. Chạy script tong_hop (.ps1 hoặc .sh)

### Lệnh chạy (Windows: nếu dùng Phụ lục 2 thì ghi cả 2 lệnh)

```shell
@'
>> # Script: tong_hop.ps1
>> # Tac gia: THANH THAO
>> # Ngay tao: THANH THAO
>> write-host "dang tao bao cao..."
>> "=== BAO CAO SU CO WEBSITE ===" > tong_hop.txt
>> Get-content ./access.log | select-string "status=404" >> tong_hop.txt
>> GET-CONTENT ./access.log | select-string "status=500" | measure-object >> tong_hop.txt
>> write-host "hoan thanh!!!"
>> '@ | set-content ./tong_hop.ps1

 .\tong_hop.ps1

```

### Nội dung file logs/tong_hop.txt

```text
=== BAO CAO SU CO WEBSITE ===

2026-10-28 08:07:39 GET /tin-tuc status=404
2026-10-28 08:13:01 GET /dat-san-cu status=404
2026-10-28 08:34:07 GET /images/san-7.jpg status=404
2026-10-28 08:57:24 GET /khuyen-mai status=404




Count    : 6
Average  :
Sum      :
Maximum  :
Minimum  :
Property :



```

## 4.5. README.md và bảo vệ thông tin bí mật

> README.md, .gitignore và .env.example được chấm trực tiếp trên file ở gốc dự án. Đánh dấu `[x]` vào các mục đã làm để tự kiểm tra.

- [x] README.md: Heading 1, mô tả có **in đậm** và *in nghiêng*, bảng, code block, task list, blockquote
- [x] .gitignore có dòng `.env` (tên file đúng, không có đuôi .txt)
- [x] .env.example có đủ tên biến, giá trị để trống (tên file đúng, không có đuôi .txt)

## 4.6. Kiểm tra trang web bằng DevTools (F12) và báo cáo lỗi

### Bảng lỗi

| STT | Tab DevTools phát hiện lỗi | Tên file hoặc thông báo lỗi | Cách khắc phục |
| --- | --- | --- | --- |
| 1 | Network | Failed to load resource: net::ERR_FILE_NOT_FOUND | thay logo.png bằng đúng tên file ảnh trong thư mục web/images |
| 2 | Console | Uncaught ReferenceError: hienThiBangGia is not defined | Sửa dòng hienThiBangGia thành hienThiBangGiaSan ở dòng 18 file `app.js` |

> Ảnh chụp màn hình lưu trong thư mục `evidence/` (network.png, console.png).

### Báo cáo lỗi gửi trưởng nhóm

- **Context:** Mình đang mở trang web để xem bảng giá và danh sách sân bóng mini. File: `web/index.html` 

- **Expected:** 
    -  Bảng giá hiển thị đầy đủ danh sách các sân (Mã sân, Loại sân, Giá/giờ) được lấy dữ liệu từ hệ thống/API.
    - Trang web khởi tạo thành công, không phát sinh lỗi script trong tab Console.
- **Actual:**  
    -  Bảng giá thuê sân bị trống (chỉ hiển thị hàng tiêu đề: *Mã sân | Loại sân | Giá/giờ (VND)*).
  * Hàm khởi tạo/tải dữ liệu gặp lỗi script dẫn đến việc không render được dữ liệu ra giao diện.

- **Log:**  
   - Failed to load resource: net::ERR_FILE_NOT_FOUND 
   - app.js:18 Uncaught ReferenceError: hienThiBangGia is not defined


### Câu tìm kiếm Google

```text
site:stackoverflow.com "Uncaught ReferenceError: is not defined"

```

## 4.7. Excel

> Phần Excel được chấm trực tiếp trên file `data/dat_san_thang_10.xlsx`, không cần ghi vào đây.
