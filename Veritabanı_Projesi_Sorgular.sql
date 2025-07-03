 --- SORU 1. Toplam müşteri sayısını getir.
 
 select count(*) as toplam_müsteri_sayisi from customers; 
-- cevap : 100

--- SORU 2: Hangi şehirde kaç şube var?

select city, count(*) toplam_sube_sayisi from shops
group by city;


--- SORU 3: Her şubedeki çalışan sayısı ?

select * from shops;
select * from employees;

select s.city, s.shop_name,
	count(e.employee_id) as toplam_calisan_sayisi
from shops s 
left join employees e on s.shop_id = e.shop_id
group by s.city, s.shop_name;


--- SORU 4: Ortalama maaş hangi pozisyonda daha yüksek?

select * from employees;

select employee_position, 
	avg(salary) as ort_maas
from employees
group by employee_position
order by ort_maas desc
LIMIT 1 ;

--- SORU 5: En pahalı 5 ürün ?

select item_name, price
from menu_items
order by price desc
LIMIT 5;

--- SORU 6: En çok sipariş veren ilk 5 müşteri

select * from orders ;
select * from customers;

select c.customer_name, 
	count(o.order_id) as siparis_sayisi
from customers c
LEFT join orders o on o.customer_id = c.customer_id
group by c.customer_name
order by siparis_sayisi desc
LIMIT 5;



--- SORU 7: En çok tercih edilen ürünler (order_items tablosuna göre)

select * from order_items;
select * from menu_items ;

select mi.item_name, sum(oi.quantity) as toplam_adedi
from order_items oi inner join menu_items mi on oi.item_id = mi.item_id
group by item_name
order by toplam_adedi desc;



--- SORU 8: Her şubenin toplam cirosu (kampanya uygulanmış fiyatlar üzerinden)


SELECT * from shops;
select * from orders;


select  s.city, s.shop_name, sum(o.final_price) as toplam_ciro
from shops s left join orders o on s.shop_id = o.shop_id
group by s.address, s.city, s.shop_name
order by toplam_ciro desc;


--- SORU 9: En fazla satış yapılan 2 farklı mağaza bul ve her bir şehirdeki toplam satış tutarını göster

select * from orders
select * from shops

select s.city, sum(o.final_price) as toplam_satis_tutari
from shops s inner join orders o on s.shop_id = o.shop_id
group by s.city
order by  sum(o.final_price) desc
limit 2;


--- SORU 10: Her kampanya ile sağlanan toplam indirim miktarı

select * from campaigns
select * from orders

select c.campaign_id, campaign_name, sum(o.total_price - o.final_price) as toplam_indirim_miktari
from campaigns c inner join orders o on c.campaign_id = o.campaign_id
group by c.campaign_id, campaign_name
order by campaign_id;

--- SORU 11: Her ürünün toplam satış adedi ve elde edilen gelir

select * from menu_items
select * from order_items

select mi.item_name, sum(oi.quantity) as toplam_adedi, sum(oi.total_price) as toplam_gelir
from menu_items mi inner join order_items oi on mi.item_id = oi.item_id
group by mi.item_name
order by toplam_gelir desc;


--- SORU 12: Bir müşterinin verdiği en pahalı sipariş

select * from customers;
select * from orders

select c.customer_name,
max(o.total_price) as en_pahali_siparis,
o.final_price
from orders o inner join customers c on c.customer_id = o.customer_id
group by c.customer_name, o.final_price
order by en_pahali_siparis desc
limit 1;


--- SORU 13: En Yüksek Ciroyu Getiren Müşteri Hangi Şubeden?

select * from orders;
select * from customers;
select * from shops;

select c.customer_name, s.city, s.shop_name, sum(o.final_price) as toplam_harcama
from orders o 
inner join customers c on c.customer_id = o.customer_id
inner join shops s on s.shop_id = o.shop_id
group by c.customer_name, s.city,s.shop_name
order by toplam_harcama desc
limit 1;


--- 14. SORU: Her şubedeki en pahalı siparişi ve o siparişteki ürün adlarını listele

select * from shops;
select * from orders;
select * from order_items;
select * from menu_items;



select 
	s.shop_name,
	s.city, 
	mi.item_name,
	o.order_id,
	oi.total_price as ürün_fiyatı,
	oi.quantity,
	o.final_price
from orders o
inner join shops s on s.shop_id = o.shop_id
inner join order_items oi on oi.order_id = o.order_id
inner join menu_items mi on mi.item_id = oi.item_id
where o.final_price =(
	select max(o.final_price)
	from orders o
	where o.shop_id = s.shop_id
)
order by s.city



