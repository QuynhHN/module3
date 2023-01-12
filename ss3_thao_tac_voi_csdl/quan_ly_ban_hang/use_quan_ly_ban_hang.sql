use `quan_ly_ban_hang`;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, o_date, o_totalprice from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c_name as 'khách hàng', p_name as 'sản phẩm'
from order_detail
inner join `order` on order_detail.o_id = `order`.o_id
inner join product on order_detail.p_id = product.p_id
inner join customer on customer.c_id = `order`.c_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_name from customer
left join `order` on customer.c_id = `order`.c_id
where `order`.c_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id, `order`.o_date, order_detail.od_qty*product.p_price as o_totalprice 
from order_detail
inner join `order` on order_detail.o_id = `order`.o_id
inner join product on order_detail.p_id = product.p_id;