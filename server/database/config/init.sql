BEGIN;
DROP TABLE IF EXISTS users, posts CASCADE;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    image TEXT,
    user_id INTEGER,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)

);

INSERT INTO users (user_name, password, email) values 
('ahmed', '$2b$10$PuF03nm0/cAlmut2KrCKbe0QMFoZmLVS3hLUGxM5yd1v9060AJ0Ne', 'ahmed33@gmail.com'), --ahmed1234
('omar', '$2b$10$eDuZGepJ4sbQtA0PlZH4nugOKOHN1fx0TrXtx5Lx6I.O3Qom.eN3K', 'omar33@gmail.com'), --omar12334
('alaa', '$2b$10$UCli9.UB4HudL/cNKyuWx.VxsZG.q4f7/DZnzzMtovK6/WXIjDXS2', 'alaa33@gmail.com'); --alaa1234

INSERT INTO posts(title, content, image, user_id) values 
('We can pretty all much agree, space is awesome.'
,'In a recent press release containing new images captured by the Hubble Space Telescope, the National Aeronautic and Space Administration said that something weird was going on in outer space. No, really, thats what they said:
In recent years, thanks to data from Hubble and other telescopes, astronomers found another twist: a discrepancy between the expansion rate as measured in the local universe compared to independent observations from right after the big bang, which predict a different expansion value.
The cause of this discrepancy remains a mystery. But Hubble data, encompassing a variety of cosmic objects that serve as distance markers, support the idea that something weird is going on, possibly involving brand new physics.
Since the discovery of dark energy in the 90s, researchers have been able to account for the total sum of matter in the cosmos. This data, with help from the powerful Hubble Space Telescope'
,'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/NGC_4414_%28NASA-med%29.jpg/1200px-NGC_4414_%28NASA-med%29.jpg'
,'1'),
('Ring Around the Cosmos'
, 'Except for the rings of Saturn, the Ring Nebula (M57) is probably the most famous celestial band. This planetary nebulas simple, graceful appearance is thought to be due to perspective -- our view from Earth looking straight into what is actually a barrel-shaped cloud of gas shrugged off by a dying central star.
Astronomers of the Hubble Heritage Project produced this strikingly sharp image from NASAs Hubble Space Telescope by using natural colors to indicate the temperature of the stellar gas shroud. Hot blue gas near the energizing central star gives way to progressively cooler green and yellow gas at greater distances with the coolest red gas along the outer boundary. The Ring Nebula is about one light-year across and 2,000 light-years away in the northern constellation Lyra.'
,'https://talkingpointsmemo.com/wp-content/uploads/2014/06/hcapkcuoicqqiprnycfu.jpg'
,'2'),
('Space Telescope Science Institute.'
, 'Hubble Space Telescope image of a turbulent cosmic pinnacle that lies within a tempestuous stellar nursery called the Carina Nebula, located 7600 light-years away in the southern constellation of Carina. One of Webbs first released images will feature the Carina Nebula. Credit: NASA, ESA, M. Livio and the Hubble 20th Anniversary Team (STScI)'
,'https://petapixel.com/assets/uploads/2014/03/cosmos1.jpg'
,'2'),
('Wall Divides East and West Sides of Cosmic Metropolis'
, 'A new study unveils NGC 604, the largest region of star formation in the nearby galaxy M33, in its first deep, high-resolution view in X- rays. This composite image from Chandra X-ray Observatory data (colored blue), combined with optical light data from the Hubble Space Telescope (red and green), shows a divided neighborhood where some 200 hot, young, massive stars reside.
Throughout the cosmic metropolis, giant bubbles in the cool dust and warm gas are filled with diffuse, multi-million degree gas that emits X-rays. Scientists think these bubbles are generated and heated to X- ray temperatures when powerful stellar winds from the young massive stars collide and push aside the surrounding gas and dust. So, the vacated areas are immediately repopulated with the hotter material seen by Chandra.
However, there is a difference between the two sides of this bifurcated stellar city. (See annotated image for the location of the "wall".) On the western (right) side, the amount of hot gas found in the bubbles corresponds to about 4300 times the mass of the sun. This value and the brightness of the gas in X-rays imply that the western part of NGC 604 is entirely powered by winds from the 200 hot massive stars.'
,'https://www.nasa.gov/images/content/308168main_n604_665.jpg'
,'3');




COMMIT;
