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
(0, 'flash', 'admin', 'admin',1),
(14, 'abc', 'user01', '12345678', 9);

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
(1, 'Metal'),
(2, 'Paper'),
(3, 'Glass'),
(4, 'Plastic'),
(5, 'Cardboard'),
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
   FOREIGN KEY (user_created) REFERENCES users(id) on delete cascade on update cascade
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
),
(3,
'Kinh ngạc 5 sản phẩm tái chế từ thùng carton',
'Bạn làm gì với những thùng carton đã qua sử dụng? Những món đồ handmade làm từ các loại bao bì carton này có thể khiến bạn ngạc nhiên đấy!

Cùng ngắm nhìn “sự tái sinh” của những chiếc hộp carton, thùng carton thật sáng tạo dưới dây.

1. Bàn ghế độc đáo từ thùng carton
Bộ bàn ghế độc đáo này được làm hoàn toàn từ giấy carton nhiều lớp. Với cấu tạo chắc chắn, bề ngoài thẩm mỹ, đây sẽ là điểm nhấn thú vị trong căn phòng của bạn.
https://inankhangthanh.vn/wp-content/uploads/2018/10/25-768x423.jpg

2. Độc đáo giá đỡ điện thoại từ thùng carton
Chẳng cần phải mất tiền mua chiếc kẹp điện thoại hay giá đỡ ipad, laptop. Bạn hoàn toàn có thể tận dụng lại những bìa carton cũ và biến chúng thành chiếc giá đỡ lý tưởng có thể đặt ở mọi nơi.

https://giadinh.mediacdn.vn/thumb_w/640/2017/photo-1-1504572790484.jpg

3. Tiện dụng kệ giấy carton 
Cắt những bìa các tông cùng kiểu và cùng kích thước, sau đó dán lần lượt các lớp lên nhau, bạn sẽ có một chiếc kệ vô cùng chắc chắn để đặt ở đầu giường, ví dụ như để đựng sách, đèn ngủ…

https://giadinh.mediacdn.vn/thumb_w/640/2017/photo-2-1504572790486.jpg

4. Ấn tượng giá sách từ hộp, thùng carton tái chế
Vẫn là cách cắt các hình khối có kích thước giống nhau và dính chúng vào với nhau bạn sẽ có được chiếc giá sách đặt ở phòng vô cùng nhẹ nhàng, tiện di chuyển mà cũng đẹp không kém gì một giá sách gỗ thông thường.

https://giadinh.mediacdn.vn/thumb_w/640/2017/photo-4-1504572790491.jpg

5. Những chiếc khay carton văn phòng độc nhất vô nhị
Những tấm bìa carton cũng có thể được cắt để biến thành những chiếc khay để đựng giấy tờ trên bàn làm việc.
https://giadinh.mediacdn.vn/thumb_w/640/2017/photo-7-1504572790499.jpg

',
'https://giadinh.mediacdn.vn/thumb_w/640/2017/photo-2-1504572790486.jpg'
),
(8,
'5 Cách tái chế chai thủy tinh cũ thành đồ trang trí hữu ích tại nhà',
'Có một thực tế là sau khi dùng xong, chúng ta thường thẳng tay vứt những chiếc chai, lọ đã qua sử dụng đó vào sọt rác, gây ra một sự lãng phí không hề nhỏ. Trong bài viết này, hãy cùng Cleanipedia tìm hiểu những cách tái chế chai thủy tinh thành những vật dụng hữu ích, vừa tiết kiệm vừa bảo vệ môi trường nhé.
1. Tái chế chai thủy tinh thành những bình cắm hoa
Bên cạnh những cách tái chế chai nhựa thành đồ chơi cho bé, bạn cũng có thể tái chế chai thủy tinh này thành những bình cắm hoa vô cùng nghệ thuật. Bạn có thể vẽ, trang trí hoặc sơn lên chai thủy tinh những màu sắc yêu thích, thể hiện khả năng sáng tạo của bản thân.

Ngoài ra bạn có thể rủ một vài người bạn hoặc người thân trong gia đình cùng làm để tạo những khoảng thời gian gắn kết, gần gũi đáng nhớ.
https://www.cleanipedia.com/images/5iwkm8ckyw6v/5W7BHBH3W5CqkQ93MVBDVg/279f58549f3e3dbeefee59c7ab7d1a40/RElZLVdpbmUtQm90dGxlLVdhbGwtVmFzZS1UdXRvcmlhbC05LmpwZw/1800w/b%E1%BB%A9c-t%C6%B0%E1%BB%9Dng-v%E1%BB%9Bi-hai-b%C3%ACnh-hoa-treo-tr%C3%AAn-gi%C3%A1-g%E1%BB%97-c%C3%B3-hoa-h%E1%BB%93ng-v%C3%A0ng-v%C3%A0-hoa-c%C3%BAc..webp

2. Tận dụng chai thủy tinh làm chai đựng nước rửa chén
Thay vì mua từng chai nước rửa bát, bạn có thể mua luôn một bình lớn rồi đổ vào chai thủy tinh đã rửa sạch sẽ. Cách tái chế thủy tinh này vừa tiện lợi, vừa giúp tiết kiệm một khoản chi phí nho nhỏ cho gia đình bạn.

Bên cạnh đó, chất liệu thủy tinh sẽ giúp bạn thấy rõ màu sắc của nước rửa chén bên trong. Như vậy, bạn có thể biết được liệu nước rửa chén có bị thay đổi màu sắc và có còn sử dụng được không.
https://www.cleanipedia.com/images/5iwkm8ckyw6v/61Okzp9fr3OXPnnKmeS3lC/7377a3c707587e91efd1c19f477abb7f/dGFpLWNoZS1sby10aHV5LXRpbmgtcGljMS5qcGc/1800w/b%C3%ACnh-%C4%91%E1%BB%B1ng-n%C6%B0%E1%BB%9Bc-r%E1%BB%ADa-ch%C3%A9n-b%E1%BA%B1ng-th%E1%BB%A7y-tinh-c%C3%B3-v%C3%B2i-b%C6%A1m%2C-b%C3%AAn-c%E1%BA%A1nh-l%C3%A0-v%C3%B2i-n%C6%B0%E1%BB%9Bc-v%C3%A0-b%E1%BB%8Dt-x%C3%A0-ph%C3%B2ng..webp

3. Cách tái chế thủy tinh làm đèn chùm
Cách tái chế thủy tinh này sẽ giúp bố trí phòng ngủ của bạn trông thật lung linh màu sắc. Trước tiên, bạn hãy dùng máy cắt thủy tinh để cắt một nửa chai rượu đã sử dụng, sau đó chà nhám để làm mịn chỗ vừa cắt.

Cuối cùng lồng một chiếc bóng đèn đã nối sẵn dây điện qua cổ chai là xong. Nếu muốn ai cũng trầm trồ khen chiếc đèn thì bạn cũng có thể trang trí thêm một vài họa tiết, hoặc sơn nhiều màu sắc khác nhau lên vỏ chai tùy theo sở thích bản thân.
https://www.cleanipedia.com/images/5iwkm8ckyw6v/5sZ8o8GATqWbZww7UJ6zPM/28eacedcd65d2ccf49a037042fc6beb4/MWQ3OTFiNjlkNmY0ODJiYzE0ODkxZWJmZmMxNjE1NDUuanBn/1800w/%C4%91%C3%A8n-treo-l%C3%A0m-t%E1%BB%AB-c%C3%A1c-chai-r%C6%B0%E1%BB%A3u-%C4%91%C3%A3-qua-s%E1%BB%AD-d%E1%BB%A5ng-%C4%91%C6%B0%E1%BB%A3c-chi%E1%BA%BFu-s%C3%A1ng-b%E1%BA%B1ng-b%C3%B3ng-%C4%91%C3%A8n-b%C3%AAn-trong..webp

4. Tái chế chai thủy tinh làm vật đựng đồ
Những chiếc lọ, chai nhựa khi dùng để đựng đồ thường sẽ bị méo mó hoặc nóng chảy nếu để ở nơi có nhiệt độ cao. Tuy nhiên, đối với chai thủy tinh thì khác và bạn có thể đựng mắm, dấm, dầu trong chai thủy tinh để sạch và an toàn hơn chai nhựa.
https://www.cleanipedia.com/images/5iwkm8ckyw6v/4desYWYruPyCNZriPHcigh/cc00634d2100461327646bcec1ed6a08/MjQ0Yzk3YmNjODVmYjNmZDMyNWU5YmI4ODcwMWMwOGYuanBlZw/1800w/hai-chai-th%E1%BB%A7y-tinh-ch%E1%BB%A9a-d%E1%BA%A5m-v%C3%A0-d%E1%BA%A7u-%C4%83n-v%E1%BB%9Bi-b%C6%A1m-x%E1%BB%8Bt..webp

5. Tạo đèn cồn, đèn cầy bằng cách tái chế chai thủy tinh
Cách tái chế chai thủy tinh thành đèn cồn đốt phù hợp khi bạn tổ chức những bữa tiệc với bạn bè hoặc gia đình ở ngoài vườn. Để thực hiện, trước tiên đổ dung dịch cồn lỏng vào chai thủy tinh rỗng, sau đó nhúng vòi dẫn dung dịch vào trong chai và thắp sáng. Còn đối với đèn cầu, bạn chỉ cần bỏ đèn cầy vào giữa đáy chai sau đó dùng lửa thắp sáng là được.
https://www.cleanipedia.com/images/5iwkm8ckyw6v/4dguUWmqaGHrGhzbJUbZTd/7e702f8d410415da73cda2ede52fc979/c3ZldGlsbmlraS1pei1idXR5bG9rLTE5LmpwZw/1800w/h%C3%ACnh-%E1%BA%A3nh-m%E1%BB%99t-chi%E1%BA%BFc-c%E1%BB%91c-%C4%91%C6%B0%E1%BB%A3c-l%C3%A0m-t%E1%BB%AB-chai-r%C6%B0%E1%BB%A3u-vang-v%E1%BB%9Bi-%C4%91%C3%A8n-led-b%C3%AAn-trong%2C-v%C3%A0-hai-chai-r%C6%B0%E1%BB%A3u-vang-c%C3%B3-nh%C3%A3n-%22la-crema%22-ph%C3%ADa-sau..webp

',
'https://www.cleanipedia.com/images/5iwkm8ckyw6v/3CkCGU9K2fatT7Q4lJEMcw/1aaceae2e6ffa62c40b2fea7a0d30cfa/YThkODY2OTk4MDNlMGZjZGYyZmQ5NTg1OTM2ZDZkY2MtMTgwMHcuanBn/1800w/hai-ng%C6%B0%E1%BB%9Di-%C4%91ang-tr%E1%BB%93ng-c%C3%A2y-trong-nh%E1%BB%AFng-ch%E1%BA%ADu-nh%E1%BB%8F-v%C3%A0-m%E1%BB%99t-b%C3%ACnh-th%E1%BB%A7y-tinh-h%C3%ACnh-c%E1%BA%A7u..webp'
),
(9,
'HƯỚNG DẪN LÀM CHAI THUỶ TINH ĐÈN LED VỚI DÂY THỪNG VÀ VỎ SÒ ỐC SAO BIỂN ĐỘC ĐÁO - BY TÂM NGUYỄN DECOR',
'Cần chuẩn bị
01 vỏ chai thuỷ tinh, dung tích khoảng 750ml (Chai trong hình là Chivas18)

Khoảng 5m dây thừng gai bản 3ly (3mm)

01 set vỏ sò, ốc, sao biển lộn xộn kiểu.

01 dây đèn Led đom đóm nút chai màu vàng ấm dài 2m

Dụng cụ làm handmade gồm: Súng bắn keo, keo nến, kềm cắt hoặc kéo.
https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-12.jpg

Các bước thực hiện
Bước 01: Đo và cắt dây thừng
Đo nguyên vòng tròn đít chai, cắt một đoạn dây thừng dư ra một đoạn để dễ thao tác

Cắt 5 đoạn dây, mỗi đoạn dài gấp 4 lần chiều cao của chai.

https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-1.jpg

Bước 02: Đan lưới

Gập đôi các đoạn dây thừng dài, lần lượt luồn qua sợ dây ngắn (đo từ đít chai) tạo thành nút thắt như hình.

Cột sợi dây ngắn thành vòng tròn, cố định vào đít chai bằng keo nến

Lấy 1 dây của nút này kẹp với 1 dây của nút bên cạnh, canh khoảng cách tầm 4-5cm và cột thành nút thắt. Làm tương tự như vậy sẽ tạo thành hình lưới cá. Thao tác đến gần cổ chai thì dừng lại.

Cần để ý vị trí các nút phải thẳng hàng đều nhau để thành phẩm được đẹp hơn.

Tiếp tục quấn dây thừng vòng tròn đến hết phần cổ chai là hoàn thành.

https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-2.jpg

Bước 03: Gắn phụ kiện

Chọn bề mặt cảm nhận thấy đẹp nhất của chai để gắn phụ kiện

Ướm chừng và gắn vỏ sò ốc, sao biển sao cho đẹp mắt, tuỳ cảm hứng sáng tạo của mỗi người.

Nên gắn phụ kiện đèn hoặc gần dây thừng sẽ bám dính tốt hơn.

https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-4.jpg

Bước 04: Thêm dây đèn
Cho dây đèn led đom đóm vào bên trong chai.

Phần nút chai vừa vặn với hầu hết các loại chai thuỷ tinh.

Dây đèn sẵn Pin, chỉ cần bật công tắc là sáng. Lưu ý rút giấy chặn Pin trước khi sử dụng.

https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-3.jpg
Bước 05: Thành phẩm
Với chai thuỷ tinh handmade xinh xắn độc đáo như thế này, có thể vừa trang trí nhà cửa đẹp mắt vừa làm đèn ngủ thật chill. Ngoài các phụ kiện phong cách ven biển Địa Trung Hải, bạn có thể sáng tạo tự do với nhiều phụ kiện handmade khác như hoa khô, lá khô, cành củi hay những viên sỏi nữa nha ^^
https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-9.JPEG
',
'https://admin.tamshoppe.vn/Web/Resources/Uploaded/2/images/bai-viet/huong-dan-lam-chai-thuy-tinh-den-led-nut-chai-dep-lam-den-ngu-9.JPEG'
),
(10,
'Những Ý Tưởng Tái Chế Chai Thủy Tinh Sáng Tạo, Độc Lạ',
'1. Tái chế chai thủy tinh thành bình cắm hoa độc lạ
Chắc bạn cũng có thể nhìn ra, các chai thủy tinh sau khi dùng xong có thể dùng làm bình cắm hoa đúng không nhỉ? Đơn giản nhất là rửa sạch lại các chai lọ thủy tinh có hình dáng đẹp là đã có ngay một bình cắm hoa xinh xắn.

Hay muốn đẹp hơn bạn hãy sơn lên lọ thủy tinh màu sắc bạn yêu thích. Cũng có thể vẽ và trang trí bất kỳ sticker, thêm ruy băng để bắt mắt hơn.
https://www.btaskee.com/wp-content/uploads/2022/12/tai-che-lo-thuy-tinh-lam-binh-cam-hoa-don-gian.jpg

2. Tái chế lọ thủy tinh nhỏ thành chai nước rửa chén
Thay vì mua những chai nước rửa bát về, sau khi dùng hết lại phải bỏ những chai đựng đó đi. Bạn có thể mua nước rửa bát dạng túi sau đó chiết ra những lọ thủy tinh để dùng dần. Cách này vừa giúp tiết kiệm chi phí vừa bảo vệ môi trường.

Không những vậy, thông qua việc đựng nước rửa chén trong lọ thủy tinh, bạn có thể dễ dàng nhìn thấy được mức nước rửa chén đang có bên trong.

https://www.btaskee.com/wp-content/uploads/2022/12/lo-thuy-tinh-dung-nuoc-rua-chen-1.jpg

3. Tái chế chai thủy tinh làm lọ đựng gia vị
Những chiếc lọ bằng chất liệu nhựa khi đựng gia vị thường sẽ bị méo mó hoặc bị chảy khi ta để chúng gần bếp nóng. Như vậy, các chất độc hại chó trong chai, lọ nhựa sẽ thấm vào thức ăn làm ảnh hưởng đến sức khỏe.

Thay vì như vậy, bạn hãy tái chế chai thủy tinh cũ thành những chai đựng gia vị. Với các chai thủy tinh cổ dài, bạn hãy dùng để đựng gia vị dạng lỏng như: Nước mắm, dầu ăn, nước tương,…

https://www.btaskee.com/wp-content/uploads/2022/12/lo-dung-gia-vi-chat-long.jpg

4. Tái chế chai thủy tinh thành vật dụng đựng, chứa đồ vật
Với các vật dụng như lược, bấm móng tay, kéo, chìa khóa… rất dễ bỏ lung tung làm nhà cửa trở nên hỗn độn mà đến khi tìm kiếm cũng sẽ khó. Hãy nhanh trí tái chế những chai thủy tinh thành những vật dụng đựng, chứa các đồ dùng này. 
https://www.btaskee.com/wp-content/uploads/2022/12/vat-dung-dung-do.jpg
',
'https://www.btaskee.com/wp-content/uploads/2022/12/lo-dung-gia-vi-kho.jpg'
),
(5,
'5 cách tái chế lon bia, lon nước ngọt thành đồ vật hữu ích',
'Hãy tái chế những vỏ lon nước ngọt thành những vật dụng trang trí tuyệt vời. Thậm chí bạn có thể bán chúng cho những ai đam mê sản phẩm bằng tay. Sau đây là một vài ý tưởng tái chế tuyệt vời từ lon nước ngọt dành cho bạn.
1. Tái chế lon bia làm khuôn bánh quy
Chỉ cần cắt vỏ lon và uốn chúng thành hình tùy ý. Bạn sẽ có những khuôn bánh quy với đủ kích cỡ và hình dáng ngộ nghĩnh theo trí tưởng tượng của riêng bạn.
https://cdn.tgdd.vn/Files/2017/06/01/988381/mot-vai-y-tuong-tai-che-tuyet-voi-tu-lon-nuoc-ngot-danh-cho-ban-202202150915458553.jpg

2. Tái chế lon bia làm chụp đèn
Sưu tập khóa tròn trên nắp lon nước ngọt. Kết chúng lại với nhau bằng que hàn inox hay dây thép, bạn sẽ có một lồng chụp đèn trang trí phòng khách hoặc thậm chí là cả phòng ngủ thật độc đáo.

https://cdn.tgdd.vn/Files/2017/06/01/988381/mot-vai-y-tuong-tai-che-tuyet-voi-tu-lon-nuoc-ngot-danh-cho-ban12_800x450.jpg

3. Tái chế lon bia làm vòng đeo tay
Cắt vỏ lon với độ dày tùy ý, uốn chúng thành hình vòng tròn. Kết hợp chúng với chút dây ruy băng, hoặc vải đầy màu sắc để làm thành những chiếc vòng tay thật cá tính, có một không hai.
https://cdn.tgdd.vn/Files/2017/06/01/988381/mot-vai-y-tuong-tai-che-tuyet-voi-tu-lon-nuoc-ngot-danh-cho-ban13_800x450.jpg

4. Tái chế lon bia làm hoa trang trí
Bạn yêu thích phong cách vintage, vậy thì những bông hoa từ lon nước ngọt sẽ là lựa chọn hoàn hảo cho bạn. Cắt bỏ phần nắp lon, tạo hình tùy ý trên thân lon sau đó uốn cong chúng, sơn một chút sơn tạo màu cho cánh và nhụy hoa là bạn đã hoàn thành rồi.
https://cdn.tgdd.vn/Files/2017/06/01/988381/mot-vai-y-tuong-tai-che-tuyet-voi-tu-lon-nuoc-ngot-danh-cho-ban14_800x400.jpg

5. Tái chế lon bia làm đèn lồng

Dùng đầu mũi dao cắt đường tùy ý trên thân lon, sao cho những đường cắt song song với nhau. Loại bỏ những phần thừa, ấn nhẹ 2 đầu lon giúp các đường còn lại tách rời nhau.
Tiếp tục uốn cong chúng để làm thành những chiếc đèn lồng xinh xắn. Bạn cũng có thể loại bỏ hay giữ lại phần nắp lon tùy ý.
https://cdn.tgdd.vn/Files/2017/06/01/988381/mot-vai-y-tuong-tai-che-tuyet-voi-tu-lon-nuoc-ngot-danh-cho-ban15_800x400.jpg
',
'https://cdn.tgdd.vn/Files/2017/06/01/988381/mot-vai-y-tuong-tai-che-tuyet-voi-tu-lon-nuoc-ngot-danh-cho-ban17_800x400.jpg'
),
(7,
'Làm gì với những chiếc hộp bánh quy sau Tết: Đừng vội bỏ đi hãy biến chúng trở thành những món đồ dùng lưu trữ hữu ích bất ngờ',
'Sau Tết, chắc hẳn không ít gia đình sẽ còn dư lại những vỏ hộp bánh quy. Điều này đã khiến vài người cảm thấy “phiền phức”, bề bộn nhà cửa. Thế sao bạn không tận dụng những hộp bánh đã qua sử dụng sau Tết này để làm những vật dụng cực hữu ích.

Bởi lẽ nếu biết cách tận dụng những chiếc vỏ hộp vào mục đích sử dụng khác, không những tiết kiệm được một số tiền khi không phải mua đồ mới mà lại còn có những món đồ trang trí nhà tuyệt đẹp và còn góp phần bảo vệ môi trường nữa đấy.

Cách đơn giản và không cần tới một chút khéo léo hay công sức nào là biến hộp đựng bánh quy thành hộp đựng đồ ngay lập tức. Bạn có thể “hô biến” vỏ hộp tưởng như bỏ đi thành chiếc hộp đựng đồ vô cùng dễ thương và tiện dụng.

Chiếc hộp trang trí mang kiểu dáng nguyên bản hoặc nếu thích bạn có thể biến tấu thêm hẳn là một ý tưởng khá độc đáo, dễ thương và cũng hết sức tiện dụng đấy.

Thay vì tốn tiền mua nó, bạn có thể tận dụng ngay chiếc hộp đựng bánh bỏ đi của gia đình như thế này đây.
https://afamilycdn.com/150157425591193600/2021/2/23/998d-1614056275712241124991.jpg
Từ hộp bánh bích quy bạn có thể tận dụng lõi bên trong sau khi hết kẹo để lưu trữ kim chỉ, các đồ dùng may vá thủ công khác.
https://afamilycdn.com/150157425591193600/2021/2/23/a86f-16140562849751631474078.jpg
Hay đựng sách vở, những kỉ vật của gia đình.
https://afamilycdn.com/150157425591193600/2021/2/23/8415-161405629205416577282.jpg
Hoặc các loại đồ dùng lặt vặt để tránh rơi rớt hoặc làm mất trong nhà.
https://afamilycdn.com/150157425591193600/2021/2/23/1573-16140563006952019218039.jpg
Ứng dụng hộp bánh kẹo để làm hộp lưu trữ kim chỉ được nhiều người ưa chuộng.
https://afamilycdn.com/150157425591193600/2021/2/23/cookie-tin-box-for-tea-bags-collage-657e3-16140661897391778488271.jpg
Với hộp kẹo bích quy quen thuộc, bạn cần sơn phủ lại cho bề mặt của hộp rồi có thể vẽ hoặc dán hình trang trí. Bạn có thể dùng sơn xịt hoặc sơn dầu đều được. Sau đó, bạn cắt bìa cứng để chia thành các ngăn nhỏ bên trong hộp là đã có một sản phẩm đựng trà chiều cho phòng khách rồi. Nhớ chú ý làm sạch bề mặt hộp trước khi sơn nhé.
',
'https://afamilycdn.com/thumb_w/800/150157425591193600/2021/2/24/mini-make-5-1614059391411403801637-0-55-300-535-crop-16141283807469516117.jpg'
),
(6,
'5 Ý TƯỞNG TÁI CHẾ SÁNG TẠO TỪ THÙNG PHUY SẮT CŨ CỰC KÌ ĐỘC ĐÁO',
'Đặc điểm của thùng phuy sắt 
Thùng phuy sắt được sử dụng phổ biến là loại có dung tích 200 lít, 220 lít. Phi sắt có dạng hình trụ, được làm từ thép không gỉ hoặc thép cứng loại 1. Thùng phi sắt có hai loại là nắp nhỏ và nắp lớn (hay còn gọi là nắp rời). Từng loại thùng phuy sắt có đặc điểm cụ thể như sau:

Thùng phuy sắt nắp kín (nắp nhỏ) có kích thước là Ø568mm, chiều cao thùng là 890mm và đường kính nắp phuy là 52mm. Loại thùng này có phần nắp gồm có 2 lỗ và nắp thùng không mở ra hoàn toàn như phi sắt nắp hở. Trong đó, lỗ to hơn dùng để đổ chất lỏng vào, lỗ nhỏ hơn dùng để không khí lưu thông.
Thùng phuy sắt nắp hở (nắp lớn) có kích thước là Ø572mm và chiều cao thùng là 895mm. Loại này thì lại có thiết kế phần nắp khác với thùng phuy sắt nắp kín. Phần nắp của thùng chỉ có duy nhất 1 nắp lớn mở ra hoàn toàn. Tuy nhiên, bạn đừng nghĩ rằng như vậy là loại này không có nắp đậy chắc chắn. Vì thông thường thùng phi sắt nắp lớn sẽ có kèm theo kiềng sắt bảo vệ, cố định phần nắp. Nên bạn không cần lo lắng việc chất lỏng, hóa chất sẽ chảy ra ngoài khi vận chuyển.
https://lh6.googleusercontent.com/kgf1kx7gpkm4JCHajK5VrJToZXzSVxjdVqxDffFJMwpXLjgnrLghfUJz09FMdBD7kwmb8o1E18OKBSX04hoTuVXMF_nkMDul5d10JPY5v6fn2hz2noMmdEgnsmzZnl-Rk501mes-=s0
Lưu ý khi tái sử dụng thùng phuy sắt cũ
Thùng phuy sắt trước khi được tái chế thường được dùng để đựng hóa chất trong ngành công nghiệp… Các loại hóa chất này có tính ăn mòn cao và thậm chí có thể nguy hiểm như axit đậm đặc. Chính vì vậy, nếu đang phân vân nên mua phi sắt cũ chất lượng ở đâu? Công ty Môi Trường Thanh Phúc sẽ là lựa chọn lý tưởng cho bạn. Mua lại thùng phuy sắt cũ do chúng tôi cung cấp, bạn sẽ được hưởng những lợi ích sau:

Quy trình làm sạch thùng phuy sắt cũ nghiêm ngặt, đảm bảo an toàn cho người dùng. Đây là lợi ích đầu tiên và được nhiều người mua hàng quan tâm nhất. Vì điều này ảnh hưởng rất lớn tới sức khỏe và sự an toàn của họ. Các thùng phuy sắt trước đó đều được dùng để đựng hóa chất trong ngành công nghiệp và y tế. Nên công ty Môi Trường Thanh Phúc cam kết sẽ loại bỏ hoàn toàn các chất độc hại trước khi đem bán ra thị trường. Chúng tôi luôn đặt sự an toàn của khách hàng lên hàng đầu nên bạn có thể yên tâm.
Tiết kiệm chi phí cho gia đình hoặc doanh nghiệp của bạn. Thay vì phải bỏ ra khoản tiền nhiều hơn để mua thùng phuy sắt mới, bạn chỉ cần bỏ ra khoản tiền nhỏ hơn. Vì các thùng phuy sắt cũ đã được xử lý đều có khả năng tái chế rất tốt. Bạn có thể dùng sự sáng tạo của mình làm thành các vật dụng có ích.
Độ mới của thùng phuy sắt cũ lên đến 90%. 
Công ty Môi Trường Thanh Phúc là đơn vị cung cấp thùng phuy sắt cũ uy tín hàng đầu tại tỉnh Bình Dương.
Đội ngũ nhân viên tư vấn nhiệt tình, làm việc theo nguyên tắc “Khách hàng là thượng đế”.
1. Thùng rác
Đây là vật dụng được làm từ thùng phuy sắt cũ nhiều nhất. Vì thao tác thực hiện rất đơn giản và bạn còn có thể trổ tài vẽ vời trang trí.
https://lh4.googleusercontent.com/r8Xgyqo83m35c3HmvvBCkDCG2iV5hFY4nnaKQ-a3HmhbqmeZcje7iFD4aJgyLOJnkLBqFoWsKhJk5FQy0Lv2r3aMTktIe5gU2yPl_h5PtRbvWfO3gtcL_Cs037c9E_zeYrBoXu8f=s0
2. Thùng phuy sắt cũ làm thành chậu trồng cây
Các hộ gia đình có thể dùng lại thùng phuy sắt đã qua sử dụng để làm chậu cây. Cách này vừa đơn giản lại còn tiết kiệm chi phí.
3. Lò nướng BBQ
Đây là một ý tưởng độc lạ và có độ khó cao. Bạn có thể thỏa sức sáng tạo với việc làm lò nướng BBQ từ phuy sắt cũ.
https://lh6.googleusercontent.com/Ymkk0yclo9dqUzVPnApnf0wlj8iZA7UolnP-xNqNJinenxLVpgNyYVMWf4_x0R_z-3MFOPFnwqFU0Ep3YEJD24DvgMMAXC_GyQynDMIsgzIqI0OKIEm6RgRO2AYM209BJY1i5XG5=s0
4. Làm bàn uống cafe
Đây là một ý tưởng cực kì độc lạ và đã gây sốt một thời tại các quán cafe. Họ sử dụng lại các thùng phuy sắt cũ để làm thành bàn. Bằng cách này, họ vừa tiết kiệm chi phí lại còn thu hút được sự chú ý của khách hàng.
https://lh6.googleusercontent.com/9u3tIMlNQvqrC8V9YjpHO5xtp8waHPyyBVPPRKbdIPsVOfcXIMZb9d33Mz0UsFZ2Zc9VEEXSxdOkono_CJTqM6VvHgyMH9oilZg8x2Kel_v0iKZE1hPjhRBXxltgl9hq9Z1nbvky=s0
5. Thùng phuy sắt cũ tái chế thành ghế ngồi
Những chiếc ghế cho bạn ngồi nghỉ ngơi thậm chí cũng làm được từ thùng phuy sắt cũ đấy. Bạn cũng có thể lót thêm miếng đệm bông mềm để ghế ngồi thoải mái hơn.
',
'https://lh4.googleusercontent.com/r8Xgyqo83m35c3HmvvBCkDCG2iV5hFY4nnaKQ-a3HmhbqmeZcje7iFD4aJgyLOJnkLBqFoWsKhJk5FQy0Lv2r3aMTktIe5gU2yPl_h5PtRbvWfO3gtcL_Cs037c9E_zeYrBoXu8f=s0'
),
(1,
'3 cách tái chế giấy báo cũ thành vật dụng hữu ích',
'1. Tái chế giấy báo cũ làm chân váy
Dụng cụ chuẩn bị
1 cây bút bi hoặc bút chì
1 cây kéo
1 cuộn băng keo trong
Giấy báo cũ
Dây thun chuyên dụng để may đồ
1 chiếc váy có sẵn và vừa với cơ thể
https://cdn.tgdd.vn/Files/2022/05/18/1433327/12-cach-tai-che-giay-bao-cu-thanh-vat-dung-huu-ich-202205180741320705.jpg
Cách thực hiện
Bước 1 Đầu tiên, bạn đặt tờ báo cũ lên sàn nhà theo hình chéo (dạng hình thoi thay vì là hình vuông như thông thường. (Nếu sợ chiếc váy của mình bị mỏng, bạn có thể chập nhiều tờ giấy báo lại với nhau và thực hiện các bước sau như bình thường).
Bước 2 Đặt mẫu váy có sẵn lên tờ báo, sau đó bạn dùng bút vẽ lại đường cắt với kích thước và độ dài lớn hơn mẫu váy một chút.
Bước 3 Tiếp theo, bạn cắt tờ báo theo đường vẽ, dùng băng keo trong để dán 2 bên mép báo rồi xếp chân váy báo theo dạng xếp ly.
Bước 4 Cuối cùng, bạn luồn dây thun may đồ vào phần đai váy ở eo để tạo độ co giãn cho chân váy.

2. Tái chế giấy báo cũ làm bộ váy ôm
Dụng cụ chuẩn bị
1 cây bút bi hoặc bút chì
1 cây kéo
1 cuộn băng keo trong
Giấy báo cũ
Dây thun chuyên dụng để may đồ
https://cdn.tgdd.vn/Files/2022/05/18/1433327/12-cach-tai-che-giay-bao-cu-thanh-vat-dung-huu-ich-202205180741518260.jpg
Cách thực hiện
Bước 1 Đầu tiên, bạn đặt tờ báo cũ lên sàn nhà theo hình chéo, sau đó dùng bút đánh dấu độ dài chân váy ôm theo như ý muốn. (Nếu sợ váy quá mỏng thì bạn có thể chập lại nhiều tờ báo với nhau để làm chân váy giống như trên)
Bước 2 Tiếp theo, bạn cắt tờ báo theo đường vẽ và dùng băng keo trong để dán 2 bên mép báo lại với nhau.
Bước 3 Cuối cùng, bạn luồn dây thun vào đai váy ở eo để tạo độ co giãn cho váy.

3. Tái chế giấy báo cũ làm chiếc lá trang trí
Dụng cụ chuẩn bị
1 cây bút bi hoặc bút chì
1 cây kéo
1 chai keo sữa
Giấy báo cũ
Màu nước
Bút chì màu hoặc bút lông màu
Cọ vẽ
Đồ bấm lỗ tròn
Dây thừng nhỏ trang trí
https://cdn.tgdd.vn/Files/2022/05/18/1433327/12-cach-tai-che-giay-bao-cu-thanh-vat-dung-huu-ich-202205180742057515.jpg
',
'https://cdn.tgdd.vn/Files/2022/05/18/1433327/12-cach-tai-che-giay-bao-cu-thanh-vat-dung-huu-ich-202205180742057515.jpg'
),
(9,
'Mách ba mẹ 5 cách làm đồ chơi bằng giấy siêu đơn giản cho bé yêu',
'1. Ý nghĩa của các món đồ chơi làm bằng giấy
Việc sử dụng giấy và làm đồ chơi thủ công giúp bé thích thú, tiết kiệm nhiều thời gian và tiền bạc. Bé sẽ rất thích những món đồ cha mẹ làm cho vì cảm nhận được tình yêu của cha mẹ dành cho mình. 

Đồ chơi giấy cũng rất đa dạng và đầy sáng tạo, cha mẹ có thể cùng bé thỏa sức tưởng tượng và thực hành. Nguyên liệu giấy tự nhiên sẽ an toàn và tiết kiệm. Đồng thời tự làm đồ chơi bằng giấy cũng giúp bé thấy sự sáng tạo là không giới hạn, rèn kỹ năng khéo tay cũng như tính tự lập từ nhỏ. 

2. Các cách làm đồ chơi bằng giấy cho bé cực đơn giản
2.1 Làm con gà từ giấy
Chuẩn bị:
Giấy màu, giấy trắng
Kéo và bút
Cách làm đồ chơi bằng giấy hình con gà:

Bước 1: Vẽ lên giấy màu trắng các hình như phần hình 1 bên dưới. Sau đó, mẹ áp giấy màu vàng lên giấy trắng và cắt theo những hình đấy. Phần mỏ gà và phần đế dùng giấy màu cam cho đẹp hơn. Những chỗ vẽ nét đứt là hướng dẫn gấp giấy ngay tại đó. 
Bước 2: Dán thành từng vòng tròn rồi dán nối với nhau 
Bước 3: Dán mỏ, dán cánh như hình 2 bên dưới
Bước 4: Vẽ mắt hoặc dùng mắt thú bông dán lên là mẹ đã hoàn thành con gà cho bé rồi. 
https://cdn.tgdd.vn//News/0//lam-do-choi-bang-giay-hinh-con-ga-845x564.jpg

2.2 Làm chú sứa bằng giấy xinh xắn
Chuẩn bị:
Giấy trắng
Đầu dùi, hồ dán, dao cắt giấy
Dây chỉ, dây dù, kim khâu.
Cách làm đồ chơi bằng giấy hình chú sứa xinh xắn:

Bước 1: Cắt giấy trắng thành những đoạn giấy nhỏ có độ dài 0,5 cm x 8cm.
Bước 2: Đục các lỗ nhỏ vào chính giữa mỗi mảnh giấy trắng vừa cắt ở bước 1
Bước 3: Dán keo cố định ở chính giữa, dán các đoạn giấy thành hình chữ thập.
Bước 4: Cố định lần lượt các đoạn trên với nhau một cách so le để được hình bông hoa
Bước 5: Mẹ cắt thêm 3 đoạn giấy có chiều dài 8cm x 0,5 cm, rồi dán thành vòng tròn cố định.
Bước 6: Quấn quanh tất cả phần tua tròn tạo từ bước 4 vào vòng tròn tại bước 5 để thành phần đầu của sứa.
Bước 7: Cắt đoạn giấy hình chữ nhật và dùng dao rọc giấy cắt phần dưới đoạn đầu khoảng 2 cm thành các đoạn tua nhỏ liền nhau
Bước 8: Dính các đoạn tua dưới với nhau, dùng kéo tạo độ xoăn và đục hai lỗ qua đầu rồi xuyên sợi dây qua đoạn tua trên.
Bước 9: Nối đoạn tua vừa thực hiện được lên thân hình chú sứa đã tạo ở bước 6, đính thêm 1 hạt cườm cố định phần trên đỉnh đầu dây. Và thế là mẹ đã tạo thành chú sứa siêu nhanh và xinh cho bé chơi.
https://cdn.tgdd.vn//News/0//lam-do-choi-bang-giay-hinh-con-sua-845x564.jpg

2.3 Làm con thỏ bằng giấy đơn giản
Chuẩn bị:
Giấy màu, giấy trắng
Bút, kéo và keo dán
Cách làm đồ chơi bằng giấy hình con thỏ:

Bước 1: Vẽ 4 hình như hình 1, những đường nét đứt là nếp gấp
Bước 2: Dùng kéo cắt giấy theo hình vừa vẽ, đối với phần đế dùng giấy màu hồng áp lên giấy trắng và cắt theo hình.
Bước 3: Dán hai mảnh giấy hình chữ nhật thành thân và đầu thỏ rồi dán chúng với nhau
Bước 4: Phần tai thỏ thì gấp theo đường nét đứt và dán vào phần đầu
Bước 5: Dán thỏ vào đế màu hồng, vẽ thêm mắt, mũi, miệng là mẹ đã có chú thỏ đáng yêu cho bé chơi. 
Ngoài ra, ba mẹ cũng có thể làm một số món đồ chơi cho bé trai bằng giấy như thú cưng, máy bay, ...
https://cdn.tgdd.vn//News/0//lam-do-choi-bang-giay-hinh-con-tho-845x564.jpg

4. Làm chú chim bằng giấy
Chuẩn bị:
Giấy màu, giấy trắng
Bút, kéo và keo dán
Cách làm đồ chơi bằng giấy hình con chim:

Bước 1: Vẽ các hình như hình 1 lên giấy màu xanh lam, riêng hình thoi làm mỏ thì vẽ trên giấy màu đỏ. Sau đó cắt các hình đấy ra.
Bước 2: Ở hai đầu dải giấy chữ nhật dài mẹ cắt thành khe, cẩn thận không để đứt lìa. 
Bước 3: Gấp và dán hình chữ nhật nhỏ thành ống tròn. Phần chữ nhật còn lại gài đuôi giấy vào nhau tại vị trí đã cắt khe.
Bước 4: Gập phần cánh và phần mỏ theo đường nét đứt. Sau đó dán các bộ phận vào nhau như hình dưới. Vẽ thêm mắt, hoặc dán mắt lên. Vậy là mẹ đã hoàn thành con chim bằng giấy dễ thương, bé sẽ rất thích đấy. 
https://cdn.tgdd.vn//News/0//lam-do-choi-bang-giay-hinh-con-chim-845x564.jpg

2.5 Làm chú chó đáng yêu
Chuẩn bị:
Giấy hình vuông
Cách làm đồ chơi bằng giấy hình chú chó đáng yêu:

Bước 1: Gấp hình vuông thành hình tam giác đều, bẻ hai cạnh tam giác thành tai chú chó
Bước 2: Gấp đuôi giấy lên tạo hình mặt chó, rồi dùng bút vẽ mắt mũi. Thế là đã hoàn thành chú chó đáng yêu.
https://cdn.tgdd.vn//News/0//lam-do-choi-bang-giay-hinh-chu-cho-845x564.jpg
',
'https://cdn.tgdd.vn//News/0//lam-do-choi-bang-giay-hinh-chu-cho-845x564.jpg'
),
(2,
'Hướng dẫn 3 cách tái chế giấy thành vật dụng hữu ích tại nhà',
'1. Làm khung ảnh từ giấy báo cũ 
Báo cũ là nguyên liệu dễ kiếm và dễ sử dụng trong việc tái chế để tạo ra những chiếc khung ảnh đẹp mắt và xinh xắn. Bạn có thể sáng tạo và tái chế báo cũ thành những sản phẩm trang trí độc đáo đồng thời sẽ góp phần giảm thiểu lượng chất thải và bảo vệ môi trường.

Dụng cụ chuẩn bị

Giấy báo cũ
Keo dán và súng bắn keo
1 khung ảnh trống
Hướng dẫn thực hiện

Bước 1: Đầu tiên, cắt các tờ giấy báo cũ thành những miếng giấy nhỏ hình vuông với kích thước tùy ý.
Bước 2: Tiếp theo, bạn xếp các miếng giấy vuông thành hình con bướm, hình trái tim,hình ngôi sao,… hoặc bất kỳ hình dạng gì phù hợp với sở thích riêng của bạn.
Bước 3: Cuối cùng, bạn sử dụng keo dán hoặc súng bắn keo để dán các hình đã xếp này lên khung ảnh trống rồi treo khung ảnh này trang trí trong nhà mình.
https://hupuna.com/wp-content/uploads/2024/01/tai-che-giay-5.jpg?w=1130

2. Làm nơ huân chương từ giấy báo cũ
Tái chế báo cũ để tạo ra những nơ chiếc huân chương là một cách sáng tạo và ý nghĩa. Với cách sử dụng này, chúng ta không chỉ tái chế được nguyên liệu không sử dụng mà còn biến chúng thành những biểu tượng, quà tặng có ý nghĩa. 

Dụng cụ chuẩn bị

Một vài tờ giấy báo cũ
Dây ruy băng nhiều màu
Keo dán hoặc súng bắn keo
Huy hiệu
Hướng dẫn thực hiện

Bước 1: Bạn cắt tờ giấy báo cũ thành miếng hình vuông lớn, sau đó túm lần lượt 4 đầu của hình vuông với các mép báo lại, dùng keo dán cố định điểm chính giữa sao cho khi dán ta có một hình tròn đẹp mắt.
Bước 2: Cắt 2 miếng dây ruy băng màu giống nhau và mỗi miếng cắt thêm 1 hình tam giác ở phía dưới đuôi, sau đó dán 2 dây ruy băng này ở sau miếng tròn huân chương.
Bước 3: Cuối cùng, sử dụng súng bắn keo để cố định miếng huy hiệu ở điểm chính giữa của huân chương.

3. Tái chế thành túi đựng đồ
Ngoài những ý tưởng sáng tạo trên, tờ báo cũ còn có thể được tái chế để tạo ra những chiếc túi giấy trang trí hoặc đựng các vật dụng nhỏ trong phòng. Việc này giúp giảm chất thải và tạo ra những sản phẩm thực tế từ những nguyên liệu tái chế, đồng thời thể hiện tinh thần bảo vệ môi trường, sáng tạo trong cuộc sống hàng ngày.

Dụng cụ chuẩn bị

Giấy báo cũ
1 cuộn băng dính trong suốt
Keo dán
1 đoạn thừng nhỏ trang trí
Máy dập lỗ tròn
Hướng dẫn thực hiện

Bước 1: Cắt tờ giấy báo có kích thước lớn thành hình chữ nhật với kích thước chiều dài gấp 1.5 lần chiều rộng, sau đó gấp 2 mép giấy báo vào đường chính giữa rồi dán  2 mép giấy lại bằng băng dính trong suốt.
Bước 2: Tiếp theo, bạn chọn 1 đầu giấy làm đáy túi và gấp ngược phần đáy đó lên khoảng 4cm, đồng thời lật ngược 1 mép đáy, mở rộng và tạo thành 2 hình tam giác ở 2 bên, gấp tiếp 2 mép đáy trên dưới vào rồi dán cố định lại bằng băng keo trong.
Bước 3: Để tạo thêm độ chắc chắn cho túi, bạn gấp tiếp mép ở 2 bên cạnh túi vào sao cho phần mép gấp phải trùng khít với góc tam giác ở đáy túi.
Bước 4: Cuối cùng, bạn dùng máy bấm lỗ tròn và dây thừng nhỏ tạo thành 2 dây xách cho túi của mình.
https://hupuna.com/wp-content/uploads/2024/01/tai-che-giay-3-2.jpg?w=1130
',
'https://hupuna.com/wp-content/uploads/2024/01/tai-che-giay-3-2.jpg?w=1130'
),
(6,
'6 cách tái chế thùng giấy carton trang trí cực hữu ích',
'1. Làm tủ kéo
Để tiến hành, bạn cần sẵn sàng những vật dụng đơn giản như kéo, giấy dán có họa tiết, đoạn nhựa mỏng, keo sữa hoặc súng bắn keo, và nguyên liệu chính không thể thiếu là thùng carton có sẵn.

Tủ kéo làm từ thùng giấy carton nhiều ngăn chứa có thể dùng để đựng đồ nhỏ xinh. Tủ kéo này có thể được đặt trên bàn làm việc, góc học tập hoặc bàn trang điểm để thuận tiện sắp xếp các phụ kiện cần thiết.

Trước hết, hãy xác định kích thước tủ kéo mà bạn muốn. Bạn có thể vẽ một bản thiết kế hoặc ghi chú kích thước cụ thể để làm quá trình thực hiện dễ dàng hơn.
Sau đó, cắt thùng giấy thành các miếng có kích thước tương ứng với bản thiết kế. Sử dụng keo dính để lắp ghép các miếng giấy với nhau, tạo thành hình dạng của tủ kéo. Bạn có thể sử dụng giấy dán họa tiết hoặc giấy màu để trang trí bề mặt tủ.
Để tăng tính chắc chắn, bạn có thể sử dụng đoạn nhựa mỏng để dán vào các cạnh và góc của tủ. Điều này sẽ giúp tủ kéo trở nên vững chãi và bền bỉ hơn.
Đối với hộc tủ, bạn cũng có thể tái chế thùng giấy để tạo thành các ngăn chứa. Hãy cắt giấy thành các miếng có kích thước tương ứng và dùng keo để ghép chúng lại thành hộc tủ. Nếu cần, bạn có thể thêm thanh nhựa làm tay nắm để dễ dàng mở và đóng hộc.
Với những bước đơn giản như vậy, bạn có thể tận dụng vật liệu như thùng giấy, giấy dán và đoạn nhựa mỏng để tự chế tạo một chiếc tủ kéo độc đáo và tiện dụng cho nhu cầu của mình.
https://zador.vn/wp-content/uploads/2022/10/thung-carton-tai-che-4.jpg

2. Giá đỡ, kẹp điện thoại, ipad
Thay vì tốn tiền để mua một chiếc kẹp điện thoại, ipad hoặc giá đỡ. Bạn có thể tận dụng những hộp giấy carton có sẵn trong nhà và biến hóa chúng trở thành chiếc giá đỡ, kẹp ipad, điện thoại vô cùng tiện dụng, không mất phí.

Bạn chỉ cần sử dụng kéo cắt thùng carton thành 2 miếng, một miếng để dọc và một miếng để ngang. Sau đó, gấp mép hai miếng giấy carton vừa cắt lại với nhau là bạn đã có được chiếc giá đỡ điện thoại, ipad.
https://zador.vn/wp-content/uploads/2022/10/thung-carton-tai-che-2.jpg

3. Kệ đựng sách từ tái chế thùng carton
Để tái chế thùng carton làm kệ đựng sách, bạn nên chọn những thùng giấy dày và cứng. Như thế, mới có thể đảm bảo được độ chắc chắn của kệ đựng sách khi sử dụng.

https://i.ytimg.com/vi/aUW6UaIOH58/hqdefault.jpg
Tiếp theo, bạn hãy tiến hành cắt thùng carton theo cùng kích thước và cùng kiểu. Cuối cùng dán các lớp giấy chồng lên nhau để tạo thành chiếc kệ đựng sách. Bạn hoàn toàn có thể sử dụng chiếc kệ từ giấy này thay cho chiếc bàn nhỏ đặt cạnh đầu giường hoặc đựng sách.

Nếu bạn là người khéo tay và tỉ mỉ, bạn có thể cắt thùng carton thành nhiều hình dáng khác nhau để chiếc kệ đựng sách thêm xinh xắn hơn.
https://zador.vn/wp-content/uploads/2022/10/tai-che-bia-carton-3.jpg
4. Giá đựng sách, tiểu thuyết
Tương tự như cách làm kệ đựng sách, bạn cũng cắt thùng giấy thành các miếng có cùng kích thước. Sau đó, gắn chúng lại với nhau để tạo thành chiếc giá sách. Tái chế thùng carton làm giá đựng sách, tiểu thuyết bạn có thể đặt chúng ở bất kỳ vị trí nào trong nhà, từ phòng khách đến phòng ngủ.

Giá đựng sách, tiểu thuyết làm từ thùng carton đã qua sử dụng

5. Kệ, khay đựng giấy tờ
Khay đựng giấy tờ giúp bạn sắp xếp tất cả các loại hồ sơ, giấy tờ quan trọng ngăn nắp và gọn gàng hơn, tiết kiệm thời gian tìm kiếm. Với một vài thao tác đơn giản, bạn hoàn toàn có thể biến thùng carton thành khay đựng giấy tờ đẹp mắt.

Trước hết, bạn hãy gấp các tấm bìa carton hoặc thùng carton thành từng hộc tủ một. Sau đó, chồng lần lượt các hộc tủ lại với nhau rồi sử dụng keo sữa cố định lại. Tiến hành cắt thùng carton thành từng miếng có kích thước bằng với hộc tủ, cuối cùng dán cố định chúng lại để đựng hồ sơ, giấy tờ.

https://zador.vn/wp-content/uploads/2022/10/tai-che-thung-giay-carton.jpg
6. Khay đỡ điện thoại
Cách tái chế thùng carton để làm khay đỡ điện thoại vô cùng đơn giản. Bạn chỉ cần dán chồng tất cả các lớp giấy thùng carton lại với nhau. Sau đó, đo kích thước của điện thoại rồi vẽ lên bề mặt thùng carton, tiếp đến cắt một lỗ bên trong thùng theo kích thước vừa đo. Bạn hoàn toàn có thể cắt nhiều lỗ trên cùng một khay từ giấy carton để đựng nhiều đồ dùng khác nhau.
https://zador.vn/wp-content/uploads/2022/10/tai-che-hop-giay-2.jpg
',
'https://zador.vn/wp-content/uploads/2022/10/tai-che-thung-carton-2.jpg'
),
(8,
'5 Sản Phẩm Tái Chế Từ Giấy Khiến Bạn Kinh Ngạc',
'Các sản phẩm đã được tái chế từ giấy
1 Bàn ghế tái chế
Bàn ghế được làm bằng bìa cứng tái chế chắc chắn sẽ là một điểm cộng bất ngờ, và dấu ấn không thể quên cho những vị khách đến thăm nhà. Các sản phẩm tái chế từ giấy bìa cứng không chỉ mang lại tính thời trang mà còn thân thiện với môi trường. Đặc biệt, chúng còn có thể chịu được áp lực tương tự như đồ nội thất bằng gỗ.
https://thietkeinanktp.com/wp-content/uploads/2022/01/do-tai-che-tu-giay.jpg
2 Giá đỡ điện thoại
Thay vì tốn thêm tiền để mua một chiếc kẹp cho điện thoại, hay giá đỡ cho máy tính của mình. Bạn có thể tận dụng tối đa các tấm bìa cứng cũ của mình, và hô biến nó trở thành một chiếc giá đỡ độc đáo. Ưu điểm của loại giá đỡ handmade này là “độc nhất vô nhị”, mang đậm dấu ấn cá nhân. Không chỉ vậy còn vô cùng tiết kiệm, và có thể mang đi tới bất kỳ đâu mà bạn muốn.
https://thietkeinanktp.com/wp-content/uploads/2022/01/gia-do-dien-thoai-bang-giay.jpg
3. Kệ giấy
Chỉ với một vài bước đơn giản, cắt các bìa cứng có cùng kích thước và kiểu dán, sau đó dán các lớp bìa lại với nhau, gia cố, và trang trí thêm. Là bạn đã có một kệ giấy vô cùng độc đáo, dùng để đựng sách vở, đèn ngủ, văn phòng phẩm,…. Chiếc kệ này bạn có thể đặt ở đầu giường, tủ sách, hoặc thậm chí làm trang trí đều được. Nếu bạn có hoa tay và thành thạo các công đoạn, bạn có thể biến tấu chúng thêm nhiều cách khác nhau để tăng tính thẩm mỹ, thu hút, độc đáo và khác biệt hơn.
https://thietkeinanktp.com/wp-content/uploads/2022/01/ke-giay-don-gian.jpg
4. Giá sách
Cách làm đồ tái chế bằng giấy này cũng tương tự như cách làm kệ sách mini ở mục trên. Với giá sách, bạn chỉ cần lựa những miếng bìa cứng có kích thước lớn hơn, xếp chúng lại và dán keo chắc chắn. Vậy là bạn đã có thể sở hữu cho mình một chiếc giá sách vừa vặn, phù hợp với không gian của mình. Ngoài ra, bạn có thể trang trí cho nó để nó trông giống với một chiếc tủ gỗ thông thường. Vừa tinh tế, nhẹ nhàng, lại vô cùng dễ thực hiện đúng không nào!
https://thietkeinanktp.com/wp-content/uploads/2022/01/gia-sach-tai-che-tu-giay.jpg
5 Kệ mini
Để làm kệ mini, bạn có thể tham khảo cách làm tương tự như tủ sách. Ngoài ra, hãy trang trí thật đẹp để biến kệ mini của mình trở thành một thứ đồ trang trí độc đáo, nhưng mà vẫn rất tiện dụng, “đa zi năng” nha.
https://thietkeinanktp.com/wp-content/uploads/2022/01/ke-nho-mini.jpg
',
'https://thietkeinanktp.com/wp-content/uploads/2022/01/lam-do-tai-che-tu-giay.jpg'
),
(3,
'Carbon footprint là gì? 7 Cách giảm thiểu dấu chân carbon',
'1. Carbon footprint là gì?
Carbon footprint (dấu chân carbon) là tổng lượng phát thải khí nhà kính đến từ quá trình sản xuất, sử dụng và cuối vòng đời của một sản phẩm hoặc dịch vụ. Nó bao gồm các chất carbon dioxide (CO2) là loại khí mà con người thải ra nhiều nhất, và những loại chất khác, bao gồm khí metan (CH4), nitơ oxit (NO2) và flo (F). Những loại khí nhà kính có ảnh hưởng tới sức khỏe con người và giữ nhiệt trong khí quyển, gây ra hiện tượng nóng lên toàn cầu.
https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-1_1629387631.jpg
Carbon footprint là tổng lượng phát thải khí nhà kính được tạo ra bởi các hành động của con người (Nguồn: worldculturenetwork.com)
Dấu chân carbon do một người, tổ chức hay quốc gia tạo ra có thể theo cách trực tiếp hoặc gián tiếp. Phát thải trực tiếp như khi bạn sử dụng năng lượng để lái xe hay sử dụng các thiết bị điện. Gián tiếp là khi bạn sử dụng bất kể một vật dụng bất kỳ mà cần dùng năng lượng để sản xuất ra nó, ví dụ như thực phẩm hay quần áo. Thông thường, phần lớn lượng khí thải carbon của một cá nhân sẽ đến từ giao thông vận tải, nhà ở và thực phẩm.

Thuật ngữ Carbon footprint được công bố lần đầu tiên vào năm 1979, trong một cuộc họp của Ủy ban năng lượng Vườn quốc gia Yosemite. Tuy nhiên, mãi đến năm 2007, thuật ngữ dấu chân carbon mới được chính thức đưa vào sử dụng trong những báo cáo khoa học đầu tiên về biến đổi khí hậu của IPCC (Intergovernmental Panel on Climate Change - Ủy ban liên chính phủ về biến đổi khí hậu).

2. Cách tính Carbon footprint (dấu chân carbon)
Sau khi hiểu được Carbon footprint là gì, vậy dấu chân carbon được tính như thế nào? Cách tính thông số này cần dựa trên nhiều yếu tố, bao gồm: Khu vực sinh sống, phong cách sinh sống, loại và mức năng lượng tiêu thụ, những sản phẩm công nghệ được sử dụng và cách sử dụng, cùng nhiều yếu tố khác. 

Trong đó, cách tính lượng khí thải carbon tốt nhất được sử dụng là dựa trên mức độ tiêu thụ nhiên liệu của một người. Cuối cùng, cộng dồn lượng phát thải CO2 vào Carbon footprint của cá nhân.

https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-2_1629387671_1631639675.jpg
Cách tính thông số dấu chân Carbon cần dựa trên nhiều yếu tố (Nguồn: sustainableprinceton.org)
Ví dụ: Bạn sử dụng xe máy để di chuyển đường 200km với mức tiêu thụ của xe là 2,5 lít xăng/100km. 

Tổng quãng đường 200Km sẽ tiêu thụ hết: 2,5 x 2 = 5 lít xăng. 
Mỗi lít xăng được tính sẽ phát thải 2,3 kg khí CO2. 
Tính tổng việc di chuyển này sẽ làm tăng 5 x 2,3 kg = 11,5 kg CO2. Con số này sẽ cộng cộng vào Carbon footprint của bạn hàng năm. Tại Việt Nam, chỉ số Carbon footprint trung bình lên tới gần 1,18 tấn/người/năm. 

Nhằm hạn chế và kiểm soát tốt hơn mức độ ô nhiễm môi trường, mỗi quốc gia sẽ có những quy định về tiêu chuẩn khí thải riêng, đặc biệt với ô tô. Là một quốc gia đang phát triển với mức độ ô nhiễm cao, việc áp dụng tiêu chuẩn khí thải ô tô Việt Nam là rất cần thiết. 

3. Tại sao mỗi người cần giảm số dấu chân carbon?
Tất cả những vấn đề xoay quay mối quan tâm về Carbon footprint là gì rốt cuộc đều nhằm đánh giá một cá nhân, các doanh nghiệp hay các chính phủ có thể có bao nhiêu tác động đến lượng phát thải khí nhà kính gây ảnh hưởng đến môi trường.

Trên thực tế, mối liên hệ giữa phát thải khí nhà kính và biến đổi khí hậu là quá rõ ràng và khó có thể bỏ qua. Nhiệt độ trung bình toàn cầu đang tăng lên, các hiện tượng thời tiết cực đoan ngày càng trở nên khắc nghiệt hơn, mực nước biển dâng cao và hiện tượng axit hóa đang diễn ra. Tất cả các mối đe dọa sinh thái này đều là kết quả từ hoạt động sống của con người.
https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-3_1710323429.jpg
Bằng cách giảm lượng khí thải carbon, bạn có thể góp phần vào việc giảm tổng lượng khí thải nhà kính. Trong cuộc chiến chống biến đổi khí hậu của chúng ta, tất cả mọi người cần thực hiện những điều chỉnh nhỏ những có thể dẫn đến kết quả lớn.

Nó không chỉ là về môi trường. Giảm số dấu chân carbon của bạn có thể giúp bạn có một lối sống lành mạnh hơn, cũng như giúp bạn tiết kiệm tiền. Cho dù đó chỉ là bầu không khí sạch hơn, chế độ ăn uống lành mạnh hơn hay giảm hóa đơn tiêu thụ năng lượng hàng tháng. Những lợi ích từ việc giảm lượng khí thải carbon của bạn cũng có nghĩa là bạn đang nỗ lực hết mình để chống lại biến đổi khí hậu
4. 7 biện pháp giảm thiểu số dấu chân carbon
4.1. Giảm ăn thịt và sữa bò
Khí thải nhà kính từ hoạt động sản xuất và kinh doanh nông nghiệp là một vấn đề thậm chí còn lớn hơn cả nhiên liệu hóa thạch. Thực tế loại thực phẩm gây ra dấu chân Carbon lớn nhất là thịt bò và sữa bò. Theo tính toán, để sản xuất được 1 kg thịt bò sẽ phát thải lượng CO2 tương đương với lượng CO2 của một chiếc ô tô chạy quãng đường 27km. 

Các loại thịt đỏ như thịt bò đặc biệt ảnh hưởng đến số dấu chân carbon vì sẽ tạo ra lượng khí thải nhiều gấp 5 lần và lượng nước tiêu thụ gấp 11 lần và so với các loại thịt gia cầm. Do vậy, bạn hãy hạn chế sử dụng các sản phẩm thịt đỏ và sữa động vật, có thể thay thế bằng các loại rau củ, hạt, quả và có chế độ ăn thuần thực vật thì càng tốt

4.2. Hạn chế lái xe cá nhân
Một trong những nguyên nhân chính dẫn đến tăng số lượng carbon footprint là gì chính là lượng khí CO2 phát thải ra từ các phương tiện giao thông như xe ô tô. Thay vì lái xe riêng, bạn có thể chọn đi bộ, đi xe đạp, đi xe ô tô điện, xe máy điện hoặc đi xe buýt. Việc lựa chọn những loại xe điện xanh thân thiện với môi trường cũng là một giải pháp giúp cắt giảm lượng carbon thải ra từ quá trình thiêu thụ nhiên liệu cho mỗi lần di chuyển.

https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-5_1710323440.jpg

Các thành phố lớn trên thế giới cũng đang đầu tư phát triển cơ sở hạ tầng giao thông công cộng để giảm thiểu lượng khí thải CO2 từ xe ô tô, đồng thời đáp ứng nhu cầu đi lại ngày càng tăng khi dân số tăng lên. Các lựa chọn phương tiện công cộng như xe buýt, tàu điện ngầm, xe lửa có thể giúp giảm tới 37 triệu tấn CO2 hàng năm.

4.3. Chuyển sang dùng năng lượng sạch, bền vững
Hầu hết năng lượng được sử dụng hiện nay đến là nhiên liệu hóa thạch như dầu mỏ, than đá và khí đốt tự nhiên. Những nhiên liệu này được sử dụng để sưởi ấm và vận hành các phương tiện giao thông. Tuy nhiên, nhiên liệu hóa thạch có hạn, nguồn tài nguyên thiên là hữu hạn và khi đốt cháy nhiên liệu sẽ thải ra chất độc gây ô nhiễm không khí, làm tăng tốc độ biến đổi khí hậu.

Tuy nhiên, hiện nay chúng ta hạn chế sự phụ thuộc vào nhiên liệu hóa thạch bằng cách chuyển sang năng lượng sạch và bền vững như sử dụng năng lượng điện, gió, mặt trời và địa nhiệt. 

Bạn có thể sử dụng các dòng xe máy điện, ô tô điện thay cho xe chạy bằng nhiên liệu hóa thạch như xăng, dầu. Tại Việt Nam, khách hàng có thể chọn mua những sản phẩm xe máy điện và ô tô VinFast sử dụng năng lượng sạch, không phát thải khí nhà kính gây ô nhiễm môi trường.

https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-6_1710323448.jpg

4.4. Trồng cây
Cho dù bạn sống trong một ngôi nhà hay một căn hộ chung cư ở đô thị thì việc trồng một số loại cây cảnh xanh là một cách để giảm lượng khí thải carbon dễ dàng và nhanh chóng. Chúng ta đều biết thực vật hấp thụ carbon dioxide và tạo ra oxy, rất có lợi cho sức khỏe con người.

https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-7_1710323459.jpg
Mỗi một cây xanh có khả năng tiêu thụ gần 24 kg khí CO2 mỗi năm. Vì vậy, việc tạo thêm không gian cho cây xanh hoặc trồng các loại cây xanh là một giải pháp cải thiện tiêu chuẩn chất lượng không khí, giúp thanh lọc bụi bẩn và làm giảm hiệu ứng Carbon footprint, giúp làm mát không khí.

4.5. Tắt các thiết bị điện khi không sử dụng
Theo các nghiên cứu cho biết hàng năm lượng khí thải từ các thiết bị điện ở chế độ chờ của các gia đình tại Anh có thể lên đến 800.000 tấn khí thải CO2/năm. Do đó, để giảm dấu chân carbon do thiết bị điện gây ra, cách đơn giản nhất chính là hãy tắt nguồn hoàn toàn hoặc rút nguồn điện tắt tất cả các thiết bị điện khi không sử dụng

4.6. Thực hiện 5R không lãng phí
Không lãng phí chính là một giải pháp hiệu quả để chống lại biến đổi khí hậu. Thực hành 5R không lãng phí với ba nguyên tắc R gồm: Giảm thiểu, tái sử dụng và tái chế. Chi tiết như sau:

Refuse - Từ chối: Tránh sử dụng đồ nhựa một lần và các sản phẩm bằng giấy bằng cách nói “Không, cảm ơn”, hãy chọn đồ có thể tái sử dụng.
Reduce - Giảm tiêu dùng: Giảm kích thước những gì bạn mua, hãy lựa chọn quan tâm hơn đến những gì bạn thực sự cần.
Reuse - Tái sử dụng: Luôn tìm cách tái sử dụng một món đồ bằng cách giữ nó trong tình trạng tốt, sửa chữa hoặc nâng cấp khi nó bị hỏng.
Rot: Thiết lập một hệ thống phân trộn từ thức ăn thừa hoặc tìm một trung tâm thu mua phế liệu thực phẩm (như chợ nông sản hoặc công viên cộng đồng) gần nhà của bạn.
Recycle - Tái chế: Tái chế đúng cách bất kỳ vật dụng bằng nhựa, giấy, thủy tinh hoặc kim loại nào, giảm bớt hoặc tái sử dụng các vật dụng.
https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-8_1629387941.jpg

4.7. Hạn chế sử dụng fast fashion - Thời trang nhanh
Thời trang nhanh (fast fashion) là những loại quần áo được thiết kế theo xu hướng nhất thời từ những buổi biểu diễn thời trang hay phong cách quần áo của những người nổi tiếng. Những sản phẩm thười trang này này thường rẻ tiền và liên tục thay đổi. 

Quá trình sản xuất và sử dụng quá nhiều quần áo thời trang ăn liền sẽ ảnh hưởng lớn đến dấu chân carbon do áp lực từ việc giảm chi phí và rút ngắn thời gian sản xuất sẽ khiến tăng phát thải nhiều CO2 hơn ra môi trường. Ngoài ra, việc sử dụng các loại thuốc nhuộm vải dệt rẻ tiền, độc hại cũng gây ô nhiễm nguồn nước.  

Vậy giải pháp để giảm lượng carbon footprint là gì? Đó là hãy hạn chế tiêu thụ những sản phẩm thời trang ăn liền để giảm thiểu đáng kể số lượng dấu chân carbon lên môi trường.

Việc hiểu được carbon footprint là gì giúp mọi người ý thức hơn về việc hạn chế những hoạt động gây phát thải nhiều khí nhà kính ra môi trường. Một trong những giải pháp thực tiễn và mang lại hiệu quả rõ rệt nhất chính là sử dụng những dòng xe chạy bằng điện như ô tô, xe máy điện VinFast thế hệ mới thay thế cho các phương tiện chạy bằng xăng, dầu; rất đáng cân nhắc lựa chọn.

Các mẫu xe xanh hiện là lựa chọn ưu tiên của nhiều khách hàng để góp phần bảo vệ môi trường sống. VinFast hiện có nhiều ưu đãi hấp dẫn khi khách hàng đặt mua VF e34 và đặt cọc VF 8, VF 9 online. Quý khách sẽ được trải nghiệm các công nghệ hiện đại, tính năng mạnh mẽ và thông minh được tích hợp trên xe.
',
'https://storage.googleapis.com/vinfast-data-01/carbon-footprint-la-gi-7-cach-giam-thieu-dau-chan-carbon-8_1629387941.jpg'
),
(4,
'Cách để Làm hệ thống tưới nhỏ giọt bằng chai nhựa',
'Một số loài cây đòi hỏi phải tưới thường xuyên mà không phải ai cũng đáp ứng được. Nếu trong nhà có nhiều cây xanh háo nước và bạn không có thời gian để tưới, có lẽ bạn nên lắp hệ thống tưới nhỏ giọt. Các thiết bị này có thể khiến bạn tốn không ít tiền nếu mua ở cửa hàng, nhưng may mắn là bạn có thể tự làm hệ thống tưới nhỏ giọt tại nhà với các chai nhựa khá dễ dàng mà không tốn kém bao nhiêu, và tốt hơn cả là bạn đang giúp ích cho môi trường bằng việc tái chế các chai nhựa.

Bước 1: Tìm một chai nhựa.
Chai nhựa 2 lít là tốt nhất, nhưng bạn có thể dùng chai nhỏ hơn để tưới các cây nhỏ. Rửa kỹ chai nước và bóc nhãn chai.

https://www.wikihow.com/images_en/thumb/2/22/Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-1-Version-2.jpg/550px-nowatermark-Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-1-Version-2.jpg.webp

Bước 2: Đục 4-5 lỗ trên nắp chai.
Tháo nắp chai và đặt lên một mảnh gỗ. Dùng máy khoan hoặc búa và đinh để đục vài lỗ trên nắp chai. Càng có nhiều lỗ trên nắp chai thì nước càng chảy nhanh. Đóng nắp chai lại khi đã đục lỗ xong.

Tránh đục lỗ quá nhỏ để khỏi bị tắc vì đất lọt vào.

Bước 3: Cắt rời đáy chai.
Bạn có thể dùng dao răng cưa hoặc kéo sắc để cắt. Bạn cần cắt đi khoảng 2,5 cm đáy chai. Nếu chai nước ngọt có các đường rãnh xung quanh đáy chai, bạn có thể cắt theo đường rãnh đó.

https://www.wikihow.com/images_en/thumb/0/09/Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-3-Version-2.jpg/550px-nowatermark-Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-3-Version-2.jpg.webp

Bước 4: Đào một hốc trong đất.
Hốc đất phải đủ sâu để bạn có thể chôn đến nửa chai.[4] Đào hốc đất cách thân cây khoảng 10 -15 cm. Nếu đào đất sát cạnh một cây đã bén rễ, bạn nên cẩn thận kẻo cắt đứt rễ cây.

https://www.wikihow.com/images_en/thumb/3/39/Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-4-Version-2.jpg/550px-nowatermark-Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-4-Version-2.jpg.webp

Bước 5: Đặt chai vào hốc đất, phần nắp chai úp xuống.
Bạn nhớ đóng nắp chai trở lại, sau đó lật ngược chiếc chai và đặt vào hốc đất. Nhẹ nhàng vỗ đất xung quanh chai.

Bạn có thể chôn chiếc chai sâu hơn, nhưng phải đảm bảo chai nhô lên khỏi mặt đất tối thiểu là 2,5 cm. Điều này sẽ giúp ngăn ngừa đất rơi vào nước.

https://www.wikihow.com/images_en/thumb/5/53/Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-5.jpg/550px-nowatermark-Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-5.jpg.webp

Bước 6: Rót nước vào chai, lật ngược phần đáy đã cắt rời và đậy lại sao cho đáy chai nằm trên mặt nước để hứng sạn đất có thể rơi vào chai gây tắc.
Sau đó bạn có thể giao cho hệ thống tưới tự động làm việc. Làm số lượng bình tưới đủ cho số cây bạn muốn tưới.

https://www.wikihow.com/images_en/thumb/6/6c/Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-6.jpg/550px-nowatermark-Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-6.jpg.webp

Lời khuyên:
  + Nếu muốn tưới cây ăn quả, cây thảo mộc hoặc rau, bạn nên cân nhắc dùng chai nhựa không chứa BPA, vì loại nhựa này không thải hóa chất như các chai thông thường.

  + Lồng chai nước vào chiếc tất da ni lông trước khi chôn xuống đất. Điều này sẽ giúp ngăn chặn đất rơi vào làm tắc các lỗ tưới trên chai.

  + Rót thêm nước khi cần. Điều này phụ thuộc vào độ háo nước, nhu cầu nước của cây và độ nóng trong môi trường.

  + Một số loài cây, chẳng hạn như cà chua, thường đòi hỏi nhiều nước hơn là một chai 2 lít. Có thể bạn cần sử dụng nhiều bình tưới nhỏ giọt.

  + Cân nhắc bổ sung phân bón vào chai nước vài tuần một lần.

  + Bạn có thể dùng các đáy chai nước cắt ra để gieo hạt. Khoan vài lỗ thoát nước dưới đáy chai, sau đó đổ đất vào để gieo hạt.

Nguồn: https://www.wikihow.vn/L%C3%A0m-h%E1%BB%87-th%E1%BB%91ng-t%C6%B0%E1%BB%9Bi-nh%E1%BB%8F-gi%E1%BB%8Dt-b%E1%BA%B1ng-chai-nh%E1%BB%B1a
',
'https://www.wikihow.com/images_en/thumb/f/f4/Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-12.jpg/550px-nowatermark-Make-a-Drip-Irrigator-from-a-Plastic-Bottle-Step-12.jpg.webp'
),
(1,
'Bắt trọn 5 mẹo tái chế ly nhựa hữu ích dùng trong nhà',
'Thay vì vứt bỏ ly nhựa sau khi sử dụng xong, bạn hoàn toàn có thể tái chế ly nhựa dùng trong nhà. Không chỉ bảo vệ môi trường, mà còn rất tiết kiệm.

Thật vậy, những chiếc ly nhựa ngoài công dụng đựng đồ uống, còn có thể làm vật dụng hữu ích trong nhà. Vì sao bạn phải tốn tiền để mua những thứ mà bạn có thể tự tay làm được?

Chính vì điều đó, nội dung trong bài viết này đích thị là những gì bạn cần. Việc của bạn cần làm bây giờ là đọc nó.

1. Vì sao phải tái chế ly nhựa?
Gần đây, vấn đề rác thải nhựa đang báo động đỏ và gây nhức nhối trên toàn thế giới. Rất nhiều tổ chức, cá nhân, kể cả chính phủ đã kêu gọi giảm thiếu sử dụng nhựa và tìm cách tái chế hợp lý rác thải này. 

Rác thải nhựa, trong đó có ly nhựa phân hủy lâu lên đến hàng trăm, hàng nghìn năm. Nên dù những chiếc ly, cốc nhựa đựng trà sữa bạn uống mỗi ngày trông có vẻ nhỏ bé. Thế nhưng, chúng lại gây ảnh hưởng nghiêm trọng đến môi trường, sức khỏe con người và động vật. 

https://inlynhua.org/wp-content/uploads/2019/08/inlynhua-hinh-12.jpg

Ngày một tồi tệ hơn, trong năm 2019, hơn 1 triệu tấn ly nhựa, cốc nhựa được sản xuất và bị ném vào trong thùng rác sau một lần dùng. Trong khi diện tích rừng vẫn đang tiếp tục thu hẹp dần thì bãi rác ngày càng nhiều hơn. Từ đây, việc tái chế ly nhựa dùng trong nhà trở nên vô cùng thiết thực. Mang đầy ý nghĩa không chỉ cho gia đình mà toàn xã hội. Việc bạn sẽ làm hôm nay chính là bắt tay vào công cuộc bảo vệ môi trường của thế giới.

2. Những mẹo tái chế ly nhựa cực hay trong nhà
Chỉ một vài bước đơn giản, bạn đã có thể hô biến những chiếc ly nhựa thành các đồ dùng hữu ích trong nhà. Tưởng chừng như việc tái chế cốc nhựa thật cầu kỳ và phức tạp. Nhưng hóa ra, chúng ra đơn giản hơn bạn nghĩ. Bạn chỉ cần chuẩn bị:

  + Vài ly nhựa đã qua sử dụng. Nhưng cần lưu ý các ký hiệu trên đồ nhựa, ly nhựa để biết loại nào có thể tái chế, loại nào không bạn nhé!

  + Dao, kéo, keo dán, hồ dán, giấy màu, bút màu các loại,…

2.1. Làm chậu cây
Những chiếc ly nhựa có thể dùng làm chậu cây và trồng rất nhiều cây xanh đặt trong nhà. Cách này vừa giúp bạn trồng cây, vừa tiết kiệm một phần chi phí cho việc mua chậu cây bên ngoài. Bạn có thể tái chế ly trà sữa sau khi uống xong hay bất kỳ ly có thân cao đều được. 

Hơn thế nữa, bạn có thể biến tấu thành nhiều màu sắc đa dạng, trang trí thêm nhiều họa tiết sặc sỡ để chậu cây từ ly nhựa tái chế trở nên đẹp mắt hơn. Ngoài ra, vì ly nhựa phù hợp với loại cây leo hoặc cây nhỏ thân mềm, không chiếm quá nhiều diện tích trong nhà, thế nên bạn cũng có thể làm một vườn treo lý tưởng. Với cách này, bạn cần thực hiện như sau:

  + Dùng dao cắt một vài lỗ nhỏ dưới đáy ly nhựa PET

  + Sơn màu tùy thích rồi dùng bút vẽ trang trí ly nhựa thật nhiều họa tiết đẹp mắt

  + Nếu bạn muốn treo lên giàn, thì lấy kéo rạch 2 lỗ nhỏ bên hông, rồi lấy dây xỏ qua

  + Cho đất và hạt mầm vào rồi tưới nước, chăm sóc hằng ngày

2.2. Làm ống đựng bút
https://inlynhua.org/wp-content/uploads/2021/11/ong-dung-but-tu-ly-nhua.jpg

Góc học tập sẽ không còn nhàm chán nữa mà trở nên bắt mắt hơn thông qua việc tái sử dụng ly nhựa thành hộp đựng bút nhỏ nhắn, xinh xắn. Đặc biệt hơn, bạn có thể tùy ý trang trí hộp bút theo sở thích. Thay vì phải mất thời gian tìm kiếm hộp bút đúng ý ở bên ngoài. 

  + Sử dụng chiếc ly nhựa cứng đã làm sạch

  + Tô màu cốc trà sữa theo ý thích

  + Lấy kéo cắt giấy màu tạo hình nhân vật yêu thích rồi dán lên ly

Chẳng mấy chốc, bạn đã cho ra những chiếc hộp bút tái chế trong một nốt nhạc.

2.3. Cách làm đèn bằng ly nhựa
Màu trắng trong suốt từ ly nhựa có thể được tận dụng. Theo đó, bộ đèn dây sẽ phát sáng thật lung linh từ bên trong ly nhựa tái chế. Bạn hãy thực hiện:

  + Khoét lỗ dưới đáy ly nhựa PP

  + Luồn dây điện và đèn vào bên trong

  + Lấy băng kéo dán dây điện lại cố định

Một ý tưởng nhỏ này cũng có thể giúp bạn tái chế ly nhựa thật dễ dàng.

2.4. Làm đồ chơi cho trẻ
Song song đó, bạn cũng có thể làm đồ chơi cho con, em mình từ ly nhựa trà sữa mình mua về. Tận dụng đồ dùng có sẵn như bút lông, giấy màu rồi tỉ mỉ vẽ thêm hoặc cắt dán một vài chi tiết là đã có một món đồ chơi dễ thường, hữu hiệu để “dỗ trẻ”. Bạn có thể làm bằng cách như sau:

  + Sử dụng ly nhựa PET, PP hay loại ly cứng có nắp đều được

  + Tô màu cho ly theo ý thích

  + Lấy bìa cứng cắt thành tai thỏ như hình, tô màu, trang trí ly nhựa với họa tiết tùy ý

https://inlynhua.org/wp-content/uploads/2021/11/do-choi-tu-ly-nhua.jpg

https://inlynhua.org/wp-content/uploads/2021/11/trang-tri-giang-sinh-tu-ly-nhua-e1636967989701.jpg

2.5. Làm vòng treo
Để giúp bức tưởng trông vô vị trở nên bắt mắt hơn, bạn có thể tái chế ly nhựa thành vòng treo cực sáng tạo. Với phương pháp tái chế này, bạn chỉ cần xếp ly nhựa chồng lên nhau rồi tạo hình sao cho giống vòng hoa. Lấy thêm một đoạn dây ruy băng ngắn để cố định rồi treo lên cửa hoặc bức tường trống. Bạn có thể gắn, dán thêm một vài họa tiết trang trí để đẹp hơn.

https://inlynhua.org/wp-content/uploads/2021/11/vong-hoa-ly-nhua.jpg

3. Một số lưu ý nhỏ khi tái sử dụng ly nhựa
Để việc tái chế cốc nhựa trở nên thành công hơn thì bạn cũng nên lưu ý một số điểm sau:

  + Trước khi bắt tay vào thực hiện cần phác thảo trước trên giấy

  + Tận dụng cả đồ nhựa cũ trong nhà để tái chế, chẳng hạn như bạn cũng có thể tái chế chai nhựa thành chậu cây, lọ hoa, hộp đựng bút,…

  + Không nên mạnh tay quá vì những loại ly nhựa cứng dễ vỡ

  + Không dùng nhiệt quá cao vì dễ làm nhựa biến dạng, gây cháy

Còn chần chừ gì nữa, bạn hãy tái chế ly nhựa dùng trong nhà ngay từ bây giờ để bảo vệ môi trường và cuộc sống của chính bạn. Ly nhựa đang ngày một phổ biến khi đồ uống take away lên ngôi. Do đó, tái sử dụng ly nhựa các loại là việc làm đúng đắn và rất được hoan nghênh.

Nguồn: https://inlynhua.org/tai-che-ly-nhua-dung-trong-nha/
',
'https://inlynhua.org/wp-content/uploads/2021/11/do-choi-tu-ly-nhua.jpg'
),
(2,
'Cách tái chế túi ni lông trong nhà bạn',
'Bạn sử dụng túi nhựa mỗi ngày để mang đồ tạp hóa về nhà hoặc để đựng những món đồ bạn đã mua ở cửa hàng. Túi nhựa không phân hủy sinh học, nghĩa là phải mất hàng trăm năm để chúng phân hủy. Tái chế túi nhựa cũ sẽ đảm bảo chúng được sử dụng lại trong các sản phẩm khác và không gây ô nhiễm môi trường. Bạn có thể tái chế túi nhựa bằng cách đưa chúng đến một trung tâm tái chế địa phương. Bạn có thể sử dụng chúng để tái sử dụng ở nhà hoặc làm đồ thủ công bằng chúng để chúng không bị đưa vào bãi rác.

1. Lót túi ni lông vào thùng rác.
Một cách bạn có thể tái sử dụng túi nhựa tại nhà là sử dụng chúng làm lớp lót để bảo vệ thùng rác của bạn. Cắt túi nhựa và dán chúng vào đáy thùng rác tại nhà để ngăn chất lỏng rò rỉ vào thùng từ thùng rác.

Bạn cũng có thể sử dụng túi nhựa để lót bất kỳ thùng rác nào khác trong nhà có xu hướng bị ướt, chẳng hạn như thùng tái chế hoặc thùng ủ phân.

https://www.wikihow.com/images/thumb/6/69/Recycle-Old-Plastic-Bags-Step-5-Version-2.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-5-Version-2.jpg.webp

2. Sử dụng chúng như túi đựng rác quanh nhà.
You can also use plastic bags in mini garbage bins around your home. Use a plastic bag in a bathroom or bedroom bin. When it comes time to empty the garbage, you can simply pull the plastic bag out and replace it with a new one.

You can also use plastic bags as garbage bags in your car.

https://www.wikihow.com/images/thumb/9/90/Recycle-Old-Plastic-Bags-Step-6-Version-3.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-6-Version-3.jpg.webp

3. Tái sử dụng chúng làm túi đựng đồ tạp hóa.
Cất túi nilon trong xe và mang theo đến cửa hàng tạp hóa. Sau đó, dùng chúng để đựng đồ tạp hóa. Đảm bảo túi nilon không có lỗ thủng và đủ dày để đựng đồ.

https://www.wikihow.com/images/thumb/5/5c/Recycle-Old-Plastic-Bags-Step-7-Version-3.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-7-Version-3.jpg.webp

4. Bọc những đồ vật mỏng manh trong túi nilon.
Túi nhựa cũng rất tốt để bảo vệ các vật dụng mỏng manh, chẳng hạn như tượng thủy tinh hoặc đồ gia truyền. Bọc các vật dụng mỏng manh trong túi nhựa trước khi cất chúng vào nhà.

Bạn cũng có thể sử dụng túi nhựa để bọc các vật dụng mỏng manh khi bạn di chuyển. Túi nhựa có khả năng đệm tốt, đặc biệt là nếu bạn xếp chồng chúng lên nhau.

https://www.wikihow.com/images/thumb/5/55/Recycle-Old-Plastic-Bags-Step-8-Version-3.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-8-Version-3.jpg.webp

5. Sử dụng túi ni lông để che những khu vực dễ bừa bộn trong nhà bạn.
Cắt túi nhựa và dán chúng xuống bàn hoặc mặt bàn để bảo vệ chúng. Đây có thể là một ý tưởng hay nếu bạn đang làm đồ thủ công tại nhà và muốn bảo vệ khu vực đó. Bạn cũng có thể sử dụng túi nhựa để che mặt bàn khi nấu ăn.

https://www.wikihow.com/images/thumb/f/fd/Recycle-Old-Plastic-Bags-Step-9-Version-2.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-9-Version-2.jpg.webp

6. Nhét túi nilon vào vỏ gối.
Use the plastic bags as stuffing for pillowcases, rather than buy stuffing from the store. Ball them up and stuff them in pillowcases to keep them fluffy.

You can also make a dog bed by stuffing plastic bags in a large pillowcase.

https://www.wikihow.com/images/thumb/2/2a/Recycle-Old-Plastic-Bags-Step-10-Version-2.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-10-Version-2.jpg.webp

7. Bảo quản túi nilon đúng cách.
Nếu bạn sẽ giữ nhiều túi nhựa trong nhà để sử dụng cho nhiều mục đích khác nhau, hãy đảm bảo bạn cất giữ chúng đúng cách để tránh bừa bộn và đảm bảo chúng không gây nguy hiểm cho trẻ em hoặc vật nuôi. Bạn có thể sử dụng ống đựng túi nhựa để cất giữ túi. Bạn cũng có thể treo một túi đựng rác trong tủ đựng thức ăn và cất túi nhựa vào đó.

Cất túi nhựa ở nơi tiện dụng, chẳng hạn như trong bếp hoặc gara để dễ dàng lấy ra khi cần.

https://www.wikihow.com/images/thumb/2/2d/Recycle-Old-Plastic-Bags-Step-11-Version-2.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-11-Version-2.jpg.webp

Nguồn: https://www.wikihow.com/images/thumb/2/2d/Recycle-Old-Plastic-Bags-Step-11-Version-2.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-11-Version-2.jpg.webp
',
'https://www.wikihow.com/images/thumb/0/03/Recycle-Old-Plastic-Bags-Step-2-Version-3.jpg/aid13028-v4-728px-Recycle-Old-Plastic-Bags-Step-2-Version-3.jpg.webp'
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

INSERT INTO post_category(post_id, category_id) VALUES (1,6);
INSERT INTO post_category(post_id, category_id) VALUES (2,6);
INSERT INTO post_category(post_id, category_id) VALUES (3,6);
INSERT INTO post_category(post_id, category_id) VALUES (4,5);
INSERT INTO post_category(post_id, category_id) VALUES (5,3);
INSERT INTO post_category(post_id, category_id) VALUES (6,3);
INSERT INTO post_category(post_id, category_id) VALUES (7,3);
INSERT INTO post_category(post_id, category_id) VALUES (8,1);
INSERT INTO post_category(post_id, category_id) VALUES (9,1);
INSERT INTO post_category(post_id, category_id) VALUES (10,1);
INSERT INTO post_category(post_id, category_id) VALUES (11,2);
INSERT INTO post_category(post_id, category_id) VALUES (12,2);
INSERT INTO post_category(post_id, category_id) VALUES (13,2);
INSERT INTO post_category(post_id, category_id) VALUES (14,5);
INSERT INTO post_category(post_id, category_id) VALUES (15,5);
INSERT INTO post_category(post_id, category_id) VALUES (16,6);
INSERT INTO post_category(post_id, category_id) VALUES (17,4);
INSERT INTO post_category(post_id, category_id) VALUES (18,4);
INSERT INTO post_category(post_id, category_id) VALUES (19,4);

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
INSERT INTO `comment` (`comment`, `user_id`, `post_id`, `created_at`) VALUES
	('Great post!', 3, 2, '2023-07-21 19:00:00'),
	('Nice work', 2, 3, '2023-07-21 19:01:00'),
	('Thanks for sharing', 3, 4, '2023-07-21 19:02:00'),
	('Very informative', 4, 5, '2023-07-21 19:03:00'),
	('Helpful!', 5, 6, '2023-07-21 19:04:00'),
	('Awesome!', 6, 7, '2023-07-21 19:05:00'),
	('Interesting read', 7, 8, '2023-07-21 19:06:00'),
	('Good job', 8, 9, '2023-07-21 19:07:00'),
	('Well done', 9, 10, '2023-07-21 19:08:00'),
	('Nice tips', 10, 11, '2023-07-21 19:09:00'),
	('Loved it', 11, 12, '2023-07-21 19:10:00'),
	('Great insights', 12, 4, '2023-07-21 19:11:00');


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

INSERT INTO `post_like` (`liked_by`, `post_id`, `liked_at`) VALUES
(2, 1, '2023-07-21 19:00:00'),
(3, 2, '2023-07-21 19:01:00'),
(4, 3, '2023-07-21 19:02:00'),
(5, 4, '2023-07-21 19:03:00'),
(6, 5, '2023-07-21 19:04:00'),
(7, 6, '2023-07-21 19:05:00'),
(8, 7, '2023-07-21 19:06:00'),
(9, 8, '2023-07-21 19:07:00'),
(10, 9, '2023-07-21 19:08:00'),
(11, 10, '2023-07-21 19:09:00'),
(12, 11, '2023-07-21 19:10:00'),
(13, 12, '2023-07-21 19:11:00'),
(2, 13, '2023-07-21 19:12:00'),
(3, 1, '2023-07-21 19:13:00'),
(4, 2, '2023-07-21 19:14:00'),
(5, 3, '2023-07-21 19:15:00'),
(6, 4, '2023-07-21 19:16:00'),
(7, 5, '2023-07-21 19:17:00'),
(8, 6, '2023-07-21 19:18:00'),
(9, 7, '2023-07-21 19:19:00'),
(10, 8, '2023-07-21 19:20:00'),
(11, 9, '2023-07-21 19:21:00'),
(12, 10, '2023-07-21 19:22:00'),
(13, 11, '2023-07-21 19:23:00'),
(2, 12, '2023-07-21 19:24:00'),
(3, 13, '2023-07-21 19:25:00'),
(4, 1, '2023-07-21 19:26:00'),
(5, 2, '2023-07-21 19:27:00'),
(6, 3, '2023-07-21 19:28:00'),
(7, 4, '2023-07-21 19:29:00'),
(8, 5, '2023-07-21 19:30:00'),
(9, 6, '2023-07-21 19:31:00'),
(10, 7, '2023-07-21 19:32:00'),
(11, 8, '2023-07-21 19:33:00'),
(12, 9, '2023-07-21 19:34:00'),
(13, 10, '2023-07-21 19:35:00');

CREATE TABLE `blacklist_token` (
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;
show tables;
select * from category;


select * from post;

