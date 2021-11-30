CREATE TABLE payments (
    customer_name VARCHAR(128),
    processed_at date,
    amount int
);

CREATE TABLE balances(
    username VARCHAR(128),
    balances int
)

CREATE TABLE large_table(
    random_int  int
)

INSERT INTO payments VALUES('Aman', '2019-12-15', 10);
INSERT INTO payments VALUES('Linkan', '2020-01-01', 100);
INSERT INTO payments VALUES('Montu', '2020-01-02', 10);
INSERT INTO payments VALUES('Ruby', '2020-01-02', 100);
INSERT INTO payments VALUES('Manpreet', '2020-01-03', 100);
INSERT INTO payments VALUES('Karmjeet', '2020-02-05', 1000);
INSERT INTO payments VALUES('Dimpal', '2020-02-02', 100);
INSERT INTO payments VALUES('Navneet', '2020-02-03', 10);
INSERT INTO payments VALUES('Jaspal', '2020-01-12', 80);
INSERT INTO payments VALUES('Sohit', '2020-02-13', 70);
INSERT INTO payments VALUES('Omkar', '2019-12-11', 90);
INSERT INTO payments VALUES('Waheguru', '2020-02-01', 10);
INSERT INTO payments VALUES('Gobid', '2020-12-15', 10);
INSERT INTO payments VALUES('Ram', '2020-02-18', 10);
INSERT INTO payments VALUES('Krishan', '2019-01-25', 10);
INSERT INTO payments VALUES('Hari', '2020-02-02', 10);

INSERT INTO balances VALUES('Aman', 0);
INSERT INTO balances VALUES('Linkan', 1000);

INSERT INTO large_table (random_int);
SELECT round(random() * 1000000000)
FROM generate_series(1, 50000000) s(i);