--- SORU 15: En fazla 3 farklı kategoriden ürün alan müşterileri ve toplam harcamaları listele, kampanya etkisiyle de karşılaştır.


select * from category;
select * from customers;
select * from orders;
select * from order_items;
select * from menu_items;

SELECT 
    cu.customer_name,
	---- Her siparişin final_price'ını yalnızca 1 kez toplamak için DISTINCT
    SUM(oi.total_price) AS toplam_urun_harcama,
    SUM(DISTINCT o.final_price) AS kampanyalı_net_odeme,
    SUM(DISTINCT o.total_price - o.final_price) AS toplam_indirim,
    COUNT(DISTINCT ca.category_id) AS kategori_sayısı
FROM orders o
INNER JOIN customers cu ON cu.customer_id = o.customer_id
INNER JOIN order_items oi ON oi.order_id = o.order_id
INNER JOIN menu_items mi ON mi.item_id = oi.item_id
INNER JOIN category ca ON ca.category_id = mi.category_id
GROUP BY cu.customer_name
HAVING COUNT(DISTINCT ca.category_id) <= 3
ORDER BY kampanyalı_net_odeme DESC;





--- SORU 16 : Kullanıcının Ürün Bazlı Harcama Tablosu

SELECT 
    c.customer_name,
    mi.item_name,
    SUM(oi.quantity) AS toplam_adet, --O üründen kaç tane sipariş etmiş?
    SUM(oi.total_price) AS toplam_harcama --	Toplam harcaması ne kadar olmuş?
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN menu_items mi ON mi.item_id = oi.item_id
WHERE c.customer_name = 'Engin Şen'  
GROUP BY c.customer_name, mi.item_name --Müşteri + ürün düzeyinde gruplanıyor
ORDER BY toplam_harcama DESC;



----------------------------------- VİEW ÖRNEKLERİ -----------------------------------------------

--- SORU 17: Ürün Satış Raporu Görünümü (item_sales_view)

--  NOT:Her ürünün ne kadar satıldığını ve ne kadar gelir elde edildiğini gösterir.

select * from order_items;
select * from menu_items;

create view item_sales_view as
select 
	mi.item_name,
	sum(oi.quantity) as toplam_adet, 
	sum(oi.total_price) as toplam_gelir
from order_items oi inner join menu_items mi on oi.item_id = mi.item_id
group by mi.item_name
order by toplam_gelir;

select * from item_sales_view
order by toplam_gelir;


--- SORU 18:Şehirlere Göre Satış Görünümü (city_sales_view)

--- NOT:Şubelerin bulunduğu şehirlerde ne kadar kazanç elde edildiğini özetler.

select * from shops;
select * from orders;

create view city_sales_view as
select 
	s.city, 
	sum(o.final_price) as toplam_kazanc
from orders o inner join shops s on s.shop_id = o.shop_id
group by s.city
order by toplam_kazanc desc;

select * from city_sales_view 
order by toplam_kazanc desc;


--- SORU 19: Kampanya Performans Görünümü (campaign_stats_view)

--- NOT: Hangi kampanya ne kadar kullanılmış ve ne kadar indirim sağlamış?

create view campaign_stats_view as
select 
	c.campaign_id,
	c.campaign_name, 
	sum(o.total_price - o.final_price) as toplam_indirim_miktari
from campaigns c inner join orders o on c.campaign_id = o.campaign_id
group by c.campaign_id, campaign_name
order by campaign_id;


select * from campaign_stats_view
order by campaign_id ;



SELECT 
    c.campaign_id,
    c.campaign_name,
    COUNT(o.order_id) AS kullanilma_sayisi,
    SUM(o.total_price - o.final_price) AS toplam_indirim,
    ROUND(AVG(o.total_price - o.final_price), 2) AS ortalama_indirim
FROM campaigns c
LEFT JOIN orders o ON o.campaign_id = c.campaign_id
GROUP BY c.campaign_id, c.campaign_name
ORDER BY ortalama_indirim DESC;



-----------------------------  FONKSİYON KULLANIMI --------------------------------------------------


--- SORU 20: Amaç: Bir müşterinin toplam harcamasını hesaplayan fonksiyon

create or replace function  toplam_harcama_bul(musteri_id INT)
returns nUmeric as $$
declare
	toplam numeric;
begin 
	select sum(final_price)
	into toplam
	from orders
	where customer_id = musteri_id;

	return coalesce (toplam, 0);
end;
$$ language plpgsql


select toplam_harcama_bul(59)


