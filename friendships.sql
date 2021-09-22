SELECT * FROM users 
LEFT JOIN friendships ON friendships.user_id = users.id 
LEFT JOIN users as user2 ON user2.id = friendships.friend_id;

/* 1.- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados. */
SELECT users.first_name AS first_name, users.last_name AS last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id
WHERE user2.first_name = 'Kermit';

/* 2.- Devuelve el recuento de todas las amistades. */
SELECT count(*) AS total_amistades FROM (
SELECT users.first_name AS first_name, users.last_name AS last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS user2 ON friendships.friend_id = user2.id
) AS total;

/* 3.- Descubre quién tiene más amigos y devuelve el recuento de sus amigos. */
SELECT CONCAT(users.first_name, ' ' , users.last_name) AS nombre, count(*) AS total_amigos FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id
GROUP BY nombre
ORDER BY count(*) DESC;