

-- added column for the award year 
alter table award
add award_year INTEGER not null;

--tried to change some of the award types so they accept null
alter column award_id type INTEGER;

alter table actor
alter column award_id type INTEGER;

alter table movie
alter column award_id type INTEGER;


insert into award(
	award_id,
	award_name,
	award_organization,
	award_category,
	award_year
)values(
	1,
	'Oscar for Best Picture',
	'Academy of Motion Picture Arts and Sciences',
	'Best Picture',
	2001
);

-- solution is to drop award_id column and add again then link it with a foreign key 
ALTER TABLE actor  
DROP award_id;

alter table director
drop award_id;

alter table director
add award_id integer unique;

--add the special forgeing key to tables 
alter table director
add constraint fk_award_id foreign key (award_id) references award(award_id);


alter table actor
add award_id integer unique;

ALTER TABLE actor 
ADD CONSTRAINT fk_award_id FOREIGN KEY (award_id) REFERENCES award (award_id);

select * from actor;


alter table movie 
drop award_id;

alter table movie 
add award_id integer unique;

ALTER TABLE movie 
ADD CONSTRAINT fk_award_id FOREIGN KEY (award_id) REFERENCES award (award_id);


insert into actor(
	actor_id,
	first_name,
	last_name,
	age_,
	award_id
)values(
	1,
	'Vin',
	'Diseal',
	56,
	1
);


insert into director(
	director_id,
	first_name,
	last_name,
	award_id
)values(
	1,
	'Steven',
	'Spielberg',
	null
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	email,
	phone_num,
	billing_info
)values(
	
	1,'Brad','Thomas', '555 W Main St', 'emailaddy@gmail.com', '555-555-5555', '4353-3534-3453-3454'
	--(2,'Brody','Johnson', '665 W Main St', 'emailaddy2@gmail.com', '555-444-5555', '1234-6442-3456-6456')
);

alter table supplier
rename column contanct_number to contact_number; 

insert into supplier(
	supplier_id,
	company_name,
	address,
	contact_number
)values(
	1,
	'Sugar Syrup Inc.',
	'444 W Bellview St',
	'544-543-5667'
);


--adding extra actors to each movie. Want to track main actors in each movie
alter table movie 
add actor_id_2 integer default null;

ALTER TABLE movie 
ADD CONSTRAINT fk_actor_id_2 FOREIGN KEY (actor_id_2) REFERENCES actor(actor_id);

alter table movie 
add actor_id_3 integer default null;

ALTER TABLE movie 
ADD CONSTRAINT fk_actor_id_3 FOREIGN KEY (actor_id_3) REFERENCES actor(actor_id);


-- testing that input is set as null if actor2 and actor3 not there
insert into movie(
	movie_id,
	title,
	release_date,
	genere_name,
	actor_id,
	director_id,
	award_id
)values(
	2,
	'The Attack of the Clones',
	'09-22-2001',
	'Sci-fi',
	1,
	1,
	null
);
	
select * from movie;

--messed with actor to change a value
update actor
set award_id = null 
where actor_id = 2;

update movie 
set actor_id_2 = 2 
where movie_id = 2;


select * from ticket t ;


-- had to add a column to the ticket place 
ALTER TABLE ticket 
add theatre_id integer;

update ticket 
set theatre_id = 1
where ticket_id = 1;

--wanted to set the dafualt to not null but it was already null so had to change it before
alter table ticket alter column theatre_id set not null;

--adding FK to the ticket value 
ALTER TABLE ticket 
ADD constraint theatre_id FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id);


--removing a few FK from theatre place
ALTER TABLE theatre 
drop movie_id;

alter table theatre  
drop customer_id;

insert into theatre(
	theatre_id,
	address
)values(
	1,
	'5443 W Michigan ave'
);
	


insert into ticket(
	ticket_id,
	show_date,
	price,
	customer_id,
	movie_id,
	theatre_id
)values(
	2,
	'04-30-2023',
	0.99,
	1,
	1,
	1
);

insert into item(
	item_id,
	item_price,
	item_name,
	wholesale_price,
	supplier_id
)values(
	1,
	4.99,
	'Takis',
	1.99,
	1
);


insert into concessions_order(
	order_id,
	total,
	customer_id,
	item_id
)values(1, 6.99, 1, 1);



select * from ticket;
