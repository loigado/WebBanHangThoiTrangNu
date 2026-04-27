package edu.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.Category;
import edu.poly.entity.Product;
import edu.poly.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Integer>{

    // 1. Tìm theo khoảng giá (Chỉ lấy hàng chưa xóa)
    List<Product> findByPriceBetweenAndIsDeleteFalse(double min, double max);
	
    // 2. Hàm này của bạn đã đúng rồi (vì có WHERE o.isDelete = false)
    @Query("select o from Product o where o.isDelete = false")
    List<Product> findAllRandom();
	
    // 3. Tìm kiếm kết hợp phân trang (Thêm AndIsDeleteFalse vào đuôi)
    Page<Product> findAllByNameLikeAndCategoryIdLikeAndPriceBetweenAndIsDeleteFalse(String name, String category, Integer price1, Integer price2, Pageable page);
	
    Page<Product> findAllByNameLikeAndCategoryIdLikeAndPriceGreaterThanEqualAndIsDeleteFalse(String name, String category, Integer price, Pageable page);
	
    Page<Product> findAllByNameLikeAndCategoryIdLikeAndIsDeleteFalse(String name, String category, Pageable page);
	
    // 4. Tìm theo tên
    List<Product> findAllByNameLikeAndIsDeleteFalse(String name);
	
    // 5. Tìm theo danh mục
    List<Product> findByCategoryAndIsDeleteFalse(Category category);
	
    // 6. Thống kê (Hàm này thì nên để nguyên để admin xem báo cáo tổng quan cả hàng đã xóa)
    @Query("select new Report(o.category.name, sum(o.price), count(o)) from Product o group by o.category.name order by sum(o.price) desc")
    List<Report> getInventoryByCategory();
}