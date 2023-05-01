


create table award(
	award_id SERIAL primary key,
	award_name VARCHAR(100),
	award_organization VARCHAR(100),
	award_category VARCHAR(100)
);


create table actor(
	actor_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	age_ INTEGER,
	award_id INTEGER not null,
);
	
create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	email VARCHAR(150),
	phone_num VARCHAR(15),
	billing_info VARCHAR(150)
);

create table supplier(
	supplier_id SERIAL primary key,
	company_name VARCHAR(100),
	address VARCHAR(150),
	contanct_number VARCHAR(15)
);



create table director(
	director_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	award_id INTEGER not null,
	foreign key (award_id) references award(award_id)
);
 


create table movie(
	movie_id SERIAL primary key,
	title VARCHAR(150),
	release_date DATE,
	genere_name VARCHAR(100),
	actor_id INTEGER not null,
	director_id INTEGER not null,
	award_id INTEGER not null,
	foreign key (actor_id) references actor(actor_id),
	foreign key (director_id) references director(director_id),
	foreign key (award_id) references award(award_id)
);

create table ticket(
	ticket_id SERIAL primary key,
	show_date DATE,
	price numeric(2,2),
	customer_id INTEGER not null,
	movie_id INTEGER not null,
	foreign key (customer_id) references customer(customer_id),
	foreign key (movie_id) references movie(movie_id)
);

create table theatre(
	theatre_id SERIAL primary key,
	address VARCHAR(150),
	movie_id INTEGER not null,
	customer_id INTEGER not null,
	foreign key (customer_id) references customer(customer_id),
	foreign key (movie_id) references movie(movie_id)
);


create table item(
	item_id SERIAL primary key,
	item_price NUMERIC(3, 2),
	item_name VARCHAR(100),
	wholesale_price NUMERIC(3,2),
	supplier_id INTEGER not null,
	foreign key (supplier_id) references supplier(supplier_id)
);

create table concessions_order(
	order_id SERIAL primary key,
	total NUMERIC(4,2),
	customer_id INTEGER not null,
	item_id INTEGER not null,
	foreign key (customer_id) references customer(customer_id),
	foreign key (item_id) references item(item_id)
);




