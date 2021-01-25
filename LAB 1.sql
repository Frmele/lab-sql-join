/*
List number of films per category.
Display the first and last names, as well as the address, of each staff member.
Display the total amount rung up by each staff member in August of 2005.
List each film and the number of actors who are listed for that film.
Using the tables payment and customer and the JOIN command, list the total paid by each customer.
 List the customers alphabetically by last name.
 */
 SELECT category_id, count(film_id) from sakila.film_category
 group by category_id
 order by count(film_id) desc;
 
 #Display the first and last names, as well as the address, of each staff member.
select a.staff_id,a.first_name, a.last_name,a.address_id,b.address, c.city from sakila.staff as a
join sakila.address as b
on a.address_id=b.address_id
join sakila.city as c
on b.city_id=c.city_id;

#Display the total amount rung up by each staff member in August of 2005.
select a.staff_id,a.first_name, a.last_name, sum(d.amount), d.payment_date from sakila.staff as a
join sakila.payment as d
on a.staff_id=d.staff_id
where d.payment_date like '2005-08%'
group by a.staff_id;

#List each film (film_id)- film_actor(film_id,actor_id) and the number of 
# actors (actor and actor_id,first_name and last) who are 
# listed for that film.

select f.title, f.film_id, count(g.actor_id) as total_actors from sakila.film as f
left join sakila.film_actor as g
on f.film_id=g.film_id
left join sakila.actor as h
on g.actor_id=h.actor_id
group by f.title
order by count(g.actor_id) desc;
 
 #Using the tables payment and customer and the JOIN command, list the total paid by each customer.
select m.customer_id, m.first_name, m.last_name, sum(l.amount) as total_paid from sakila.payment as l
left join sakila.customer as m
on l.customer_id=m.customer_id
group by l.customer_id
order by m.last_name asc;

 
 