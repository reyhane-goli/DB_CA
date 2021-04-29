create database Company;
use Company;

CREATE TABLE employee
        (number INTEGER PRIMARY KEY,
         name VARCHAR(20),
         salary INTEGER,
         manager INTEGER,
         birthyear INTEGER,
         startyear INTEGER);
CREATE TABLE dept
        (number INTEGER PRIMARY KEY,
         name VARCHAR(20),
         store INTEGER NOT NULL,
         floor INTEGER,
         manager INTEGER);
CREATE TABLE item
        (number INTEGER PRIMARY KEY,
         name VARCHAR(20),
         dept INTEGER NOT NULL,
         price INTEGER,
         qoh INTEGER,
         CONSTRAINT ck_item_qoh CHECK (qoh >= 0),
         supplier INTEGER NOT NULL);
CREATE TABLE parts
        (number INTEGER PRIMARY KEY,
         name VARCHAR(20),
         color VARCHAR(8),
         weight INTEGER,
         qoh INTEGER);
CREATE TABLE supply
        (supplier INTEGER NOT NULL,
         part INTEGER NOT NULL,
         shipdate DATE NOT NULL,
         quan INTEGER,
         CONSTRAINT pk_supply PRIMARY KEY (supplier, part, shipdate));
CREATE TABLE sale
        (debit INTEGER NOT NULL,
         item INTEGER NOT NULL,
         quantity INTEGER,
         CONSTRAINT pk_sale PRIMARY KEY (debit, item));
CREATE TABLE debit
        (number INTEGER PRIMARY KEY,
         sdate DATE DEFAULT '2020-10-10' NOT NULL,
         employee INTEGER NOT NULL,
         account INTEGER NOT NULL);
CREATE TABLE city
        (name VARCHAR(15) PRIMARY KEY,
         state VARCHAR(6));
CREATE TABLE store
        (number INTEGER PRIMARY KEY,
         city VARCHAR(15) NOT NULL);
CREATE TABLE supplier
        (number INTEGER PRIMARY KEY,
         name VARCHAR(20),
         city VARCHAR(15) NOT NULL);
         
         
-- Add foreign keys
ALTER TABLE dept
ADD CONSTRAINT fk_dept_store FOREIGN KEY (store) REFERENCES store (number);
ALTER TABLE dept
ADD CONSTRAINT fk_dept_employee FOREIGN KEY (manager) REFERENCES employee (number)
        ON DELETE SET NULL;
ALTER TABLE item
ADD CONSTRAINT fk_item_dept FOREIGN KEY (dept) REFERENCES dept (number);
ALTER TABLE item
ADD CONSTRAINT fk_item_supplier FOREIGN KEY (supplier) REFERENCES supplier (number);
ALTER TABLE supply
ADD CONSTRAINT fk_supply_supplier FOREIGN KEY (supplier) REFERENCES supplier (number);
ALTER TABLE supply
ADD CONSTRAINT fk_supply_parts FOREIGN KEY (part) REFERENCES parts (number);
ALTER TABLE sale
ADD CONSTRAINT fk_sale_item FOREIGN KEY (item) REFERENCES item (number);
ALTER TABLE sale
ADD CONSTRAINT fk_sale_debit FOREIGN KEY (debit) REFERENCES debit(number);
-- implies that a debit/transaction must be created before a sale record.
ALTER TABLE debit
ADD CONSTRAINT fk_debit_employee FOREIGN KEY (employee) REFERENCES employee (number);
ALTER TABLE store
ADD CONSTRAINT fk_store_city FOREIGN KEY (city) REFERENCES city (name);
ALTER TABLE supplier
ADD CONSTRAINT fk_supplier_city FOREIGN KEY (city) REFERENCES city (name);


-- Create the view that has to be modified in lab 2, question 17
-- CREATE VIEW sale_supply(supplier, item, quantity) as SELECT supplier.name, item.name, sale.quantity FROM supplier, item, sale
-- WHERE supplier.number = item.supplier AND
--                sale.item = item.number;

INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(157, 'Jones, Tim', 12000, 199, 1940, 1960);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(1110, 'Smith, Paul', 6000, 33, 1952, 1973);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(35, 'Evans, Michael', 5000, 32, 1952, 1974);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(129, 'Thomas, Tom', 10000, 199, 1941, 1962);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(13, 'Edwards, Peter', 9000, 199, 1928, 1958);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(215, 'Collins, Joanne', 7000, 10, 1950, 1971);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(55, 'James, Mary', 12000, 199, 1920, 1969);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(26, 'Thompson, Bob', 13000, 199, 1930, 1970);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(98, 'Williams, Judy', 9000, 199, 1935, 1969);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(32, 'Smythe, Carol', 9050, 199, 1929, 1967);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(33, 'Hayes, Evelyn', 10100, 199, 1931, 1963);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(199, 'Bullock, J.D.', 27000, null, 1920, 1920);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(4901, 'Bailey, Chas M.', 8377, 32, 1956, 1975);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(843,  'Schmidt, Herman', 11204, 26, 1936, 1956);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(2398, 'Wallace, Maggie J.', 7880, 26, 1940, 1959);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(1639, 'Choy, Wanda', 11160, 55, 1947, 1970);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(5119, 'Bono, Sonny', 13621, 55, 1939, 1963);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(37, 'Raveen, Lemont', 11985, 26, 1950, 1974);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(5219, 'Schwarz, Jason B.', 13374, 33, 1944, 1959);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(1523, 'Zugnoni, Arthur A.', 19868, 129, 1928, 1949);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(430, 'Brunet, Paul C.', 17674, 129, 1938, 1959);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(994, 'Iwano, Masahiro', 15641, 129, 1944, 1970);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(1330, 'Onstad, Richard', 8779, 13, 1952, 1971);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(10, 'Stanley, Ross', 15908, 199, 1927, 1945);
INSERT INTO employee (number, name, salary, manager, birthyear, startyear)
	VALUES
	(11, 'Stuart, Ross', 12067, null, 1931, 1932);
    
    
ALTER TABLE employee
ADD CONSTRAINT fk_emp_mgr FOREIGN KEY (manager) REFERENCES employee(number)
ON DELETE SET NULL;

INSERT INTO city (name, state)
        VALUES
        ('Los Angeles', 'Calif');
INSERT INTO city (name, state)
        VALUES
        ('Oakland', 'Calif');
INSERT INTO city (name, state)
        VALUES
        ('El Cerrito', 'Calif');
INSERT INTO city (name, state)
        VALUES
        ('Atlanta', 'Ga');
INSERT INTO city (name, state)
        VALUES
        ('San Francisco', 'Calif');
INSERT INTO city (name, state)
        VALUES
        ('Boston', 'Mass');
INSERT INTO city (name, state)
        VALUES
        ('Dallas', 'Tex');
INSERT INTO city (name, state)
        VALUES
        ('Denver', 'Colo');
INSERT INTO city (name, state)
        VALUES
        ('White Plains', 'Neb');
INSERT INTO city (name, state)
        VALUES
        ('Amherst', 'Mass');
INSERT INTO city (name, state)
        VALUES
        ('Seattle', 'Wash');
INSERT INTO city (name, state)
        VALUES
        ('Paxton', 'Ill');
INSERT INTO city (name, state)
        VALUES
        ('New York', 'NY');
INSERT INTO city (name, state)
        VALUES
        ('San Diego', 'Calif');
INSERT INTO city (name, state)
        VALUES
        ('Hickville', 'Okla');
INSERT INTO city (name, state)
        VALUES
        ('Salt Lake City', 'Utah');
INSERT INTO city (name, state)
        VALUES
        ('Madison', 'Wisc');
        

INSERT INTO store (number, city)
	VALUES
	(5, 'San Francisco');
INSERT INTO store (number, city)
	VALUES
	(7, 'Oakland');
INSERT INTO store (number, city)
	VALUES
	(8, 'El Cerrito');
   
   
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(35, 'Book', 5, 1, 55);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(10, 'Candy', 5, 1, 13);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(19, 'Furniture', 7, 4, 26);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(20, 'Major Appliances', 7, 4, 26);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(14, 'Jewelry', 8, 1, 33);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(43, 'Children''s', 8, 2, 32);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(65, 'Junior''s', 7, 3, 37);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(58, 'Men''s', 7, 2, 129);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(60, 'Sportswear', 5, 1, 10);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(99, 'Giftwrap', 5, 1, 98);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(1, 'Bargain', 5, 0, 37);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(26, 'Linens', 7, 3, 157);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(63, 'Women''s', 7, 3, 32);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(49, 'Toys', 8, 2, 35);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(70, 'Women''s', 5, 1, 10);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(73, 'Children''s', 5, 1, 10);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(34, 'Stationary', 5, 1, 33);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(47, 'Junior Miss', 7, 2, 129);
INSERT INTO dept (number, name, store, floor, manager)
	VALUES
	(28, 'Women''s', 8, 2, 32);
    
    
    
INSERT INTO supplier (number, name, city)
	VALUES
	(199, 'Koret', 'Los Angeles');
INSERT INTO supplier (number, name, city)
	VALUES
	(213,'Cannon', 'Atlanta');
INSERT INTO supplier (number, name, city)
	VALUES
	(33, 'Levi-Strauss', 'San Francisco');
INSERT INTO supplier (number, name, city)
	VALUES
	(89, 'Fisher-Price', 'Boston');
