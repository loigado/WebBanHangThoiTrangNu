# 🌸 Women's Fashion E-commerce - Dự Án Web Thời Trang Nữ

![Project Banner](https://img.shields.io/badge/Spring%20Boot-3.4.0-brightgreen?style=for-the-badge&logo=springboot)
![Java](https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=java)
![SQL Server](https://img.shields.io/badge/MS%20SQL%20Server-2022-red?style=for-the-badge&logo=microsoftsqlserver)
![Spring Security](https://img.shields.io/badge/Security-OAuth2-blue?style=for-the-badge&logo=springsecurity)

Chào mừng bạn đến với dự án **Women's Fashion E-commerce**! Đây là một nền tảng thương mại điện tử chuyên biệt dành cho thời trang nữ, được xây dựng với mục tiêu mang lại trải nghiệm mua sắm mượt mà, bảo mật và hiện đại. Dự án được triển khai bằng hệ sinh thái **Spring Boot** mạnh mẽ.

---

## 🚀 Tính Năng Chính

### 🛒 Dành cho Khách hàng (User)
- **Trang Chủ Hiện Đại:** Hiển thị sản phẩm mới nhất, sản phẩm nổi bật và các chương trình khuyến mãi.
- **Danh Mục Sản Phẩm (Shop):** Bộ lọc thông minh theo danh mục, giá cả và tìm kiếm sản phẩm.
- **Chi Tiết Sản Phẩm:** Thông tin chi tiết, hình ảnh sắc nét và tính năng thêm vào giỏ hàng.
- **Giỏ Hàng (Shopping Cart):** Quản lý số lượng, cập nhật và tính toán tổng tiền thời gian thực.
- **Hệ Thống Tài Khoản:**
  - Đăng ký/Đăng nhập bảo mật.
  - **Social Login:** Hỗ trợ đăng nhập nhanh qua Google/Facebook (OAuth2).
  - **Quên Mật Khẩu:** Tích hợp gửi mã xác nhận qua Email để khôi phục mật khẩu.
  - Quản lý hồ sơ cá nhân.
- **Thanh Toán (Checkout):** Quy trình đặt hàng nhanh chóng và chính xác.

### 🛡️ Dành cho Quản Trị Viên (Admin)
- **Dashboard:** Thống kê báo cáo doanh thu, sản phẩm bán chạy và tăng trưởng người dùng.
- **Quản Lý Sản Phẩm (CRUD):** Thêm mới, cập nhật thông tin, hình ảnh và trạng thái hàng hóa.
- **Quản Lý Danh Mục:** Phân loại sản phẩm linh hoạt.
- **Quản Lý Đơn Hàng:** Theo dõi trạng thái đơn hàng (Chờ xác nhận, Đang giao, Hoàn thành).
- **Quản Lý Người Dùng:** Phân quyền và quản lý tài khoản khách hàng.

---

## 🛠️ Công Nghệ Sử Dụng

| Tầng (Layer) | Công Nghệ |
| :--- | :--- |
| **Backend** | Spring Boot 3.x, Spring Data JPA, Spring MVC |
| **Bảo Mật** | Spring Security, OAuth2 (Google/Facebook) |
| **Frontend** | JSP, JSTL, Bootstrap 5, CSS3, JavaScript |
| **Cơ Sở Dữ Liệu** | Microsoft SQL Server |
| **Dịch Vụ** | Spring Mail (Gmail SMTP) |
| **Công Cụ** | Maven, Lombok, DevTools |

---

## 🏗️ Kiến Trúc Dự Án

Dự án tuân thủ mô hình **MVC (Model-View-Controller)** chuẩn mực để đảm bảo tính dễ bảo trì và mở rộng:
- **Controller:** Xử lý các request từ người dùng và điều phối dữ liệu.
- **Service Layer:** Chứa logic nghiệp vụ xử lý dữ liệu phức tạp.
- **Repository (DAO):** Tương tác với SQL Server thông qua Spring Data JPA.
- **Entity:** Ánh xạ các bảng trong database thành các đối tượng Java.
- **DTO/Model:** Chuyển đổi dữ liệu an toàn giữa các tầng.

---

## ⚙️ Hướng Dẫn Cài Đặt

### 📋 Yêu cầu hệ thống
- JDK 17+
- Microsoft SQL Server
- IDE (Eclipse, IntelliJ IDEA, hoặc VS Code)
- Maven

### 🏃 Các bước thực hiện
1. **Clone dự án:**
   ```bash
   git clone https://github.com/your-username/duan1-webthoitrangnu.git
   ```
2. **Cấu hình Database:**
   - Chạy script SQL trong file `DuAn1.sql` để tạo database và dữ liệu mẫu.
   - Cập nhật thông tin kết nối trong `src/main/resources/application.properties`:
     ```properties
     spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=DB_DuAn1
     spring.datasource.username=sa
     spring.datasource.password=your_password
     ```
3. **Cấu hình Email & OAuth2:**
   - Cập nhật Client ID/Secret cho Google/Facebook trong `application.properties` để dùng tính năng đăng nhập mạng xã hội.
4. **Chạy ứng dụng:**
   - Sử dụng lệnh Maven: `mvn spring-boot:run`
   - Hoặc chạy file `DuAn1Application.java` từ IDE.
   - Truy cập: `http://localhost:8080`

---

## 📸 Ảnh Chụp Giao Diện (Screenshots)
*(Bạn hãy thay thế các link ảnh dưới đây bằng ảnh thực tế của dự án để gây ấn tượng mạnh nhất)*

| Trang Chủ | Chi Tiết Sản Phẩm | Admin Dashboard |
| :---: | :---: | :---: |
| <img width="1800" height="900" alt="shop" src="https://github.com/user-attachments/assets/34785d9f-96a1-454b-b535-06c64d35aa38" />  | <img width="1800" height="900" alt="detial" src="https://github.com/user-attachments/assets/e207bfa1-4826-4346-b71f-d091ff38655d" /> | <img width="1800" height="900" alt="admin" src="https://github.com/user-attachments/assets/83e7daa0-c07f-4df3-b36f-714ded59a3bc" /> |

---

## 🤝 Liên Hệ
- **Tác giả:** Lê Tấn Lợi
- **Email:** [loiltps33442@fpt.edu.vn](mailto:loiltps33442@fpt.edu.vn)
- **LinkedIn:** [linkedin.com/in/yourprofile](https://linkedin.com/in/yourprofile)

---
*Dự án này là minh chứng cho kỹ năng lập trình hướng đối tượng, quản lý cơ sở dữ liệu và xây dựng ứng dụng web hiện đại của tôi. Rất mong nhận được phản hồi từ các bạn!*
