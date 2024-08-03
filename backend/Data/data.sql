-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2023 at 09:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
DROP database campathon;
CREATE DATABASE campathon;
USE campathon;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
	`id` INTEGER NOT NULL AUTO_INCREMENT,
	`fullname` VARCHAR(255) NOT NULL,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`isAdmin` SMALLINT NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `isAdmin`) VALUES
(1, 'Alice Johnson', 'alice', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(2, 'Bob Smith', 'bob', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(3, 'Charlie Brown', 'charlie', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(4, 'Dave Wilson', 'dave', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(5, 'Eve Davis', 'eve', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(6, 'Frank Miller', 'frank', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(7, 'Grace Lee', 'grace', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(8, 'Hank Green', 'hank', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(9, 'Ivan Harris', 'ivan', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(10, 'Judy Clark', 'judy', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(11, 'Kyle Young', 'kyle', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(12, 'Laura Adams', 'laura', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(13, 'LA', 'A', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(0, 'flash', 'admin', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',1);
-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(127) NOT NULL,
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Kim loại'),
(2, 'Giấy'),
(3, 'Thủy tinh'),
(4, 'Nhựa'),
(5, 'Bìa các tông'),
(6,'other');
-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` INTEGER NOT NULL AUTO_INCREMENT,
  `user_created` INTEGER NOT NULL,
  `post_title` varchar(127) NOT NULL,
  `post_text` text NOT NULL,
  `cover_url` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
   primary key (post_id),
   FOREIGN KEY (user_created) REFERENCES USERS(id) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`user_created`, `post_title`, `post_text`, `cover_url`) VALUES
(1, '3R là gì? Ý nghĩa và Thực trạng của phương pháp 3R tại Việt Nam',
'
1. Định nghĩa 3r là gì?
3r là gì? 3r là từ viết tắt của Reduce – Reuse- Recycle được hiểu là Tiết giảm – Tái sử dụng – Tái chế. Đây cũng là lý do mà 3r được gọi với cái tên khác là 3t. Phương pháp 3r chính là giải pháp về môi trường mà rất nhiều quốc gia trên thế giới đang ứng dụng để bảo vệ và hạn chế sự ô nhiễm môi trường. Mỗi bộ phận trong 3r đều mang những ý nghĩa nhất định:
	+ Reduce:(tiết giảm): sự thay đổi lối sống, cách tiêu dùng và sự cải tiến trong quy trình sản xuất… sẽ làm giảm lượng chất thải phát sinh ra môi trường. Lượng sản phẩm tạo ra lớn nhất, tài nguyên được sử dụng hiệu quả nhất nhưng lượng chất thải tạo ra lại ít nhất là sự tối ưu hóa cần thiết.
	+ Reuse (tái sử dụng): tận dụng tối đa tuổi thọ của các sản phẩm và sử dụng nó để phục vụ các mục đích khác nhau nhằm tiết kiệm tối đa.
	+ Recycle (tái chế): bằng sự sáng tạo mà tận dụng những rác thải, vật liệu thải đi để làm ra các sản phẩm khác có ích.
	https://vinausen.com/wp-content/uploads/2024/03/3r-la-gi-3.jpeg

2. Ý nghĩa của 3r là gì
Sau khi nắm được khái niệm 3r là gì, chúng ta cũng cần tìm hiểu về ý nghĩa của phương pháp 3r này. Hiện nay, mô hình 3r được ứng dụng tại rất nhiều quốc gia trên thế giới, đặc biệt là các nước phát triển. Chắc chắn, 3r đem lại những hiệu quả đáng kể mới khiến nó được ứng dụng nhiều như vậy.
Bạn nghi ngờ về những ý nghĩa của 3r đem lại cho các lĩnh vực kinh tế, xã hội… ở mỗi quốc gia. Vậy thì dưới đây là một số ý nghĩa mà phương pháp 3r mang lại mà bạn có thể quan tâm:

	+ 3r giúp giảm thiểu một cách tối đa lượng chất thải ra môi trường, làm giảm sự ô nhiễm và cơ sở vật chất để xử lý chất thải đó.
	+ Những vật phẩm tái chế đem đến một nguồn thu lớn cho các doanh nghiệp cũng như góp một khoản tiết kiệm cho chính người tiêu dùng. Vì vậy, nền kinh tế quốc gia cũng được nâng đỡ hơn.
	+ 3r là sản phẩm trí tuệ của con người nhằm nâng cao nhận thức của toàn cộng đồng. Nó mang sức mạnh tinh thần to lớn, giúp thay đổi cách thức sử dụng, ý thức bảo vệ môi trường của con người.
	+ Việc thực hiện biện pháp 3r, giúp tạo ra việc làm, tăng thu nhập, giảm thiểu các chi phí xã hội (quản lý chất thải, chăm sóc sức khỏe…)
Việc thực hiện mô hình 3r phụ thuộc rất lớn vào ý thức của người dân trong cộng đồng. Ý thức và tự giác làm cho thế giới tươi đẹp hơn bằng cách bảo vệ môi trường cùng 3r là cần thiết.
https://vinausen.com/wp-content/uploads/2024/03/3r-la-gi-2.jpg

3. Hiện trạng 3r ở Việt Nam
Nếu như đã nắm được khái niệm 3r là gì và ý nghĩa của phương pháp này, chúng ta hãy cùng tìm hiểu về việc thực hiện mô hình này ở Việt Nam nhé.

https://vinausen.com/wp-content/uploads/2024/03/3r-la-gi-1.jpeg

Mô hình 3r đã được ứng dụng vào Việt Nam giai đoạn 2006 – 2009 nhưng nó đã bị “chết yểu”. Thực trạng hiện thức mô hình này được cụ thể hóa như sau:
	+ Năm 2006, dự án được cơ quan hợp tác quốc tế Nhật Bản (JICA) tài trợ vốn và thực hiện tại Việt Nam năm 2006.
	+ Gần 10 năm thực hiện, mô hình 3r cùng việc thực hiện nó dường như bị Hà Nội lãng quên.
	+ Sự thất bại của phương pháp 3r nằm ở sự thiếu đồng bộ và thiếu sự chỉ đạo từ các cấp các ngành. Sự thiếu hụt về vật chất : điểm trung chuyển hay vận chuyển rác chưa được xây, trang thiết bị chưa đủ đáp ứng yêu cầu vận chuyển, xử lý rác… cũng dẫn đến sự thất bại của dự án 3r tại Việt Nam.
	+ Tuy nhiên, tại thời điểm áp dụng phương pháp môi trường 3r này cũng đạt được một số kết quả khả quan về sự giảm thiểu lượng rác thải cùng ý thức tái chế từ các hộ dân.
Giải pháp 3r hữu dụng nhưng sẽ thật sự có hiệu quả chỉ khi quốc gia chuẩn bị thật tốt về công tác triển khai từ vật chất cho đến tinh thần những nhân tố tham gia.
(Sưu tầm Internet)'
,'https://vinausen.com/wp-content/uploads/2024/03/3r-la-gi-1.jpeg'),
(2, 'Hiện tượng el nino là gì? El Nino và La Nina là gì?',
'
1. Hiện tượng el nino là gì? El Nino và La Nina là gì?
Hiện tượng El Nino và La Nina đều là các hiện tượng khí hậu xảy ra trên Trái Đất. Trong đó:
	- Hiện tượng El Nino là một hiện tượng khí hậu xảy ra khi lớp nước biển bề mặt ở khu vực xích đạo Thái Bình Dương nóng lên dị thường, kéo dài từ 8 đến 12 tháng hoặc lâu hơn. Hiện tượng này thường xuất hiện 3 đến 4 năm một lần và có ảnh hưởng lớn đến thời tiết và khí hậu trên toàn thế giới.
	- Ngược lại, hiện tượng La Nina xảy khi lớp nước biển bề mặt ở khu vực xích đạo Thái Bình Dương lạnh đi dị thường. Hiện tượng này cũng có chu kỳ tương tự hoặc thưa hơn El Nino và có thể xuất hiện ngay sau khi El Nino suy yếu. Được hình thành từ tháng 3 đến tháng 6 hằng năm, và gây ảnh hưởng mạnh nhất vào cuối năm cho tới tháng 2 năm sau.
Ngoài ra, hiện tượng El Nino ảnh hưởng rất lớn đến khí hậu, gây ra nhiều tác hại như: bão, hạn hán, lũ lụt, nóng bức và cháy rừng trên nhiều khu vực,.. ảnh hưởng đến hoạt động nông nghiệp, ngư nghiệp của nhiều quốc gia trên thế giới, đặc biệt là Nam Mỹ, Châu Phi, Đông Nam Á và Úc.
Nội dung trên chỉ mang tính chất tham khảo
https://cdn.thuvienphapluat.vn/uploads/Hoidapphapluat/2023/DTT/26102023/hien-tuong.jpg
Hiệu ứng nhà kính gây ra hiện tượng gì đối với Trái Đất?
Theo quy định tại khoản 30 Điều 3 Luật Bảo vệ môi trường 2020 có quy định như sau:

Giải thích từ ngữ
Trong Luật này, các từ ngữ dưới đây được hiểu như sau:
....
30.Hiệu ứng nhà kính là hiện tượng năng lượng bức xạ của Mặt Trời được hấp thụ trong khí quyển, chuyển hóa thành nhiệt lượng gây hiện tượng nóng lên toàn cầu.
31.Giảm nhẹ phát thải khí nhà kính là hoạt động nhằm giảm nhẹ mức độ hoặc cường độ phát thải khí nhà kính, tăng cường hấp thụ khí nhà kính.
....
Thông qua quy định trên, hiệu ứng nhà kính sẽ gây ra hiện tượng nóng lên toàn cầu đối với Trái Đất do việc năng lượng bức xạ của Mặt Trời được hấp thụ trong khí quyển, chuyển hóa thành nhiệt lượng.

2. Các khí nào gây ra hiệu ứng nhà kính?
Căn cứ theo quy định Điều 91 Luật Bảo vệ môi trường 2020 quy định về giảm nhẹ phát thải khí nhà kính như sau:

	Giảm nhẹ phát thải khí nhà kính
	1.Các khí nhà kính chính là carbon dioxide (CO2), methane (CH4) và nitrous oxide (N2O). Các khí có hàm lượng thấp nhưng có tiềm năng cao gây hiệu ứng nhà kính là hydrofluorocarbons (HFCs), perfluorocarbons (PFCs), sulphur hexafluoride (SF6) và nitrogen trifluoride (NF3).
	....
Hiện nay, các khí chính gây ra hiệu ứng nhà kính bao gồm: carbon dioxide (CO2), methane (CH4) và nitrous oxide (N2O). Ngoài ra, các khí sau đây tuy có hàm lượng thấp nhưng cũng là tiềm năng nguy cơ gây nên hiệu ứng nhà kính cụ thể như sau:
- Hydrofluorocarbons (HFCs).
- Perfluorocarbons (PFCs).
- Sulphur hexafluoride (SF6).
- Nitrogen trifluoride (NF3).
Nhằm hạn chế hiệu ứng nhà kính nhất có thể thì việc giảm nhẹ phát thải khí nhà kính được thực hiện theo cá nội dung như sau:
- Tổ chức thực hiện hoạt động giảm nhẹ phát thải khí nhà kính và hấp thụ khí nhà kính theo lộ trình, phương thức giảm nhẹ phát thải khí nhà kính phù hợp với điều kiện của đất nước và cam kết quốc tế.
- Kiểm kê khí nhà kính và đo đạc, báo cáo, thẩm định giảm nhẹ phát thải khí nhà kính cấp quốc gia, cấp ngành, lĩnh vực và cấp cơ sở có liên quan.
- Kiểm tra việc tuân thủ quy định về kiểm kê khí nhà kính, giảm nhẹ phát thải khí nhà kính, việc thực hiện cơ chế, phương thức hợp tác về giảm nhẹ phát thải khí nhà kính.
- Xây dựng và triển khai cơ chế, phương thức hợp tác về giảm nhẹ phát thải khí nhà kính phù hợp với quy định của pháp luật và điều ước quốc tế mà nước Cộng hòa xã hội chủ nghĩa Việt Nam là thành viên.
- Tổ chức và phát triển thị trường các-bon trong nước.
Mặt khác, theo Điều 5 Nghị định 06/2022/NĐ-CP, các tổ chức sau đây phải thực hiện giảm nhẹ phát thải khí nhà kính:
- Các cơ sở thuộc danh mục lĩnh vực, cơ sở phát thải khí nhà kính phải kiểm kê khí nhà kính do Thủ tướng Chính phủ ban hành. Các tổ chức, cá nhân còn lại được khuyến khích thực hiện giảm nhẹ phát thải khí nhà kính phù hợp với điều kiện, hoạt động của mình
- Các bộ quản lý lĩnh vực năng lượng, nông nghiệp, sử dụng đất và lâm nghiệp, quản lý chất thải, các quá trình công nghiệp là các Bộ: Công Thương, Giao thông vận tải, Nông nghiệp và Phát triển nông thôn, Tài nguyên và Môi trường, Xây dựng.

Trân trọng!
',
'https://cdn.thuvienphapluat.vn/uploads/Hoidapphapluat/2023/DTT/26102023/hien-tuong.jpg')
,(
2,
'Carbon footprint là gì? 7 Cách giảm thiểu dấu chân carbon',
'
1. Carbon footprint là gì?
Carbon footprint (dấu chân carbon) là tổng lượng phát thải khí nhà kính đến từ quá trình sản xuất, sử dụng và cuối vòng đời của một sản phẩm hoặc dịch vụ. Nó bao gồm các chất carbon dioxide (CO2) là loại khí mà con người thải ra nhiều nhất, và những loại chất khác, bao gồm khí metan (CH4), nitơ oxit (NO2) và flo (F). Những loại khí nhà kính có ảnh hưởng tới sức khỏe con người và giữ nhiệt trong khí quyển, gây ra hiện tượng nóng lên toàn cầu.
https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-1_1629387631.jpg
Carbon footprint là tổng lượng phát thải khí nhà kính được tạo ra bởi các hành động của con người
Carbon footprint là tổng lượng phát thải khí nhà kính được tạo ra bởi các hành động của con người (Nguồn: worldculturenetwork.com)

Dấu chân carbon do một người, tổ chức hay quốc gia tạo ra có thể theo cách trực tiếp hoặc gián tiếp. Phát thải trực tiếp như khi bạn sử dụng năng lượng để lái xe hay sử dụng các thiết bị điện. Gián tiếp là khi bạn sử dụng bất kể một vật dụng bất kỳ mà cần dùng năng lượng để sản xuất ra nó, ví dụ như thực phẩm hay quần áo. Thông thường, phần lớn lượng khí thải carbon của một cá nhân sẽ đến từ giao thông vận tải, nhà ở và thực phẩm.

Thuật ngữ Carbon footprint được công bố lần đầu tiên vào năm 1979, trong một cuộc họp của Ủy ban năng lượng Vườn quốc gia Yosemite. Tuy nhiên, mãi đến năm 2007, thuật ngữ dấu chân carbon mới được chính thức đưa vào sử dụng trong những báo cáo khoa học đầu tiên về biến đổi khí hậu của IPCC (Intergovernmental Panel on Climate Change - Ủy ban liên chính phủ về biến đổi khí hậu).

2. Cách tính Carbon footprint (dấu chân carbon)
Sau khi hiểu được Carbon footprint là gì, vậy dấu chân carbon được tính như thế nào? Cách tính thông số này cần dựa trên nhiều yếu tố, bao gồm: Khu vực sinh sống, phong cách sinh sống, loại và mức năng lượng tiêu thụ, những sản phẩm công nghệ được sử dụng và cách sử dụng, cùng nhiều yếu tố khác. 

Trong đó, cách tính lượng khí thải carbon tốt nhất được sử dụng là dựa trên mức độ tiêu thụ nhiên liệu của một người. Cuối cùng, cộng dồn lượng phát thải CO2 vào Carbon footprint của cá nhân.

https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-2_1629387671_1631639675.jpgCách tính thông số dấu chân Carbon cần dựa trên nhiều yếu tố (Nguồn: sustainableprinceton.org)
Ví dụ: Bạn sử dụng xe máy để di chuyển đường 200km với mức tiêu thụ của xe là 2,5 lít xăng/100km. 
	+ Tổng quãng đường 200Km sẽ tiêu thụ hết: 2,5 x 2 = 5 lít xăng. 
	+ Mỗi lít xăng được tính sẽ phát thải 2,3 kg khí CO2. 
Tính tổng việc di chuyển này sẽ làm tăng 5 x 2,3 kg = 11,5 kg CO2. Con số này sẽ cộng cộng vào Carbon footprint của bạn hàng năm. Tại Việt Nam, chỉ số Carbon footprint trung bình lên tới gần 1,18 tấn/người/năm. 

Nhằm hạn chế và kiểm soát tốt hơn mức độ ô nhiễm môi trường, mỗi quốc gia sẽ có những quy định về tiêu chuẩn khí thải riêng, đặc biệt với ô tô. Là một quốc gia đang phát triển với mức độ ô nhiễm cao, việc áp dụng tiêu chuẩn khí thải ô tô Việt Nam là rất cần thiết. 

3. Tại sao mỗi người cần giảm số dấu chân carbon?  
Tất cả những vấn đề xoay quay mối quan tâm về Carbon footprint là gì rốt cuộc đều nhằm đánh giá một cá nhân, các doanh nghiệp hay các chính phủ có thể có bao nhiêu tác động đến lượng phát thải khí nhà kính gây ảnh hưởng đến môi trường.

Trên thực tế, mối liên hệ giữa phát thải khí nhà kính và biến đổi khí hậu là quá rõ ràng và khó có thể bỏ qua. Nhiệt độ trung bình toàn cầu đang tăng lên, các hiện tượng thời tiết cực đoan ngày càng trở nên khắc nghiệt hơn, mực nước biển dâng cao và hiện tượng axit hóa đang diễn ra. Tất cả các mối đe dọa sinh thái này đều là kết quả từ hoạt động sống của con người.

Lượng phát thải khí nhà kính tăng lên dẫn đến hiện tượng biến đổi khí hậu
https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-3_1710323429.jpg
Lượng phát thải khí nhà kính tăng lên dẫn đến hiện tượng biến đổi khí hậu (Nguồn: aarp.net)
Bằng cách giảm lượng khí thải carbon, bạn có thể góp phần vào việc giảm tổng lượng khí thải nhà kính. Trong cuộc chiến chống biến đổi khí hậu của chúng ta, tất cả mọi người cần thực hiện những điều chỉnh nhỏ những có thể dẫn đến kết quả lớn.
Nguồn: vinfast
',
'https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-1_1629387631.jpg'
)
;


--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category`(
	id INTEGER NOT NULL AUTO_INCREMENT,
    post_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES post(post_id) on delete cascade on update cascade,
    FOREIGN KEY (category_id) REFERENCES category(id) on delete cascade on update cascade
);


--
-- Dumping data for table `post_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` integer NOT NULL AUTO_INCREMENT,
  `user_id` integer NOT NULL,
  `post_id` integer NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (comment_id),
   foreign key (user_id) references users(id) on delete cascade on update cascade,
   foreign key (post_id) references post(post_id) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--
-- INSERT INTO `comment` (`comment`, `user_id`, `post_id`, `created_at`) VALUES
-- ('Great post!', 3, 2, '2023-07-21 19:00:00'),
-- ('Nice work', 2, 3, '2023-07-21 19:01:00'),
-- ('Thanks for sharing', 3, 4, '2023-07-21 19:02:00'),
-- ('Very informative', 4, 5, '2023-07-21 19:03:00'),
-- ('Helpful!', 5, 6, '2023-07-21 19:04:00'),
-- ('Awesome!', 6, 7, '2023-07-21 19:05:00'),
-- ('Interesting read', 7, 8, '2023-07-21 19:06:00'),
-- ('Good job', 8, 9, '2023-07-21 19:07:00'),
-- ('Well done', 9, 10, '2023-07-21 19:08:00'),
-- ('Nice tips', 10, 11, '2023-07-21 19:09:00'),
-- ('Loved it', 11, 12, '2023-07-21 19:10:00'),
-- ('Great insights', 12, 4, '2023-07-21 19:11:00');


-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `liked_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (liked_by, post_id),
   FOREIGN KEY (liked_by) REFERENCES users(id) on delete cascade on update cascade,
   foreign key (post_id) references post(post_id) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_like`
--

-- INSERT INTO `post_like` (`liked_by`, `post_id`, `liked_at`) VALUES
-- (2, 1, '2023-07-21 19:00:00'),
-- (3, 2, '2023-07-21 19:01:00'),
-- (4, 3, '2023-07-21 19:02:00'),
-- (5, 4, '2023-07-21 19:03:00'),
-- (6, 5, '2023-07-21 19:04:00'),
-- (7, 6, '2023-07-21 19:05:00'),
-- (8, 7, '2023-07-21 19:06:00'),
-- (9, 8, '2023-07-21 19:07:00'),
-- (10, 9, '2023-07-21 19:08:00'),
-- (11, 10, '2023-07-21 19:09:00'),
-- (12, 11, '2023-07-21 19:10:00'),
-- (13, 12, '2023-07-21 19:11:00'),
-- (2, 13, '2023-07-21 19:12:00'),
-- (3, 1, '2023-07-21 19:13:00'),
-- (4, 2, '2023-07-21 19:14:00'),
-- (5, 3, '2023-07-21 19:15:00'),
-- (6, 4, '2023-07-21 19:16:00'),
-- (7, 5, '2023-07-21 19:17:00'),
-- (8, 6, '2023-07-21 19:18:00'),
-- (9, 7, '2023-07-21 19:19:00'),
-- (10, 8, '2023-07-21 19:20:00'),
-- (11, 9, '2023-07-21 19:21:00'),
-- (12, 10, '2023-07-21 19:22:00'),
-- (13, 11, '2023-07-21 19:23:00'),
-- (2, 12, '2023-07-21 19:24:00'),
-- (3, 13, '2023-07-21 19:25:00'),
-- (4, 1, '2023-07-21 19:26:00'),
-- (5, 2, '2023-07-21 19:27:00'),
-- (6, 3, '2023-07-21 19:28:00'),
-- (7, 4, '2023-07-21 19:29:00'),
-- (8, 5, '2023-07-21 19:30:00'),
-- (9, 6, '2023-07-21 19:31:00'),
-- (10, 7, '2023-07-21 19:32:00'),
-- (11, 8, '2023-07-21 19:33:00'),
-- (12, 9, '2023-07-21 19:34:00'),
-- (13, 10, '2023-07-21 19:35:00');


COMMIT;
show tables;
select * from category;
select * from post;