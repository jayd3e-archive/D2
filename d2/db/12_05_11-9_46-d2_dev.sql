--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: jayd3e; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    body character varying(300),
    created timestamp without time zone,
    edited timestamp without time zone,
    user_id integer
);


ALTER TABLE public.comments OWNER TO jayd3e;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: jayd3e
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO jayd3e;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jayd3e
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jayd3e
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Name: guides; Type: TABLE; Schema: public; Owner: jayd3e; Tablespace: 
--

CREATE TABLE guides (
    id integer NOT NULL,
    name character varying(100),
    created timestamp without time zone,
    edited timestamp without time zone,
    hero_id integer,
    user_id integer
);


ALTER TABLE public.guides OWNER TO jayd3e;

--
-- Name: guides_id_seq; Type: SEQUENCE; Schema: public; Owner: jayd3e
--

CREATE SEQUENCE guides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guides_id_seq OWNER TO jayd3e;

--
-- Name: guides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jayd3e
--

ALTER SEQUENCE guides_id_seq OWNED BY guides.id;


--
-- Name: guides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jayd3e
--

SELECT pg_catalog.setval('guides_id_seq', 1, false);


--
-- Name: guides_items; Type: TABLE; Schema: public; Owner: jayd3e; Tablespace: 
--

CREATE TABLE guides_items (
    id integer NOT NULL,
    guide_id integer,
    item_id integer,
    section character varying(50)
);


ALTER TABLE public.guides_items OWNER TO jayd3e;

--
-- Name: guides_items_id_seq; Type: SEQUENCE; Schema: public; Owner: jayd3e
--

CREATE SEQUENCE guides_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guides_items_id_seq OWNER TO jayd3e;

--
-- Name: guides_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jayd3e
--

ALTER SEQUENCE guides_items_id_seq OWNED BY guides_items.id;


--
-- Name: guides_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jayd3e
--

SELECT pg_catalog.setval('guides_items_id_seq', 1, false);


--
-- Name: heroes; Type: TABLE; Schema: public; Owner: jayd3e; Tablespace: 
--

CREATE TABLE heroes (
    id integer NOT NULL,
    name character varying(100),
    description character varying(400),
    image_name character varying(100)
);


ALTER TABLE public.heroes OWNER TO jayd3e;

--
-- Name: heroes_id_seq; Type: SEQUENCE; Schema: public; Owner: jayd3e
--

CREATE SEQUENCE heroes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.heroes_id_seq OWNER TO jayd3e;

--
-- Name: heroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jayd3e
--

ALTER SEQUENCE heroes_id_seq OWNED BY heroes.id;


--
-- Name: heroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jayd3e
--

SELECT pg_catalog.setval('heroes_id_seq', 1, false);


--
-- Name: items; Type: TABLE; Schema: public; Owner: jayd3e; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    name character varying(100),
    cost integer,
    description character varying(1000),
    image_name character varying(100),
    category character varying(100)
);


ALTER TABLE public.items OWNER TO jayd3e;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: jayd3e
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO jayd3e;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jayd3e
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jayd3e
--

SELECT pg_catalog.setval('items_id_seq', 112, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: jayd3e; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(50)
);


ALTER TABLE public.users OWNER TO jayd3e;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jayd3e
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jayd3e;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jayd3e
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jayd3e
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jayd3e
--

ALTER TABLE comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jayd3e
--

