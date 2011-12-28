INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Queen of Pain', 'Queen_of_Pain.png', 'default_queenofpain.txt', 'npc_dota_hero_queenofpain');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Broodmother', 'Broodmother.png', 'default_broodmother.txt', 'npc_dota_hero_broodmother');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Chen', 'Chen.png', 'default_chen.txt', 'npc_dota_hero_chen');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Faceless Void', 'Faceless_Void.png', 'default_faceless_void.txt', 'npc_dota_hero_faceless_void');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Warlock', 'Warlock.png', 'default_warlock.txt', 'npc_dota_hero_warlock');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Gondar', 'Gondar.png', 'default_gondar.txt', 'npc_dota_hero_gondar');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Huskar', 'Huskar.png', 'default_huskar.txt', 'npc_dota_hero_huskar');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Jakiro', 'Jakiro.png', 'default_jakiro.txt', 'npc_dota_hero_jakiro');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Batrider', 'Batrider.png', 'default_batrider.txt', 'npc_dota_hero_batrider');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Dragon Knight', 'Dragon Knight.png', 'default_dragon_knight.txt', 'npc_dota_hero_dargon_knight');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Death Prophet', 'Death_Prophet.png', 'default_death_prophet.txt', 'npc_dota_hero_death_prophet');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Kunkka', 'Kunkka.png', 'default_kunkka.txt', 'npc_dota_hero_kunkka');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Lifestealer', 'Lifestealer.png', 'default_lifestealer.txt', 'npc_dota_hero_lifestealer');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Skeleton King', 'Skeleton_King.png', 'default_skeleton_king.txt', 'npc_dota_hero_skeleton_king');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Alchemist', 'Alchemist.png', 'default_alchemist.txt', 'npc_dota_hero_alchemist');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Riki', 'Riki.png', 'default_riki.txt', 'npc_dota_hero_riki');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Bloodseeker', 'Bloodseeker.png', 'default_bloodseeker.txt', 'npc_dota_hero_bloodseeker');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Nature\'s Prophet', 'Nature\'s_Prophet.png', 'default_furion.txt', 'npc_dota_hero_furion');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Ursa', 'Ursa.png', 'default_ursa.txt', 'npc_dota_hero_ursa');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Viper', 'Viper.png', 'default_viper.txt', 'npc_dota_hero_viper');
INSERT INTO heroes(id, name, image_name, default_filename, resource_name) VALUES (nextval('heroes_id_seq'::regclass), 'Juggernaut', 'Juggernaut.png', 'default_juggernaut.txt', 'npc_dota_hero_juggernaut');

UPDATE heroes SET name = 'Clockwerk' WHERE name = 'Rattletrap';
UPDATE heroes SET name = 'Shadow Fiend' WHERE name = 'Nevermore';

UPDATE items SET resource_name = 'item_gauntlets' WHERE resource_name='item_guantlets';