INSERT INTO supplier (number, name, city)
	VALUES
	(125, 'Playskool', 'Dallas');
INSERT INTO supplier (number, name, city)
	VALUES
	(42, 'Whitman''s', 'Denver');
INSERT INTO supplier (number, name, city)
	VALUES
	(15, 'White Stag', 'White Plains');
INSERT INTO supplier (number, name, city)
	VALUES
	(475, 'DEC', 'Amherst');
INSERT INTO supplier (number, name, city)
	VALUES
	(122, 'White Paper', 'Seattle');
INSERT INTO supplier (number, name, city)
	VALUES
	(440, 'Spooley', 'Paxton');
INSERT INTO supplier (number, name, city)
	VALUES
	(241, 'IBM', 'New York');
INSERT INTO supplier (number, name, city)
	VALUES
	(62, 'Data General', 'Atlanta');
INSERT INTO supplier (number, name, city)
	VALUES
	(5, 'Amdahl', 'San Diego');
INSERT INTO supplier (number, name, city)
	VALUES
	(20, 'Wormley', 'Hickville');
INSERT INTO supplier (number, name, city)
	VALUES
	(67, 'Edger', 'Salt Lake City');
INSERT INTO supplier (number, name, city)
	VALUES
	(999, 'A E Neumann', 'Madison');


INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(26, 'Earrings', 14, 1000, 20, 199);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(118, 'Towels, Bath', 26, 250, 1000, 213);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(43, 'Maze', 49, 325, 200, 89);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(106, 'Clock Book', 49, 198, 150, 125);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(23, '1 lb Box', 10, 215, 100, 42);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(52, 'Jacket', 60, 3295, 300, 15);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(165, 'Jean', 65, 825, 500, 33);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(258, 'Shirt', 58, 650, 1200, 33);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(120, 'Twin Sheet',26, 800, 750, 213);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(301, 'Boy''s Jean Suit', 43, 1250, 500, 33);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(121, 'Queen Sheet', 26, 1375, 600, 213);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(101, 'Slacks', 63, 1600, 325, 15);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(115, 'Gold Ring', 14, 4995, 10, 199);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(25, '2 lb Box, Mix', 10, 450, 75, 42);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(119, 'Squeeze Ball', 49,  250, 400,  89);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(11, 'Wash Cloth', 1, 75, 575, 213);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(19, 'Bellbottoms', 43, 450, 600, 33);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	( 21, 'ABC Blocks', 1, 198, 405, 125);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(107, 'The ''Feel'' Book', 35, 225, 225, 89);
INSERT INTO item (number, name, dept, price, qoh, supplier)
	VALUES
	(127, 'Ski Jumpsuit', 65, 4350, 125, 15);
    
    
    
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(1, 'central processor', 'pink', 10, 1);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(2, 'memory', 'gray', 20, 32);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(3, 'disk drive', 'black', 685, 2);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(4, 'tape drive', 'black', 450, 4);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(5, 'tapes', 'gray', 1, 250);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(6, 'line printer', 'yellow', 578, 3);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(7, 'l-p paper', 'white', 15,  95);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(8, 'terminals', 'blue', 19, 15);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(13, 'paper tape reader', 'black', 107, 0);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(14, 'paper tape punch', 'black', 147, 0);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(9, 'terminal paper', 'white', 2, 350);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(10, 'byte-soap', 'clear', 0, 143);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(11, 'card reader', 'gray', 327, 0);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(12, 'card punch', 'gray', 427, 0);
INSERT INTO parts (number, name, color, weight, qoh)
	VALUES
	(114, 'card punch', 'white', 350, 0);
    