--- SORU 21: Bir şubenin günlük ortalama cirosunu hesaplayan fonksiyon

create or replace function sube_günlük_ort_ciro(sube_id INT)
returns numeric as $$
declare
	ortalama numeric;
begin
	select sum(final_price) / count(distinct date(order_date)) --- order_date = '2025-06-30 13:45:00' Date → '2025-06-30'
	into ortalama
	from orders
	where shop_id = sube_id;
	
	return coalesce(ortalama,0);
end;
$$ language plpgsql

select sube_günlük_ort_ciro(4)



--- Fonksiyon Şablonu (GENEL YAPI)
CREATE OR REPLACE FUNCTION fonksiyon_adi(parametre_ad parametre_tip)
RETURNS veri_tipi AS $$
DECLARE
    degisken_ad veri_tipi;
BEGIN
    -- SQL işlemleri
    RETURN sonuc;
END;
$$ LANGUAGE plpgsql;


--| Kısım                        | Açıklama                                               |
--| ---------------------------- | ------------------------------------------------------ |
--| `CREATE OR REPLACE FUNCTION` | Fonksiyon tanımlarken her zaman bu şekilde başlarsın.  |
--| `RETURNS ...`                | Fonksiyonun sonucunun tipi burada belirtilir.          |
--| `AS $$ ... $$`               | Fonksiyonun içeriğini tanımlamak için kullanılır.      |
--| `DECLARE ...`                | (İsteğe bağlıdır) Değişken tanımlamak için.            |
--| `BEGIN ... END;`             | Fonksiyonun işlemleri bu blokta yazılır.               |
--| `LANGUAGE plpgsql`           | PostgreSQL'in prosedürel diliyle yazıldığını belirtir. |



----------- TRIGGER ------------------------------------------------------------------------


--- SORU 22: Yeni müşteri eklenince log tablosuna kayıt atmak

--- NOT: Yeni müşteri eklendiğinde customer_logs tablosuna (tarih, isim, şube) gibi bilgiler loglansın.

----- ADIM 1: Log Tablosunu Oluştur

----- NOT:Bu tablo, her yeni müşteri eklemesinde log kayıtlarını tutacak.

-- DROP TABLE IF EXISTS customer_logs; (customer_logs silmek için)

CREATE TABLE customer_logs(
	log_id SERIAL PRIMARY KEY,
	customer_id INT,
	customer_name TEXT,
	shop_id INT,
	islem_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

----- ADIM 2: Fonksiyon Oluştur (Trigger Function)

create or replace function customer_logs_ekleme()
returns trigger as $$
begin
	insert into customer_logs(customer_id, customer_name, shop_id)
	values(NEW.customer_id, NEW.customer_name, NEW.shop_id);
	return new;
end
$$ language plpgsql;

---NEW anahtar kelimesi, eklenen müşteri satırını temsil eder.

----- ADIM 3 : Trigger oluştur.

create trigger log_customer_trigger
after insert on customers
for each row
execute function customer_logs_ekleme();

 ---- DROP TRIGGER IF EXISTS log_customer_trigger ON customers; (triiggeri silmek için)


--- not :Bu trigger customers tablosuna her ekleme olduğunda çalışır.


INSERT INTO customers (customer_name, customer_phone, customer_email, registration_date, customer_birthday, number_of_customer_stars, shop_id)
VALUES ('Test Kullanıcı', '05550000000', 'test@demo.com', '2025-06-30', '1990-01-01', 5, 1);

SELECT * FROM customer_logs ORDER BY log_id DESC;





--- SORU 23: orders tablosuna yeni kayıt eklendiğinde, order_logs adında bir log tablosuna kayıt düşülsün.

-- önce orders_log tablosunu oluştur

 create table orders_log(
	log_id serial primary key,
	order_id INT,
	customer_id INT,
	final_price numeric(10,2),
	log_date TIMESTAMP DEFAULT current_timestamp
 );

 -- sonra Trigger function oluştur.

create or replace function order_logs_ekleme()
returns trigger as $$
begin
	insert into orders_log(order_id, customer_id, final_price)
	values(NEW.order_id, NEW.customer_id, NEW.final_price);
	return new;
end
$$ language plpgsql;

--- trigger oluştur.

create trigger orders_log
after insert on orders
for each row
execute function order_logs_ekleme();

--- örnek :--

INSERT INTO orders (order_id, order_date, customer_id, shop_id, total_price, final_price, campaign_id)
VALUES (201, '2025-07-01 12:00:00', 1, 1, 500.00, 450.00, 2);

select * from orders_log 