ALTER TABLE guides ALTER COLUMN id SET DEFAULT nextval('guides_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jayd3e
--

ALTER TABLE guides_items ALTER COLUMN id SET DEFAULT nextval('guides_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jayd3e
--

ALTER TABLE heroes ALTER COLUMN id SET DEFAULT nextval('heroes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jayd3e
--

ALTER TABLE items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jayd3e
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: jayd3e
--

COPY comments (id, body, created, edited, user_id) FROM stdin;
\.


--
-- Data for Name: guides; Type: TABLE DATA; Schema: public; Owner: jayd3e
--

COPY guides (id, name, created, edited, hero_id, user_id) FROM stdin;
\.


--
-- Data for Name: guides_items; Type: TABLE DATA; Schema: public; Owner: jayd3e
--

COPY guides_items (id, guide_id, item_id, section) FROM stdin;
\.


--
-- Data for Name: heroes; Type: TABLE DATA; Schema: public; Owner: jayd3e
--

COPY heroes (id, name, description, image_name) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: jayd3e
--

COPY items (id, name, cost, description, image_name, category) FROM stdin;
12    Iron Branch    53    +1 All Attributes\r\n\r\nA seemingly ordinary branch, its ironlike qualities are bestowed upon the bearer.    branches_lg.png    attributes
14    Slippers of Agility    150    +3 Agility\r\n\r\nLight boots made from spider skin that tingles your senses.    slippers_lg.png    attributes
15    Mantle of Intelligence    150    +3 Intelligence\r\n\r\nA beautiful sapphire mantle worn by generations of queens.    mantle_lg.png    attributes
16    Circlet    185    +2 All Attributes\r\n\r\nAn elegant circlet designed for human princesses.    circlet_lg.png    attributes
17    Belt of Strength    450    +6 Strength\r\n\r\nA valued accessory for improving vitality.    belt_of_strength_lg.png    attributes
18    Boots of Elvenskin    450    +6 Agility\r\n\r\nA pair of boots often used for their light weight and ease of movement.    boots_of_elves_lg.png    attributes
19    Robe of the Magi    450    +6 Intelligence\r\n\r\nThis robe corrupts the soul of the user, but provides wisdom in return.    robe_lg.png    attributes
20    Ogre Club    1000    +10 Strength\r\n\r\nYou grow stronger just by holding it.    ogre_axe_lg.png    attributes
21    Blade of Alacrity    1000    +10 Agility\r\n\r\nA long blade imbued with time magic.    blade_of_alacrity_lg.png    attributes
22    Staff of Wizardry    1000    +10 Intelligence\r\n\r\nA staff of magical powers passed down from the eldest mages.    staff_of_wizardry_lg.png    attributes
23    Ultimate Orb    2100    +10 All Attributes\r\n\r\nA mystical orb containing the essence of life.    ultimate_orb_lg.png    attributes
24    Ring of Protection    175    +2 Armor\r\n\r\nA glimmering ring that defends its bearer.    ring_of_protection_lg.png    armaments
26    Stout Shield    250    Passive: Damage Block - Gives a chance to block damage, depending on the type of hero you are.\r\n\r\nMELEE BLOCK: 20\r\nRANGED BLOCK: 10\r\nBLOCK CHANCE: 60%\r\n\r\nOne man's wine barrel bottom is another man's shield.    stout_shield_lg.png    armaments
28    Chainmail    550    +5 Armor\r\n\r\nA medium weave of metal chains.    chainmail_lg.png    armaments
29    Helm of Iron Will    950    +5 Armor\r\n+3 HP Regeneration\r\n\r\nThe helmet of a legendary warrior who fell in battle.    helm_of_iron_will_lg.png    armaments
30    Broadsword    1200    +18 Damage\r\n\r\nThe classic weapon of choice for knights, this blade is sturdy and reliable for slaying enemies.    broadsword_lg.png    armaments
31    Quarterstaff    900    +10 Damage\r\n+10 Attack Speed\r\n\r\nA basic staff that allows you to strike quickly.    quarterstaff_lg.png    armaments
32    Claymore    1400    +21 Damage\r\n\r\nA sword that can cut through armor, it's a commonly chosen fist weapon for budding swordsmen.    claymore_lg.png    armaments
33    Javelin    1500    Passive: Pierce - Grants a chance to deal bonus damage.\r\n\r\n+21 Damage\r\nCHANCE TO PIERCE: 20%\r\nPIERCE DAMAGE: 40\r\n\r\nA rather typical spear that can sometimes pierce through an enemy's armor when used to attack.    javelin_lg.png    armaments
36    Magic Stick    200    Active: Energy Charge - Gains charges (max 10) based on enemies using abilities in a nearby area.  When activated, it restores health and mana based on the number of charges stored.\r\n\r\nRESTORE PER CHARGE: 15\r\nCOOLDOWN: 13    magic_stick_lg.png    arcane
37    Sage's Mask    325    +50% Mana Regeneration\r\n\r\nA mask commonly used by mages and warlocks for various rituals.    sobi_mask_lg.png    arcane
38    Ring of Regen    350    +2 HP Regeneration\r\n\r\nThis ring is considered a good luck charm among the Gnomes.    ring_of_regen_lg.png    arcane
41    Cloak    550    Multiple instances of spell resistance do not stack.\r\n\r\n+15% Spell Resistance\r\n\r\nA cloak made of a magical material that works to dispel any magic cast on it.    cloak_lg.png    arcane
13    Guantlets of Strength    150    +3 Strength\r\n\r\nStudded leather gloves that add brute strength.    gauntlets_lg.png    attributes
25    Quelling Blade    225    Active: Destroy Tree - Destroy a target tree.\r\nPassive: Quell - Gives bonus attack damage against non-hero units, depending on the type of hero you are.\r\n\r\nMELEE BONUS: 32%\r\nRANGED BONUS: 12%\r\nCOOLDOWN: 5\r\n\r\nThe axe of a fallen gnome, it allows you to effectively maneuver the forest.    quelling_blade_lg.png    armaments
27    Blades of Attack    450    +9 Damage\r\n\r\nThese small concealable blades' damage should not be underestimated.    blades_of_attack_lg.png    armaments
39    Boots of Speed    500    Flat movement speed bonuses from multiple pairs of boots do not stack.\r\n\r\n+55 Movement Speed\r\n\r\nFleet footwear, increasing movement.    boots_lg.png    arcane
40    Gloves of Haste    500    +15 Attack Speed\r\n\r\nA pair of magical gloves that seems to render weapons weightless.    gloves_lg.png    arcane
42    Gem of True Sight    700    Passive: True Sight.  Drops on death.\r\n\r\nSTOCK: 1    gem_lg.png    arcane
43    Morbid Mask    900    Passive: Lifesteal - Gives lifesteal on attacks.\r\n\r\nMorbid Mask is an Orb effect, and does not stack with other orb effects.\r\n\r\nLIFESTEAL: 15%\r\n\r\nA mask that drains the energy of those caught in its gaze.    lifesteal_lg.png    arcane
45    Talisman of Evasion    1800    +25% Evasion\r\n\r\nA necklace that allows you to anticipate enemy attacks.    talisman_of_evasion_lg.png    arcane
47    Wraith Band    485    +3 Strength\r\n+6 Agility\r\n+3 Intelligence\r\n+3 Damage\r\n\r\nA circlet with faint whispers echoing about it.    wraith_band_lg.png    common
48    Null Talisman    505    +3 Strength\r\n+3 Agility\r\n+6 Intelligence\r\n+3 Damage\r\n\r\nA small gemstone attached to several chains.    null_talisman_lg.png    common
49    Magic Wand    509    Active: Energy Charge - Gains charges (max 15) based on enemies using abilities in a nearby area.  When activated, it restores health and mana based on the number of charges stored.\r\n\r\n+3 All Attributes\r\nRESTORE PER CHARGE: 15\r\nCOOLDOWN: 13\r\n\r\nA simple wand used to channel magic energies, it is favored by apprentice wizards and great warlocks alike.    magic_wand_lg.png    common
59    Flying Courier    200    Fast flying creature that carries items to and from your base.    flying_courier_lg.png    support
60    Ring of Basilius    500    Passive: Basilius Aura - Grants mana regeneration and armor in a 900 AOE.\r\nActive: Toggle whether the aura affects other non-hero units.\r\n\r\nMultiple instances of Basilius Aura do not stack.\r\n+6 Damage\r\nAURA MANA REGEN: 0.65\r\nAURA BONUS ARMOR: 2\r\n+1 Armor\r\n\r\nRing given as a reward to the greatest mages.    ring_of_basilius_lg.png    support
61    Headdress    603    Passive: Regeneration Aura - Restores HP to allies in a 500 units radius.\r\n\r\nMultiple instances of Regeneration Aura do not stack.\r\n+2 All Attributes\r\nBONUS REGEN: 3\r\n\r\nCreates a soothing aura that restores allies in battle.    headdress_lg.png    support
62    Buckler    803    Active: Armor Bonus - Gives +2 to all nearby allied units.  Lasts 25 seconds on heroes, 30 seconds on units.\r\n\r\n+5 Armor\r\n+2 All Attributes\r\nCOOLDOWN: 25\r\nMANA COST: 10\r\n\r\nA powerful shield that imbues the bearer with the strength of heroes past, it is capable of protecting entire armies in battle.    buckler_lg.png    support
63    Urn of Shadows    875    Gains charges every time an enemy hero dies within 1400 units.  Only the closest Urn to the dying hero will gain a charge.\r\n\r\nActive: Sould Release - Heals HP over time for friendly units, but deals damage over time for enemy units.  The healing effect is lost if the affected unit takes damage from an enemy hero or tower.\r\n+50% Mana Regeneration\r\n+6 Strength\r\nURN HEAL: 400\r\nDURATION: 8\r\nURN DAMAGE: 150\r\nCOOLDOWN: 10\r\n\r\nContains the ashes of powerful demons.    urn_of_shadows_lg.png    support
64    Medallion of Courage    1075    Active: Valor - Reduces the armor of you and your target by -6. Lasts 7 seconds.\r\n\r\n+6 Armor\r\n+50% Mana Regeneration\r\nCOOLDOWN: 7\r\n\r\nThe bearer has no fear of combat.    medallion_of_courage_lg.png    support
65    Arcane Boots    1500    Active: Replenish Mana - Restores mana in an area around the hero.\r\n\r\nFlat movement sped bonuses from multiple pairs of boots do not stack.\r\n+65 Movement Speed\r\n+300 Mana\r\nMANA RESTORED: 135\r\nCOOLDOWN: 45\r\nMANA COST: 25\r\n\r\nMagi equipped with these boots are valued in battle.    arcane_boots_lg.png    support
67    Vladmir's Offering    2050    Passive: Valdmir's Aura - Grants a variety of bonuses to nearby allies.  Lifesteal bonuses from Vladmir's Aura only affect melee units.\r\n\r\nMultiple instances of Vladmir's Aura do not stack.\r\nAURA LIFESTEAL: 16%\r\nAURA BONUS DAMAGE: 15%\r\nAURA BONUS ARMOR: 5\r\nAURA MANA REGEN: 0.8\r\n+2 HP Regeneration\r\n\r\nAn eerie mask that is haunted with the malice of a fallen vampire.    vladmir_lg.png    support
66    Drum of Endurance    1725    Active: Endurance - Gives bonus +10 attack and +10% movement speed to surrounding allies.\r\nPassive: Swiftness Aura - Gives bonus attack and movement speed to surrounding allies.\r\n\r\nMultiple instances of Swiftness Aura do not stack.\r\n+9 All Attributes\r\n+9 Damage\r\nAURA ATTACK SPEED: 5\r\nAURA MOVE SPEED: 5%\r\nCOOLDOWN: 30\r\n\r\nA relic that enchants the bodies of those around it for swifter movement in times of crisis.    ancient_janggo_lg.png    support
70    Force Staff    2200    Active: Force - Pushes any target unit 600 units in the direction it is facing.  Double click to self-cast.\r\n\r\n+10 Intelligence\r\n+10 Damage\r\n+10 Attack Speed\r\nCOOLDOWN: 20\r\nMANA COST: 25\r\n\r\nAllows you to manipulate others, for good or evil.    force_staff_lg.png    caster
74    Veil of Discord    3100    Active: Magic Weakness - Emits a weakening blast of radius 500 that increases the magic damage enemies take by 25% for 15.0 seconds.\r\n\r\n+5 Armor\r\n+12 Intelligence\r\n+5 HP Regeneration\r\nCOOLDOWN: 30\r\nMANA COST: 75\r\n\r\nThe headwear of corrupt magi.    veil_of_discord_lg.png    caster
80    Armlet    2600    Active: Unholy Strength - Gives +31 damage, +10 attack speed, and +25 strength while active, but drains37 HP per second.  You cannot die from the health loss when the bonus strength is gone, or the health drain per second.\r\n\r\n+9 Damage\r\n+15 Attack Speed\r\n+5 Armor\r\n+5 HP Regeneration\r\nCOOLDOWN: 5\r\n\r\nWeapon of choice among brutes, the bearer sacrifices his life energy to gain immense strength and power.    armlet_lg.png    weapons
84    Ethereal Blade    4900    Active: Ether Blast - Converts you and your target into ethereal form.  Target unit is slowed and cannot attack or be attacked, and takes 2.0x of your agility + 75 as damage.\r\n\r\n+40 Agility\r\n+10 Strength\r\n+10 Intelligence\r\nDURATION: 3\r\nCOOLDOWN: 30\r\nMANA COST: 50\r\n\r\nA flickering blade of a ghastly nature, it is capable of dealing damage in both magical and physical planes.    ethereal_blade_lg.png    weapons
90    Butterfly    6000    +30 Agility\r\n+30 Damage\r\n+30% Evasion\r\n+30 Attack Speed\r\n\r\nOnly the mightiest and most experienced of warriors can wield the Butterfly, but it provides incredible dexterity in combat.    butterfly_lg.png    weapons
79    Crystalys    2150    Passive: Critical Strike - Grants a chance to deal critical damage on an attack.\r\n\r\n+35 Damage\r\nCRITICAL DAMAGE: 20%\r\nCRITICAL DAMAGE: 175%\r\n\r\nA blade forged from rare-crystals, it seeks weak points in enemy armor.    lesser_crit_lg.png    weapons
81    Skull Basher    2950    Passive: Bash - Gives a chance to stun for 1.4 seconds.\r\n\r\n+40 Damage\r\n+6 Strength\r\nMELEE CHANCE: 25%\r\nRANGED CHANCE: 10%\r\nCOOLDOWN: 2\r\n\r\nA feared weapon in the right hands, this mauls ability to shatter the defenses of its opponents should not be underestimated.    basher_lg.png    weapons
82    Shadow Blade    3300    Active: Shadow Walk - Makes you invisible until the duration ends, or until you attack or cast a spell.  While Shadow Wal is active, you move 20% faster and can move through units.  If attacking to break the invisibility, you gain 150 bonus damage on that attack.  Lasts 9 seconds.\r\n\r\n+38 Damage\r\n+10 Attack Speed\r\nCOOLDOWN: 18\r\nMANA COST: 75\r\n\r\nThe blade of a fallen king, it allows you to move unseen and strike from the shadows.    invis_sword_lg.png    weapons
83    Battle Fury    4350    Passive: Cleave - Deals a percent of attack damage in a 225 AOE around the target.  Does not work on ranged heroes.\r\n\r\n+65 Damage\r\n+6 HP Regeneration\r\n+150% Mana Regeneration\r\nCLEAVE DAMAGE: 35%\r\n\r\nThe bearer of this mighty axe gains the ability to cut down swaths of enemies at once.    bfury_lg.png    weapons
85    Manta Style    4900    Active:  Mirror Image - Creates 2 Mirror Images of your hero and that deal 33% damage and take 250% damage.  Lasts 20 seconds.\r\n\r\nPercentage based movement speed bonuses from multiple items do not stack.\r\n+10 Strength\r\n+26 Agility\r\n+10 Intelligence\r\n+15 Attack Speed\r\n+10% Movement Speed\r\nCOOLDOWN: 50\r\nMANA COST: 165\r\n\r\nAn axe made of reflective materials that causes confusion amongst enemy ranks.    manta_lg.png    weapons
102    Helm of the Dominator    1850    ORB\r\nActive: Dominate - Take control of a non-hero, non-ancient target unit.\r\nPassive: Lifesteal - Gives lifesteal on attacks.\r\n\r\nHealm of the Dominator is an Orb effect, and does not stack with other orb effects.\r\n+20 Damage\r\n+5 Armor\r\nLifesteal: 15%\r\nCOOLDOWN: 300\r\nMANA COST: 75\r\n\r\nThe powerful headpieces of a dead necromancer.    helm_of_the_dominator_lg.png    artifacts
103    Mask of Madness    1900    Active: Berserk - Gives 100 attack speed and 20% movement speed but causes you to take extra 30% damage.  Lasts 12 seconds.\r\nPassive: Lifesteal - Grants lifesteal on attacks.\r\n\r\nMask of Madness is an Orb effect, and does not stack with other Orb effects.\r\nLIFESTEAL: 17%\r\nCOOLDOWN: 25\r\nMANA COST: 25\r\n\r\nOnce this mask is worn, it's bearer becomes an uncontrollable aggressive force.    mask_of_madness_lg.png    artifacts
104    Sange    2150    Passive: Lesser Maim - Gives a chance on attack to slow movement speed for 4.0 seconds.\r\n\r\n+10 Damage\r\n+16 Strength\r\nMAIM CHANCE: 15%\r\nSLOW: 20%\r\n\r\nSange is an unusually accurate weapon, seeking weak points automatically.    sange_lg.png    artifacts
105    Yasha    2150    Percentage based movement speed bonuses from multiple items do not stack.\r\n\r\n+16 Agility\r\n+15 Attack Speed\r\n+10% Movement Speed\r\n\r\nYasha is regarded as a the swiftest weapon ever created.    yasha_lg.png    artifacts
106    Maelstrom    2700    Passive: Chain Lightning - Grants a chance on attack release a Chain Lightning that hits 4 targets, dealing damage.\r\n\r\nMaelstrom is an Orb effect, and does not stack with other Orb effects.\r\n+24 Damage\r\n+25 Attack Speed\r\nCHANCE TO CHAIN: 25%\r\nCHAIN DAMAGE: 120\r\n\r\nA hammer forged for the gods themselves, Maelstrom allows its user to harness the power of lightning.    maelstrom_lg.png    artifacts
107    Diffusal Blade    3300    Active: Purge - Purges a target unit, removing buffs, slowing, and dealing damage if it is a summoned unit.\r\nPassive: Feedback - Your attacks burn 20/36 mana and deal the same amount in damage.  Upgradable.\r\n\r\nDiffusal Blade is an Orb effect, and does not stack with other Orb effects.\r\n+22/26 Agility\r\n+6/10 Intelligence\r\nCOOLDOWN: 12\r\n\r\nAn enchanted blade that allows the user to cut straight into the enemy's soul.    diffusal_blade_lg.png    artifacts
108    Desolator    4400    Passive: Corruption - Your attacks reduce target's armor.\r\n\r\nDesolator is an Orb effect, and does not stack with other Orb effects.\r\n+60 Damage\r\nARMOR REDUCTION: 6\r\n\r\nA wicked weapon, used in torturing political criminals.    desolator_lg.png    artifacts
109    Sange and Yasha    4300    Passive: Greater Maim - Gives a chance on attack to slow movement speed for 4.0 seconds.\r\n\r\nPercentage based movement speed bonuses from multiple items do not stack.\r\n+12 Damage\r\n+16 Strength\r\n+16 Agility\r\n+15 Attack speed\r\n+12% Movement Speed\r\nMAIM CHANCE: 15%\r\nSLOW: 30%\r\n\r\nSange and Yasha, when attuned by the moonlight and used together, become a very powerful combination.    sange_and_yasha_lg.png    artifacts
110    Mjollnir    5400    Active: Static Charge - Places a charged shield on a target unit.\r\nPassive: Chain Lightning - Grants a chance to release Chain Lightning on attack, dealing damage to multiple targets.\r\n\r\nMjollnir is an Orb effect, and does not stack with other Orb effects.\r\n+24 Damage\r\n+80 Attack Speed\r\nCHANCE TO CHAIN: 25%\r\nCHANCE TO DAMAGE: 160\r\nCOOLDOWN: 35\r\nMANA COST: 50\r\n\r\nThor's magical hammer, made for him by the dwarves Brok and Eitri.    mjollnir_lg.png    artifacts
4    Healing Salve    100    Use: Regenerate - Restores HP over time.  If the user is attacked, the effect is lost.\r\n\r\nDURATION: 10\r\nHEALTH RESTORED: 400\r\n\r\nA magical salve that can quickly mend even the deepest of wounds.    flask_lg.png    consumables
5    Smoke of Deceit    100    Use: Upon activation, the user and all nearby allied player-controlled units gain invisibility and bonus movement speed for a brieftime.  Upon moving with 950 range of an enemy hero or tower, the invisibility is lost.\r\n\r\nBONUS SPEED: 15%\r\nDURATION: 40\r\nCOOLDOWN: 90    smoke_of_deceit_lg.png    consumables
7    Dust of Appearance    180    Use: Reveal - Reveals invisible Heroes in a nearby area.\r\n\r\nDURATION: 12\r\nRADIUS: 1050\r\nCOOLDOWN: 60\r\nMANA COST: 5    dust_lg.png    consumables
8    Animal Courier    170    Creature that carries items to and from your base.\r\n\r\nLosing the donkey is punishable by death.    courier_lg.png    consumables
9    Observer Ward    200    Use: Places an Observer Ward to give sight of the surrounding area.\r\n\r\nDURATION: 6 minutes    ward_observer_lg.png    consumables
10    Sentry Ward    200    Use: Places a Sentry Ward to give True Sight of the surrounding area.\r\n\r\nDURATION: 3 minutes    ward_sentry_lg.png    consumables
11    Bottle    600    Use: Regenerate - Restores HP and Mana over time.  Effect is lost if unit is attacked.  Empty Bottle refills near town fountain.  You can also store runes in the bottle, to save for later use.  After 2 minutes, stored Runes will be activated.\r\n\r\nHEALTH RESTORED: 135\r\nMANA RESTORED: 70\r\nDURATION: 3\r\n\r\nAn old bottle that survived the ages, the contents places inside become enchanted.    bottle_lg.png    consumables
34    Platemail    1400    +10 Armor\r\n\r\nThick metal plates that protect the entire upper body.  Avoid dropping on feet.    platemail_lg.png    armaments
35    Mithril Hammer    1600    +24 Damage\r\n\r\nA hammer forged of pure mithril.    mithril_hammer_lg.png    armaments
50    Bracer    525    +6 Strength\r\n+3 Agility\r\n+3 Intelligence\r\n+3 Damage\r\n\r\nThe bracer is a common choice to toughen up defenses and increase longevity.    bracer_lg.png    common
51    Poor Man's Shield    550    Passive: Damage Block - Blocks physical attack damage, depending on the type of hero you are.  Poor Man's Shield will always block attacks from enemy Heroes, but has a chance to block damage from creeps.\r\n\r\nMELEE BLOCK: 20\r\nRANGED BLOCK: 10\r\nBLOCK CHANCE: 60%\r\n+6 Agility\r\n\r\nA busted old shield that seems to block more than it should.    poor_mans_shield_lg.png    common
52    Soul Ring    800    Active: Sacrifice - Consume 150 HP to temporarily gain 150 Mana.\r\n\r\n+3 HP Regeneration\r\n+50% Mana Regeneration\r\nCOOLDOWN: 25    soul_ring_lg.png    common
53    Phase Boots    1400    Active:  Phase - Gives increased movement speed and lets you move through units.\r\n\r\nFlat movement speed bonuses from multiple pairs of boots do not atack.\r\nPHASE DURATION: 4\r\nPHASE MOVE BOOST: 16%\r\n+60 Movement Speed\r\n+24 Damage\r\nCOOLDOWN: 8\r\n\r\nBoots that allow the wearer to travel between the ether.    phase_boots_lg.png    common
54    Power Treads    1450    Active:  Switch Attribute - Changes selected attribute between Strength, Agility, and Intelligence.\r\n\r\nFlat movement speed bonuses from multiple pairs of boots do not stack.\r\n+65 Movement Speed\r\n+8 Selected Attribute\r\n+25 Attack Speed\r\n\r\nA pair of tough-skinned boots that change to meet the demands of the wearer.    power_treads_lg.png    common
55    Oblivion Staff    1675    +6 Intelligence\r\n+10 Attack Speed\r\n+15 Damage\r\n+75% Mana Regeneration\r\n\r\nDeceptively hidden as an ordinary quarterstaff, it is actually very powerful, much like the Eldritch who originally possessed it.    oblivion_staff_lg.png    common
44    Ghost Scepter    1600    Active: Ghost Form - Enter ghost form, unable to attack or be attacked, but take 40% extra damage from spells.\r\n\r\n+7 All Attributes\r\nGHOST DURATION: 4\r\nCOOLDOWN: 30\r\n\r\nImbues the wielder with a ghostly presence, allowing them to evade physical damage.    ghost_lg.png    arcane
46    Blink Dagger    2150    Active: Blink - Teleport to a target point up to 1200 units away.  If damage is taken from an enemy hero, Blink Dagger cannot be used for 3 seconds.\r\n\r\nCOOLDOWN: 14\r\nMANA COST: 75\r\n\r\nThe fabled dagger used by the fastest assassin ever to walk the ands.    blink_lg.png    arcane
2    Clarity    50    Use: Restores mana over time.  If the user is attacked, the effect is lost.\r\n\r\nDURATION: 30\r\nMANA RESTORED: 100\r\n\r\nClear water that enhances the ability to meditate.    clarity_lg.png    consumables
6    Town Portal Scroll    135    Use: Teleport - Teleports you to a target friendly building.\r\n\r\nCOOLDOWN: 65\r\nMANA COST: 75    tpscroll_lg.png    consumables
3    Tango    90    Use: Eat Tree - Consome a tree to restore HP over time. Comes with 3 charges.\r\n\r\nDURATION: 16\r\nHEALTH RESTORED: 115\r\n\r\nForage to survive on the battlefield.    tango_lg.png    consumables
56    Perseverance    1750    +10 Damage\r\n+5 HP Regeneration\r\n+125% Mana Regeneration\r\n\r\nA gem that grants hear to the bearer.    pers_lg.png    common
57    Hand of Midas    1900    Active: Transmute - Kills a non-hero target for bonus gold and experience.\r\n\r\n+30 Attack Speed\r\nCOOLDOWN: 100\r\n\r\nPreserved through unknown magical means, the hand of midas is a weapon of greed, sacrificing animals to line the owner's pockets.    hand_of_midas_lg.png    common
68    Mekansm    2306    Active: Restore - Heals 250 HP and gives +2 armor in an area.\r\nPassive: Mekansm Aura - Bonus HP Regen in an area.\r\n\r\nMultiple instances of Mekansm Aura do not stack.\r\n+5 All Attributes\r\n+5 Armor\r\nBONUS HP REGEN: 4\r\nCOOLDOWN: 45\r\nMANA COST: 150\r\n\r\nA glowing jewel formed out of assorted parts that somehow fit together perfectly.    mekansm_lg.png    support
71    Necronomicon    2700    Active: Demonic Summing - Summons a Necronomicon Warrior and a Necronomicon Archer to fight for you.  Their strength and abilities increase as Necronomicon increases in level.  Lasts 35 seconds.\r\n\r\n+15/21/24 Intelligence\r\n+8/12/16 Strength\r\nCOOLDOWN: 80\r\nMANA COST: 50\r\n\r\nConsidered the holy grail of necromancy and demonology, a powerful malefic force is locked within its pages.    necronomicon_lg.png    caster
72    Eul's Scepter of Divinity    2800    Active: Cyclone - Target unit is swept up in a cyclone for 2.5 seconds, and is invulnerable.\r\n\r\nFlat movement speed bonuses from multiple Eul's Scepters do not stack.\r\n+10 Intelligence\r\n+150% Mana Regeneration\r\n+25 Movement Speed\r\nCOOLDOWN: 30\r\nMANA COST: 75\r\n\r\nA mysterious scepter passed down through the ages, its disruptive winds can be used for good or evil.    cyclone_lg.png    caster
73    Dagon    2805    Active: Energy Burst - Burst of damage to target enemy unit. Upgradable.\r\n\r\n+12/14/16/18/20 Intelligence\r\n+3 All Attributes\r\n+9 Damage\r\nBURST DAMAGE: 400/500/600/700/800\r\nCOOLDOWN: 40/36/32/28/24\r\nMANA COST: 180/160/140/120/100\r\n\r\nA lesser wand that grows in power the longer it is used, it brings magic to the fingertips of the user.    dagon_lg.png    caster
75    Aghanim's Scepter    4200    Pasive: Ultimate Upgrade - Upgrades the ultimates of certain heroes.\r\n\r\n+10 All Attributes\r\n+200 Health\r\n+150 Mana\r\n\r\nThe scepter of a wizard with demigod-like powers.    ultimate_scepter_lg.png    caster
76    Orchid Malevolence    5025    Active: Sould Burn - Silences target unit for 5.0 seconds and amplifies the damage it takes by 25.0%.\r\n\r\n+20 Intelligence\r\n+30 Attack Speed\r\n+45 Damage\r\n+225% Mana Regeneration\r\nCOOLDOWN: 18\r\nMANA COST: 100\r\n\r\nA garnet rod constructed from the essence of a fire demon.    orchid_lg.png    caster
86    Radiance    5150    Active: Toggles Burn Damage on or off.\r\nPassive:  Burn Damage = Deals damage per second in a 650 radius.\r\n\r\n+60 Damage\r\nBURN DAMAGE: 40\r\n\r\nA divine weapon that causes damage and a bright burning effect that lays waste to nearby enemies.    radiance_lg.png    weapons
88    Monkey King Bar    5400    Passive: Mini-bash - Gives a chance to minibash and deal bonus damage.\r\nPassive: True Strike - Prevents your attacks from missing.\r\n\r\n+88 Damage\r\n+15 Attack Speed\r\nCHANCE TO MINI-BASH: 35%\r\nMINI-BASH DAMAGE: 100\r\n\r\nA powerful staff used by a master warrior.    monkey_king_bar_lg.png    weapons
92    Hood of Defiance    2125    Multiple instances of spell resistance do not stack.\r\n\r\n+8 HP Regeneration\r\n+30% Spell Resistance\r\n\r\nA furred, magic, resistant headpiece that is feared by wizards.    hood_of_defiance_lg.png    armor
93    Blade Mail    2200    Active: Damage Return - Returns any damage you take to the unit that dealt the damage. Lasts 4 seconds.\r\n\r\n+22 Damage\r\n+5 Armor\r\n+10 Intelligence\r\nCOOLDOWN: 22\r\nMANA COST: 25\r\n\r\nA razor-sharp coat of mail, it is the choice of selfless martyrs in combat.    blade_mail_lg.png    armor
94    Vanguard    2225    Passive: Damage Block - Gives a chance to block damage, depending on the type of hero you are.\r\n\r\n+275 Health\r\n+6 HP Regeneration\r\nBLOCKED CHANCE: 60%\r\nRANGED BLOCK: 20\r\nMELEE BLOCK: 40\r\n\r\nA powerful shield that defends its wielder from even the most vicious of attacks.    vanguard_lg.png    armor
95    Soul Booster    3300    +450 Health\r\n+400 Mana\r\n+4 HP Regeneration\r\n+100% Mana Regeneration\r\n\r\nRegain lost courage.    soul_booster_lg.png    armor
96    Black King Bar    3900    Active: Avatar - Grants magic immunity.  Duration and cooldown decreases with each use.  Some ultimate abilities are able to disable through Black Kind Bar.\r\n\r\n+10 Strength\r\n+24 Damage\r\nDURATION: 10/9/8/7/6/5\r\nCOOLDOWN: 80/75/70/65/60/55\r\n\r\nA powerful staff imbued with the strength of giants.    black_king_bar_lg.png    armor
97    Shiva's Guard    4700    Active: Artic Blast - Emits a freezing wave that does 200 damage to enemies and slows their movement by -40% for 4.0 seconds.  Passive: Freezing Aura - Reduces attack speed on enemies.\r\n\r\nMultiple instances of Freezing Aura do not stack.\r\n+30 Intelligence\r\n+15 Armor\r\nAURA SLOW: 25%\r\nCOOLDOWN: 30\r\nMANA COST: 100\r\n\r\nSaid to have belonged to a goddess, today it retains much of its former power.    shivas_guard_lg.png    armor
98    Bloodstone    5050    Passive: Bloodpact - Starts with 5 charges.  Gains 1 Charge each time an enemy hero dies within 1600 units.  Each charge bestows 1 mana regeneration per second, reduces gold lost from death by 25, and reduces respawn time by 3 seconds.  When the bearer dies, restores 400HP + 30 HP per charge to allied units within 1675 units, then loses a third of its charges.  While dead, the bearer continues to receive experience at the death location and gives 1800 unit vision there.\r\n\r\n+500 Health\r\n+400 Mana\r\n+8 HP Regeneration\r\n+200% Mana Regeneration\r\n\r\nThe Bloodstone's bright ruby color is unmistakable on the battlefield, as the owner seems to have infinite vitality and spirit.    bloodstone_lg.png    armor
58    Boots of Travel    2700    Active: Teleport - Teleports you to an allied non-hero unit or structure.\r\n\r\nFlat movement speed bonus from multiple pairs of boots do not stack.\r\n+95 Movement Speed\r\nCOOLDOWN: 60\r\nMANA COST: 75\r\n\r\nWinged boots that grant omnipresence.    travel_boots_lg.png    common
77    Refresher Orb    5300    Active: Reset Cooldowns - Resets the cooldowns of all your items and abilities.\r\n\r\n+5 HP Regeneration\r\n+200% Mana Regeneration\r\n+ 40 Damage\r\nCOOLDOWN: 160\r\nMANA COST: 375\r\n\r\nA powerful artifact created for wizards.    refresher_lg.png    caster
78    Scythe of Vyse    5675    Active: Hex - Turns a target unit into a sheep for 3.5 seconds.  Destroys summoned units.\r\n\r\n+10 Strength\r\n+10 Agility\r\n+35 Intelligence\r\n+150% Mana Regeneration\r\nCOOLDOWN: 35\r\nMANA COST: 100\r\n\r\nThe ost guarded relic among the cult of Vyse, it is the most coveted weapon among magi.    sheepstick_lg.png    caster
91    Divine Rapier    6200    Drops on death.\r\n\r\n+250 Damage\r\n\r\nSo powerful, it cannot have a single owner.    rapier_lg.png    weapons
89    Daedalus    5750    Passive: Critical Strike - Grants a chance to a deal critical damage on an attack.\r\n\r\n+81 Damage\r\nCRITICAL CHANCE: 25%\r\nCRITICAL DAMAGE: 250%\r\n\r\nA weapon of incredible power that is difficult for even the strongest of warriors to control.    greater_crit_lg.png    weapons
112    Satanic    6150    Active: Unholy Rage - Increases Lifesteal by 175% for 3.5 seconds.\r\nPassive: Lifesteal -  Gives Lifesteal on attacks.\r\n\r\nSatanic is an Orb effect, and does not stack with other Orb effects.\r\n+20 Damage\r\n+25 Strength\r\n+5 Armor\r\nLIFESTEAL: 25%\r\nCOOLDOWN: 35\r\n\r\nImmense power at the cost of your soul.    satanic_lg.png    artifacts
99    Linken's Sphere    5175    Passive: Spellblock - Blocks most targeted spells once every 20 seconds.\r\n\r\n+15 All Attributes\r\n+6 HP Regeneration\r\n+150% Mana Regeneration\r\n\r\nThis magical sphere once protected one of the most famous heroes in history.    sphere_lg.png    armor
100    Assault Cuirass    5350    Passive:  Assault Aura - Grants attack speed and armor to nearby allied units, and decreases armor for nearby enemies.\r\n\r\nMultiple instances of Assault Aura do not stack.\r\n+35 Attack Speed\r\n+10 Armor\r\nAURA ATTACK SPEED: 20\r\nAURA BONUS ARMOR: 5\r\nARMOR REDUCTION: 5\r\n\r\nForged in the depths of the nether reaches, this hellish mail provides an army with increased armor and attack speed.    assault_lg.png    armor
101    Heart of Tarrasque    5500    Passive: Health Regeneration - Restores a percentage of max health per second.\r\n\r\n+40 Strength\r\n+300 Health\r\nHEALTH RESTORED: 25%\r\nCOOLDOWN: 6\r\n\r\nPreserved heart of an extinct monster, it bolsters the bearer's fortitude.    heart_lg.png    armor
69    Pipe of Insight    3628    Active: Barrier - Gives nearby friendly units a shield that blocks 400 spell damage.\r\n\r\nMultiple instances of spell resistance do not stack.\r\n+11 HP Regeneration\r\n+30% Spell Resistance\r\nCOOLDOWN: 60\r\n\r\nA powerful artifact of mysterious origin, it creates barrier against magical forces.    pipe_lg.png    support
111    Eye of Skadi    5850    Passive: Cold Attack - Attacks slow the movement and attack speed of the target.\r\n\r\nEye of skadi is an Orb effect, and does not stack with other Orb effects.\r\n+25 All Attributes\r\n+200 Health\r\n+150 Mana\r\nMOVE SLOW: 30%\r\nATTACK SLOW: 20%\r\n\r\nExtremely rare artifact, guarded by the azure dragons.    skadi_lg.png    artifacts
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jayd3e
--

COPY users (id, username) FROM stdin;
\.


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: jayd3e; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: guides_items_pkey; Type: CONSTRAINT; Schema: public; Owner: jayd3e; Tablespace: 
--

ALTER TABLE ONLY guides_items
    ADD CONSTRAINT guides_items_pkey PRIMARY KEY (id);


--
-- Name: guides_pkey; Type: CONSTRAINT; Schema: public; Owner: jayd3e; Tablespace: 
--

ALTER TABLE ONLY guides
    ADD CONSTRAINT guides_pkey PRIMARY KEY (id);


--
-- Name: heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: jayd3e; Tablespace: 
--

ALTER TABLE ONLY heroes
    ADD CONSTRAINT heroes_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: jayd3e; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jayd3e; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jayd3e
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: guides_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jayd3e
--

ALTER TABLE ONLY guides
    ADD CONSTRAINT guides_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES heroes(id);


--
-- Name: guides_items_guide_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jayd3e
--

ALTER TABLE ONLY guides_items
    ADD CONSTRAINT guides_items_guide_id_fkey FOREIGN KEY (guide_id) REFERENCES guides(id);


--
-- Name: guides_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jayd3e
--

ALTER TABLE ONLY guides_items
    ADD CONSTRAINT guides_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: guides_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jayd3e
--

ALTER TABLE ONLY guides
    ADD CONSTRAINT guides_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: jayd3e
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jayd3e;
GRANT ALL ON SCHEMA public TO jayd3e;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