-- heree
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(475, 1, '1993-12-31', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(475, 2, '1994-03-31', 32);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(475, 3, '1993-12-31', 2);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(475, 4, '1994-03-31', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(122, 7, '1995-02-01', 144);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(122, 7, '1995-02-02', 48);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(122, 9, '1995-02-01', 144);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(440, 6, '1994-10-10', 2);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(241, 4, '1993-12-31', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(62, 3, '1994-06-18', 3);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(475, 2, '1993-12-31', 32);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(475, 1, '1994-07-01', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(5, 4, '1994-11-15', 3);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(5, 4, '1995-01-22', 6);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(20, 5, '1995-01-10', 20);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(20, 5, '1995-01-11', 75);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(241, 1, '1995-06-01', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(241, 2, '1995-06-01', 32);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(241, 3, '1995-06-01', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(67, 4, '1995-07-01', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(999, 10, '1996-01-01', 144);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(241, 8, '1995-07-01', 1);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(241, 9, '1995-07-01', 144);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(89, 3, '1995-07-04', 1000);
INSERT INTO supply (supplier, part, shipdate, quan)
	VALUES
	(89, 4, '1995-07-04', 1000);


INSERT INTO debit (number, sdate, employee, account)
	VALUES
	(100581, '1995-01-15', 157, 10000000);
INSERT INTO debit (number, sdate, employee, account)
	VALUES
	(100582, '1995-01-15', 1110, 14356540);
INSERT INTO debit (number, sdate, employee, account)
	VALUES
	(100586, '1995-01-16', 35, 14096831);
INSERT INTO debit (number, sdate, employee, account)
	VALUES
	(100592, '1995-01-17', 129, 10000000);
INSERT INTO debit (number, sdate, employee, account)
	VALUES
	(100593, '1995-01-18', 13, 11652133);
INSERT INTO debit (number, sdate, employee, account)
	VALUES
	(100594, '1995-01-18', 215, 12591815);


INSERT INTO sale (debit, item, quantity)
	VALUES
	(100581, 118, 5);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100581, 120, 1);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100582, 26, 1);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100586, 127, 3);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100586, 106, 2);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100592, 258, 1);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100593, 23, 2);
INSERT INTO sale (debit, item, quantity)
	VALUES
	(100594, 52, 1);
    
--1
select *
from parts p
where p.qoh=0

--2
select E.name
from employee E
where 10000<=E.salary<=12000

--3
select E.name
from employee E
where E.birthyear > ANY (select E2.birthyear from employee E2)

--4
select D.name,sum(I.qoh)
from dept D , item I
where I.price>800 and I.dept=D.number
group by I.dept,D.name
having 100<(select sum(qoh) from item I2 where I2.dept=I.dept and I2.price>800)

--5
select E.name
from employee E
where SUBSTRING_INDEX(E.name,',',2) LIKE 'J%' and E.number in (select d.employee
                                                                from debit d,sale s,item i
                                                                where s.debit=d.number and s.item=i.number and i.name='Twin Sheet')
--6
select p.name,p.weight
from parts p , supplier s1, supply s2
where s1.name='IBM' and s1.number=s2.supplier and p.number=s2.part

--7
select p.name,p.color
from parts p
where p.weight>all(select p2.weight from parts p2 where p2.name='card punch' and p2.color='gray')

--8
select *
from parts p
where p.weight>=all(select p2.weight from parts p2)

--9
select E2.name , avg(E1.salary) as average
from employee E1 , employee E2
where E1.manager=E2.number
group by E1.manager , E2.name
having 0<(select count(*)
            from employee E3
            where E3.manager=E1.manager and E3.salary>13000)

--10
select s1.name,sum(s2.quan)as sum
from supplier s1,supply s2,parts p
where s1.number=s2.supplier and p.number=s2.part
group by s1.number , s1.name

--11
select s1.number , sum(s2.quan*p.weight)as total_sum
from supplier s1,supply s2,parts p,city c
where s1.number=s2.supplier and p.number=s2.part and s1.city=c.name and c.state='Mass'
group by s1.number , s1.name

--12
select s.name
from supplier s,supply s1,supply s2,parts p1 ,parts p2
where s.number=s1.supplier and s.number=s2.supplier and p1.number=s1.part and p2.number=s2.part  and (p1.name='tape drive' and p2.name='disk drive')

--13
delimiter $$
CREATE TRIGGER after_manager_update
after  UPDATE
ON dept FOR EACH ROW
BEGIN
    IF OLD.manager <> NEW.manager THEN
    
        update employee
        SET employee.salary=employee.salary * (110/100) where employee.number=NEW.manager;
        
    END IF;
    
END;$$

delimiter ;


--14
delimiter $$
CREATE TRIGGER after_sale
before insert
ON sale FOR EACH row
BEGIN
    IF new.quantity>(select i.qoh
                        from item i 
                        where i.number=new.item) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT ='Invalid sale: then qoh of item is less than sale’s quantity';
    END IF;
END;$$
delimiter ;

--15
delimiter $$
CREATE TRIGGER saletwo
after insert
ON sale FOR EACH row
BEGIN
    update item
    SET item.qoh=item.qoh-NEW.quantity where NEW.item=item.number;
END;$$
delimiter ;

--16
CREATE VIEW viewone
AS select s1.number,sum(s2.quan)
    from supplier s1, supply s2,parts p
    where s1.number=s2.supplier and s2.part=p.number and s2.shipdate<'1995-02-01'
    group by s1.number;

select * from viewone

--17
CREATE VIEW viewtwo
AS select c.name,count(*)
    from dept d, store s, city c
    where d.store=s.number and s.city=c.name
    group by c.name;

select * from viewtwo

--18
CREATE VIEW viewthree
AS select d.sdate,count(*)
    from debit d
    group by d.sdate;

select * from viewthree
