
create type rol as enum('Usuario', 'Admin');

create table usuarios(
	id varchar(40) not null default gen_random_uuid(),
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	correo varchar(150) not null,
	ip inet not null,
	ciudad varchar(50) not null,
	block text not null,
	usuario varchar(50) not null,
	siguiendo int not null,
	seguidores int not null
);

create table credenciales(
	UserName varchar(100) primary key,
	contrasena text not null,
	user_rol rol not null
);

-----------------
-- Crear una llave primaria si se nos olvida ingresarla al crear la tabla 
-------------
-- alter table credenciales add primary key (UserName);

-----------------
-- Crear una llave foranea si se nos olvida ingresarla al crear la tabla 
-------------
alter table usuarios add constraint fk_UserName foreign key (usuario) references credenciales(UserName);

create table integrante(
	id serial primary key,
	nombre varchar(30) not null,
	edad smallint not null check(edad >9)
);


------------
-- Ingresar un insert violando la restricción (EJECUTA ERROR!)
------------
insert into integrante(nombre, edad) values
('rafael', 11),
('pedro', 8); -- viola la restricción

---------------------
-- Inserción correcta
---------------------
insert into integrante(nombre, edad) values
('Rafael', 11);

---------------------
-- Crear una nueva columna
---------------------
update credenciales set contrasena = generate_ramdon_password(5);

---------------------
-- Insertar contraseña tipo bytea
---------------------
alter table credenciales add column contrasena_sha byTea null;

---------------------
-- Insertar los datos en la nueva columna
---------------------
update credenciales set contrasena_sha= sha512(contrasena::bytea);

-----------------
-- Crear un atributo si se nos olvida ingresarlo al crear la tabla 
-------------
-- alter table integrante add constraiint check_edad check(edad >9);

INSERT INTO usuarios(nombre,apellido,correo,ip,ciudad,block,usuario,siguiendo,seguidores) VALUES
('Winnie','Peterson','winnie.peterson@bokegop.id','179.183.141.53','Falkland Islands','http://leni.ar/ma','brush99',108,17380),
('Myrtie','Powell','myrtie.powell@elbafla.kn','63.178.110.234','Vatican City','http://bawfobde.bv/oba','talk39',1028,13676),
('Pearl','Gray','pearl.gray@rotmel.kp','120.40.180.93','Mozambique','http://lek.co/nufcipwet','string3',2205,12213),
('John','Gomez','john.gomez@tiz.pt','48.19.23.170','Anguilla','http://ter.ug/oma','crowd20',2246,715),
('Angel','Rice','angel.rice@aheine.mv','8.210.127.192','Falkland Islands','http://ruara.ae/domahis','club12',571,13506),
('Eliza','Medina','eliza.medina@ivi.pw','43.35.201.166','St. Barthélemy','http://cekota.il/nojpa','fell75',1772,11864),
('Sean','Sims','sean.sims@tovum.je','104.122.100.124','Singapore','http://tijmun.hm/ocralsif','inside66',2618,13457),
('Alfred','Richards','alfred.richards@nopaskep.al','142.13.226.226','Monaco','http://owa.bt/sogubju','machinery11',3420,54),
('Nettie','Thornton','nettie.thornton@evgemij.mr','22.110.133.74','British Virgin Islands','http://lurhuv.lu/mavehid','loud25',3401,17491),
('Justin','Bell','justin.bell@rez.jm','57.38.92.11','Uzbekistan','http://fajumti.ro/fim','crop98',4834,16240),
('Lou','Joseph','lou.joseph@efot.ai','187.237.175.19','Brunei','http://zup.ao/keme','new100',3288,11680),
('Theresa','Wells','theresa.wells@ze.je','141.239.56.229','Qatar','http://if.my/gomijgaf','support29',3243,4479),
('Adam','Rhodes','adam.rhodes@koj.na','174.113.94.32','Aruba','http://jawvi.cx/vujozol','dark73',3039,738),
('Wayne','Shelton','wayne.shelton@werup.np','160.44.33.162','Singapore','http://ibacegef.is/cactes','sudden14',2401,10778),
('Carlos','Guzman','carlos.guzman@icevu.hn','174.95.96.130','Vanuatu','http://fe.mx/ti','have87',218,11766),
('Mason','Barnett','mason.barnett@wopba.ky','221.127.178.46','Swaziland','http://ivela.il/oduk','dear46',1854,5684),
('Vera','Kelly','vera.kelly@se.nc','233.184.218.211','Ghana','http://fu.li/caktur','building63',1034,1100),
('Danny','Dawson','danny.dawson@paapuba.gi','174.130.235.11','Lesotho','http://gecgipaw.sl/sorec','chair22',1672,1722),
('Edward','Bowen','edward.bowen@eruirenun.yt','51.85.224.186','Antigua & Barbuda','http://odo.pt/damekefih','spread61',610,19796),
('Ola','White','ola.white@kijic.gr','207.23.162.101','Bermuda','http://ce.vi/fisrauho','account86',3742,9703),
('Eddie','Fields','eddie.fields@noca.sd','10.236.0.240','Peru','http://nuemcos.gg/botu','easy12',4667,7790),
('Polly','Boyd','polly.boyd@zazvifkir.at','131.129.221.164','Timor-Leste','http://jepditdi.mw/juwac','girl10',159,4473),
('Cory','Shaw','cory.shaw@me.net','81.226.197.164','Azerbaijan','http://nus.kz/categ','seems18',3358,13793),
('Alejandro','Briggs','alejandro.briggs@ti.vi','209.28.100.58','Kiribati','http://paisi.ht/dezoshuh','fix85',2131,11712),
('Lelia','Martin','lelia.martin@bus.nr','215.70.97.157','Luxembourg','http://recoke.pf/ivsu','brown94',3226,1581),
('Lola','Bradley','lola.bradley@dol.ws','61.136.205.74','Northern Mariana Islands','http://ivo.ac/bihja','scared93',4958,544),
('Catherine','Hale','catherine.hale@kij.tg','113.179.213.231','Belarus','http://hompodoz.gp/ra','passage41',50,18201),
('Alexander','Garza','alexander.garza@sawdadmuh.ga','142.69.15.219','Somalia','http://tamrafig.tn/rapravaf','shoe93',1570,19814),
('Maggie','Jordan','maggie.jordan@wup.jm','179.152.194.191','Suriname','http://wam.az/zozu','stock41',429,877),
('Craig','Cook','craig.cook@juh.sa','225.53.55.248','Mongolia','http://duhuwe.co.uk/witbeano','threw94',1133,10270),
('Rosalie','Russell','rosalie.russell@dut.ad','152.238.33.102','Mexico','http://fiki.gi/et','calm22',3682,3638),
('Dora','Romero','dora.romero@ogekuzec.mt','250.72.177.106','Tajikistan','http://vufuci.br/ete','against100',571,10965),
('Gene','Henry','gene.henry@sawdadmuh.ga','248.252.191.158','Costa Rica','http://cirneka.la/ruvbas','past96',1899,9891),
('Olga','Ramirez','olga.ramirez@minaj.za','239.233.229.166','Yemen','http://viwe.hn/wuhuc','wise62',1241,16612),
('Georgia','Ford','georgia.ford@go.org','212.244.238.52','Nicaragua','http://kacirho.hr/oj','great61',3531,11531),
('Roger','Caldwell','roger.caldwell@amoga.il','94.26.134.153','Angola','http://vi.dm/bufah','quick8',1254,17807),
('Leila','Olson','leila.olson@pepeh.ng','182.192.150.208','Guatemala','http://pewe.im/im','can97',4302,323),
('Estelle','Larson','estelle.larson@atezoroh.ni','252.48.158.28','Congo - Brazzaville','http://kupoc.hk/lahvez','your31',3038,4592),
('Jordan','Cruz','jordan.cruz@nedceda.eg','86.6.156.26','Zimbabwe','http://tiju.uy/wigav','wish86',4473,2196),
('Lucille','Jordan','lucille.jordan@juko.fk','177.5.62.123','Samoa','http://fin.bt/owowinem','recent56',3824,3807),
('Kate','Cunningham','kate.cunningham@lif.kg','102.6.166.189','Mauritania','http://sul.gt/mad','age8',4964,17832),
('Jeremiah','Rowe','jeremiah.rowe@sacvu.cw','92.156.136.161','Bhutan','http://vongibka.la/omzajpa','truth42',4718,11918),
('Olivia','Reeves','olivia.reeves@on.aq','234.232.124.56','San Marino','http://bejesetur.aw/vulot','highway86',3203,12216),
('Kyle','Ryan','kyle.ryan@cuvawda.ao','69.168.112.39','Vanuatu','http://loz.lc/cunowob','branch71',522,9556),
('Jack','Barber','jack.barber@fob.bm','110.97.191.220','Ceuta & Melilla','http://oniwis.ch/dop','from14',2590,16787),
('Devin','Schneider','devin.schneider@givuzu.gu','112.251.143.236','French Polynesia','http://aluis.nz/da','per7',4963,18312),
('Keith','Walters','keith.walters@kesgulug.mv','153.145.54.84','Romania','http://tisubpoc.sg/taju','whole96',631,14892),
('Don','Dunn','don.dunn@urapaj.lr','45.101.48.3','Georgia','http://feomuhez.kw/hofefit','corner48',4525,16604),
('Walter','Barnes','walter.barnes@ga.vg','237.152.243.49','Guyana','http://pe.nz/pecos','shallow27',4274,3649),
('Hunter','Gibson','hunter.gibson@parpa.be','169.62.255.81','Azerbaijan','http://nekwugo.gf/ogaog','one62',3697,4769),
('Todd','Tate','todd.tate@luzobjej.ru','45.246.16.251','Estonia','http://ju.mr/vajrahva','bus61',1556,288),
('Luella','Yates','luella.yates@kabcedi.sk','134.17.107.47','Gabon','http://ahiogovis.sl/ibtoaka','minute59',2527,16576),
('Emily','Hamilton','emily.hamilton@koke.ws','105.73.77.68','South Africa','http://cebaczam.tm/giwefe','this58',3354,11412),
('Gary','Rowe','gary.rowe@gocha.vi','59.229.48.243','Faroe Islands','http://fo.yt/sibno','experience6',3819,527),
('Kyle','Garza','kyle.garza@johlab.eh','249.137.8.11','Åland Islands','http://tucaul.cu/puspun','satisfied45',418,2209),
('Cameron','Sparks','cameron.sparks@najeohi.mc','69.66.239.172','Oman','http://zunamu.gf/navil','word13',4790,8336),
('Nannie','Fleming','nannie.fleming@kece.uk','113.13.108.114','Guyana','http://pu.gu/rovit','bright3',4915,4426),
('Randall','Hoffman','randall.hoffman@esocov.qa','114.17.4.105','North Korea','http://ucocu.aw/iz','pocket7',3107,685),
('Clarence','Chapman','clarence.chapman@iceezise.nz','57.233.81.116','Russia','http://umohilu.in/efdo','rhythm34',2821,6547),
('Janie','Jones','janie.jones@nahemna.bn','235.79.152.148','Dominica','http://cuced.io/vomterin','knife33',1113,8028),
('May','Pittman','may.pittman@ju.io','59.222.141.156','Vatican City','http://ucetu.tr/gaji','four74',1870,3047),
('Johanna','McKenzie','johanna.mckenzie@wunure.bd','115.190.51.34','Sudan','http://imifupwe.gl/la','birds55',4765,7392),
('James','Reeves','james.reeves@dioluce.td','235.197.231.151','Mongolia','http://moehe.sh/ma','record60',3938,17888),
('Justin','Paul','justin.paul@op.es','96.236.224.122','Honduras','http://avoisofeh.nz/nifbepug','have24',3399,2800),
('Joel','Robinson','joel.robinson@luvumce.et','231.135.238.131','Libya','http://kinullav.gl/dac','green77',1115,5379),
('Cora','Myers','cora.myers@bobad.az','180.220.42.110','Burundi','http://palmak.im/cihac','kind42',2504,11260),
('Belle','Robertson','belle.robertson@efa.gf','223.60.120.182','Tristan da Cunha','http://odaro.mk/jurko','green9',314,10074),
('Bobby','Miller','bobby.miller@nafkogih.gl','26.184.183.166','Kiribati','http://ledec.by/am','luck70',4114,14672),
('Lenora','Davidson','lenora.davidson@vebbog.gg','150.58.72.36','Estonia','http://wipaf.su/pe','nice98',3402,9431),
('Aiden','Wallace','aiden.wallace@ami.pr','101.169.122.10','Curaçao','http://iradwa.et/reak','loose32',2744,17449),
('Bobby','Vargas','bobby.vargas@zud.hm','85.231.173.227','Lebanon','http://nu.ae/soncihzak','sound94',4479,5745),
('Millie','Watkins','millie.watkins@to.au','155.45.185.241','Bangladesh','http://borwi.pm/tev','age35',4334,1618),
('Bertie','Harper','bertie.harper@roc.vg','124.29.127.6','Monaco','http://judgabab.rw/etomuin','known15',1759,5519),
('Katie','Lucas','katie.lucas@girgegceb.bn','176.55.166.195','Hungary','http://mep.sn/hica','interest81',1786,2246),
('Eugene','Armstrong','eugene.armstrong@iwuehe.pe','210.245.62.201','Latvia','http://fedigavu.na/kufe','east55',3943,7474),
('Bryan','Hicks','bryan.hicks@palcorso.et','168.243.149.192','Nigeria','http://beh.gov/ciji','stronger72',2602,14476),
('Eva','Fernandez','eva.fernandez@ogodup.ag','228.150.159.10','Montserrat','http://vob.lk/ata','earth2',180,2317),
('Ollie','Chambers','ollie.chambers@lo.my','242.137.226.209','Serbia','http://wujzel.ky/zugiz','ago1',3786,19871),
('Jack','Guzman','jack.guzman@fivivkim.cy','126.135.120.162','Mayotte','http://nupispon.se/salegebe','troops66',2178,7580),
('Paul','Banks','paul.banks@ki.py','77.205.6.222','Algeria','http://wud.pk/ojova','both59',4248,18248),
('Rachel','McCormick','rachel.mccormick@wib.my','238.7.77.42','Ukraine','http://logwoja.nl/wo','brave76',1077,4558),
('Christopher','Berry','christopher.berry@hap.com','168.89.96.108','Norway','http://vuum.do/supicno','spite69',188,17100),
('Jared','Gill','jared.gill@sukkam.mx','45.200.75.57','Anguilla','http://oloimece.mz/adoposij','apple35',3169,7434),
('Randy','Palmer','randy.palmer@mikecrad.sh','98.63.127.20','Iran','http://apji.se/wo','managed49',2506,7008),
('Victoria','Osborne','victoria.osborne@vu.nf','29.176.133.231','Åland Islands','http://ni.eh/gi','kept55',1315,16217),
('Augusta','Bryant','augusta.bryant@ejo.qa','234.86.95.28','Algeria','http://goroztuf.ls/ipzumuc','sport67',385,14708),
('Edna','Romero','edna.romero@kociga.nl','41.242.203.119','Falkland Islands','http://ruszu.mu/ci','lead3',3444,12115),
('Lettie','Morales','lettie.morales@lenapu.jm','109.83.237.52','Sierra Leone','http://vusziluf.kw/egwad','atom28',2766,5268),
('Sam','Willis','sam.willis@daloc.cf','174.111.165.25','Senegal','http://muf.gn/nihnohtel','clearly8',4619,11300),
('Jimmy','Sharp','jimmy.sharp@wi.vg','243.41.102.119','Antarctica','http://capfid.ye/iregob','stomach39',365,18842),
('Fred','Boone','fred.boone@gozewlaw.ni','149.20.249.166','Serbia','http://na.li/tino','badly37',1763,3345),
('Agnes','Willis','agnes.willis@jijoru.ax','5.198.16.68','Czech Republic','http://ir.dj/monafle','empty86',3431,19033),
('Gavin','Watkins','gavin.watkins@orbeb.sz','7.224.94.209','Ghana','http://osu.sy/gaf','mission18',962,15159),
('Victoria','Higgins','victoria.higgins@enejetaji.ml','19.52.14.159','Réunion','http://cav.bg/haho','bow94',1957,11110),
('Seth','Hayes','seth.hayes@tad.ss','23.203.109.60','United Arab Emirates','http://rimhi.mt/nigco','rear31',3202,5178),
('Nelle','Wilkerson','nelle.wilkerson@sim.kw','118.196.168.7','Falkland Islands','http://focuhki.kr/pu','excellent33',3407,14172),
('Matthew','Hopkins','matthew.hopkins@veramlu.fm','35.46.235.72','Laos','http://sam.sc/ite','shore78',425,5398),
('Scott','Bass','scott.bass@cavuwip.bd','76.37.129.215','Hungary','http://fujibo.kw/ogo','not9',4724,4963),
('Chad','Simon','chad.simon@uchubceg.bt','204.204.11.149','Andorra','http://sulaso.ve/veb','frozen46',3853,18414),
('Edward','Marsh','edward.marsh@zenvi.co','9.63.67.149','Ceuta & Melilla','http://pezesaw.bo/if','map90',2331,10163),
('Jane','Hogan','jane.hogan@wijas.bd','165.137.107.177','South Africa','http://vujicti.sn/dok','storm7',672,1058),
('Leo','Barnes','leo.barnes@fulfe.ki','211.235.85.168','Anguilla','http://gebdol.to/ubo','variety3',116,19618),
('Ina','Duncan','ina.duncan@inavawi.mz','197.77.63.150','Greenland','http://waz.dz/buhcu','window95',4491,15332),
('Loretta','Stevenson','loretta.stevenson@fih.hu','20.166.199.96','Israel','http://wepuvu.kp/ipiugu','city20',3824,3829),
('Henry','Holloway','henry.holloway@vial.vi','43.200.138.92','Bosnia & Herzegovina','http://wenwa.md/ranco','second87',4110,3134),
('Agnes','Glover','agnes.glover@wojsu.mt','210.181.209.181','Singapore','http://rumwakwoj.ar/ke','rocket31',3392,15324),
('Ida','Todd','ida.todd@rewrijbi.bo','78.191.143.140','Burkina Faso','http://zergak.ua/ap','speech94',4748,16085),
('Lottie','Wolfe','lottie.wolfe@sawdadmuh.ga','151.56.160.152','Tokelau','http://ucahe.io/dite','clothes41',2694,19024),
('Shane','Alexander','shane.alexander@tes.ie','187.76.170.238','Suriname','http://letes.ee/bipijhun','light10',3934,14519),
('Mathilda','Lambert','mathilda.lambert@moohi.cw','113.183.72.231','Bahamas','http://feruec.np/hab','accept46',2149,14268),
('Barbara','Collier','barbara.collier@agewalme.sd','136.22.222.28','Réunion','http://ze.yt/ciuli','shadow63',1988,19164),
('Elva','Jimenez','elva.jimenez@ahrer.iq','189.229.218.69','Guatemala','http://atlagpow.lv/gishuj','tree76',4098,3421),
('Clarence','Holland','clarence.holland@lusnageg.nf','96.228.125.87','Ethiopia','http://ak.no/melik','board87',3221,18709),
('Ada','West','ada.west@sedca.ki','82.24.227.62','Guatemala','http://lesrid.sn/leb','last53',3618,7403),
('Roger','Allen','roger.allen@ru.su','144.70.190.174','Tanzania','http://muzfem.pa/fo','scientific83',590,16589),
('Mina','Graham','mina.graham@muliwru.in','34.245.174.113','French Guiana','http://zuvise.rs/dujwogi','tight46',7,55),
('Don','Harris','don.harris@ra.br','148.185.201.168','Indonesia','http://badguare.tg/intu','building84',4504,4594),
('May','McDonald','may.mcdonald@si.hm','46.42.74.162','Barbados','http://fov.tr/ulaozfor','back77',2986,163),
('Alice','Davis','alice.davis@lu.ph','6.168.246.139','Mexico','http://di.fo/megso','this33',4619,10214),
('Billy','Myers','billy.myers@uwko.br','192.210.186.61','Namibia','http://wogup.gr/bib','deeply19',2270,1546),
('Raymond','Campbell','raymond.campbell@viafooni.mg','221.9.93.54','Samoa','http://celte.io/ta','table98',1910,14172),
('Alex','Tyler','alex.tyler@lamfib.gb','205.95.223.92','United Kingdom','http://bi.ch/tennig','stick79',3245,19197),
('Bessie','Martinez','bessie.martinez@buwi.tg','70.29.28.201','Tanzania','http://licsocofa.aq/uvki','white69',1442,19903),
('Ada','Stewart','ada.stewart@rezvisag.nz','39.180.157.41','Turkmenistan','http://bo.an/veldo','trace15',832,7317),
('Polly','Gibbs','polly.gibbs@tushucrut.vu','20.223.159.52','Jersey','http://boho.as/aziakeaw','flow25',1507,17223),
('Louise','McGuire','louise.mcguire@zi.pl','193.124.57.139','South Sudan','http://ponzif.ng/migcevun','mixture72',3886,18096),
('Bertha','Becker','bertha.becker@ucnic.ma','248.48.136.7','Marshall Islands','http://taci.ch/mom','title53',1830,15581),
('Alan','Nelson','alan.nelson@nate.th','22.206.213.152','Tokelau','http://panvi.rw/ovovu','tired66',1863,2463),
('Barbara','Huff','barbara.huff@isak.es','119.124.246.62','United States','http://sa.co/usivoveta','became11',4999,6294),
('Adele','Rivera','adele.rivera@biki.be','149.115.214.21','Tuvalu','http://ino.va/el','sign10',4785,19734),
('Sue','Torres','sue.torres@zujedarok.gw','111.34.225.73','Mauritius','http://vaempav.tm/da','law50',2523,4227),
('Jerry','Ball','jerry.ball@fow.vu','118.255.58.115','Serbia','http://row.ni/foozo','exercise71',3308,9974),
('Blanche','Rodgers','blanche.rodgers@mohfo.jo','144.196.233.218','French Southern Territories','http://puh.cu/bobtu','orbit100',3605,4769),
('Maud','Gill','maud.gill@va.my','32.102.94.209','Bermuda','http://vimutus.tf/ku','hunter75',2448,11858),
('Millie','Bridges','millie.bridges@lofgum.il','244.188.109.103','Spain','http://wobnadic.cm/te','appropriate28',4,6632),
('Rhoda','Barrett','rhoda.barrett@sikevo.cm','53.143.72.27','Luxembourg','http://tiagdu.st/rison','energy92',4184,7556),
('Celia','Luna','celia.luna@lubitpo.sm','9.85.98.81','Micronesia','http://ilulo.fi/gah','silver67',113,14441),
('Mary','Porter','mary.porter@muskice.au','5.196.113.61','Nauru','http://jadoowe.hk/bi','basis82',1570,18604),
('Isabelle','Roberts','isabelle.roberts@haemi.co','176.214.1.201','Greenland','http://lehpored.dk/cico','audience56',325,11428),
('Sam','Bishop','sam.bishop@iglozwu.dj','212.75.224.125','Norway','http://pahote.lr/julico','baseball14',1257,2141),
('Lillian','Beck','lillian.beck@wulepe.lu','25.58.119.51','Guinea','http://om.ua/juc','while28',2280,2991),
('Lucile','Watson','lucile.watson@lor.vu','244.53.248.104','Cocos (Keeling) Islands','http://webe.lr/kodujbo','thought17',4098,2583),
('Lora','Moore','lora.moore@rodotnis.at','104.201.198.210','Martinique','http://log.kn/zeti','rich4',4660,15636),
('Howard','Freeman','howard.freeman@radah.co','54.8.171.20','Moldova','http://buz.eg/tino','opportunity85',3565,16061),
('Fred','Floyd','fred.floyd@ocouv.ua','140.125.8.98','Argentina','http://uvoevu.mu/meimri','indeed60',752,1119),
('Rachel','Hamilton','rachel.hamilton@lite.sb','185.66.88.121','Mongolia','http://higebda.fr/ra','deeply78',3828,18147),
('Gertrude','Gross','gertrude.gross@urera.cd','116.109.192.141','Belgium','http://fud.mw/korahvo','peace20',3098,808),
('Ronald','Hayes','ronald.hayes@hajdat.at','225.11.112.189','Netherlands','http://kukuli.sj/zedroem','began39',876,13655),
('Johnny','Stevenson','johnny.stevenson@ungapti.nz','133.24.17.245','Palestinian Territories','http://bafhem.mn/juwti','eventually67',1458,1118),
('Tommy','Newton','tommy.newton@petsozgo.mt','78.155.76.69','Ecuador','http://tega.ru/tezuz','syllable7',4629,14914),
('Jay','Green','jay.green@icki.su','21.159.222.204','Guinea-Bissau','http://am.ss/jijsug','joined70',3094,16088),
('Fred','James','fred.james@givkesto.az','236.81.154.131','Yemen','http://udmewa.pf/zuzozoz','pool49',220,11745),
('Juan','Figueroa','juan.figueroa@sawdadmuh.ga','181.244.69.105','Bhutan','http://co.sg/novlicuc','manufacturing5',4438,9456),
('Linnie','Conner','linnie.conner@butmos.ao','9.230.65.84','China','http://hazoseba.ua/lohmul','wind65',2027,6383),
('Nellie','Anderson','nellie.anderson@uv.gq','57.10.240.183','Iceland','http://igi.uk/vo','program3',1471,8130),
('Hulda','Jordan','hulda.jordan@jaf.kn','188.5.173.84','Åland Islands','http://jamugat.sk/te','poor93',1077,3646),
('Mabel','McCormick','mabel.mccormick@sok.net','34.7.138.162','Hungary','http://ogu.net/siszav','captured71',4568,10829),
('Peter','Dennis','peter.dennis@cadiebi.sm','186.210.42.173','South Georgia & South Sandwich Islands','http://fidawo.hn/pug','ill30',3130,4868),
('Maude','Dunn','maude.dunn@siffoomu.pg','142.227.128.37','South Korea','http://ri.ro/nesca','whispered89',3474,14143),
('Cora','Maxwell','cora.maxwell@cofviv.sd','41.162.220.251','Tuvalu','http://tip.am/suvu','heard96',4536,2026),
('Howard','Carson','howard.carson@pomecum.pm','94.0.16.158','Lithuania','http://notvef.gt/etve','hurry69',2080,15059),
('Russell','Morris','russell.morris@jaf.bm','133.110.7.31','Syria','http://olbami.ml/si','face37',4093,12549),
('Carl','Ramirez','carl.ramirez@topacek.cf','230.228.241.26','Luxembourg','http://eve.bn/cic','negative67',3538,18666),
('Adelaide','Ingram','adelaide.ingram@zikudjer.dk','146.14.55.43','Turkey','http://fici.kh/gunafvi','birth94',1493,19180),
('Virginia','Harvey','virginia.harvey@raz.jp','41.135.150.89','Slovenia','http://ej.tl/jo','individual71',2268,19372),
('Leo','Paul','leo.paul@minuc.eh','217.128.221.12','American Samoa','http://kawkah.gov/jiil','promised19',1390,7441),
('Minnie','Burton','minnie.burton@levvob.io','84.56.184.161','Vanuatu','http://nuek.tz/rudog','top24',1785,14588),
('Catherine','Stephens','catherine.stephens@reg.ru','90.20.97.168','Haiti','http://ukogo.au/hepu','statement29',1097,6376),
('Jean','Chambers','jean.chambers@apuviozu.vc','119.242.245.206','Côte d-Ivoire','http://fik.py/naftagiru','salt33',3113,917),
('Winnie','Cooper','winnie.cooper@vohnobe.ai','72.251.157.180','Trinidad & Tobago','http://udnoce.zw/mod','spring54',4597,480),
('Addie','Ball','addie.ball@aku.er','67.194.105.228','Taiwan','http://dephafce.uy/kuprupiwo','ran42',2507,2523),
('Elmer','Keller','elmer.keller@wimu.st','2.127.40.145','Malaysia','http://guece.ky/wiiti','choice81',1279,1540),
('Mae','Figueroa','mae.figueroa@duvteho.pm','37.35.43.238','Gabon','http://coupbu.hk/lecumi','rope55',2708,11621),
('Ronald','Mann','ronald.mann@hikgesbo.hu','169.19.160.74','Macedonia','http://wizbip.jm/vok','may57',2148,2520),
('Christian','Fisher','christian.fisher@zer.sl','82.109.34.102','Oman','http://pej.am/adivar','teach52',4281,12000),
('Fannie','Collins','fannie.collins@haza.mw','158.18.205.8','Chile','http://jojohwuh.mt/bahekke','have36',966,6560),
('Maria','Sims','maria.sims@hibcoh.tw','88.35.84.48','Marshall Islands','http://ke.bq/lav','recently21',884,15181),
('Henrietta','Adams','henrietta.adams@ubiat.ci','20.242.109.83','Anguilla','http://sip.na/simo','excitement30',2479,8008),
('Eliza','McLaughlin','eliza.mclaughlin@radmak.ad','211.209.120.171','Japan','http://lofohmeb.gd/ujfe','theory57',416,16245),
('Sean','Williams','sean.williams@wasic.au','8.103.243.50','Kyrgyzstan','http://wiado.bh/legom','short79',2656,7250),
('Vernon','French','vernon.french@bumnu.tn','87.20.239.54','Malawi','http://gar.gb/hatse','hour2',2401,1162),
('Evan','Burgess','evan.burgess@nic.no','158.27.112.168','Kiribati','http://wiful.ch/nulufteb','foreign28',838,18231),
('Christian','Owen','christian.owen@latufej.ug','249.209.8.116','Burkina Faso','http://dekrepum.tn/epese','myself50',2411,16179),
('Christian','Welch','christian.welch@for.sv','208.187.118.95','St. Kitts & Nevis','http://rare.mz/igeafiise','team9',4142,17933),
('Christine','Terry','christine.terry@hamepaga.hm','27.94.108.69','Portugal','http://ifeko.sy/vijhi','identity75',2995,6313),
('Alan','Ferguson','alan.ferguson@tul.mp','53.8.97.50','Ireland','http://na.gn/nugkor','gold40',1799,3246),
('Willie','Bowers','willie.bowers@cevhure.uz','249.99.44.190','Austria','http://za.ee/tip','living80',3740,10161),
('Lucile','Thomas','lucile.thomas@ko.se','124.12.192.238','Caribbean Netherlands','http://nadkergom.bz/haiho','folks37',3121,376),
('Helena','Allen','helena.allen@dag.ps','43.114.156.170','Kenya','http://gudnodzad.ly/ebe','information7',4409,1278),
('Louise','Foster','louise.foster@pive.tn','21.91.211.216','Mayotte','http://dipon.qa/nibupub','red67',464,8025),
('Johnny','Adkins','johnny.adkins@fuvruala.ni','31.85.219.167','Bhutan','http://pibugfol.ci/tam','shells85',2022,18083),
('Derek','Hopkins','derek.hopkins@imku.cz','63.57.62.76','Madagascar','http://pegadipi.yt/bopgelcih','population76',268,19555),
('Laura','Maxwell','laura.maxwell@nubappid.tc','80.232.158.32','Taiwan','http://timoj.pg/cu','dust56',750,18129),
('Todd','Wagner','todd.wagner@dewro.is','102.69.12.219','Faroe Islands','http://fe.sh/ubmubeg','medicine61',3856,7935),
('Lucille','Hunter','lucille.hunter@didu.sk','216.133.246.32','Singapore','http://agnik.pn/kicsa','cent54',3176,9786),
('Francis','Barton','francis.barton@sisezce.om','57.81.104.155','Guernsey','http://ti.cc/lafza','truth60',3099,19215),
('Willie','Dean','willie.dean@cearca.mt','108.125.9.28','Ecuador','http://va.mr/apisichob','poetry75',108,5266),
('Cecilia','Munoz','cecilia.munoz@hofrolud.co.uk','157.18.200.65','Iceland','http://upwow.sy/bow','forth93',3720,15370),
('Helena','Howell','helena.howell@lo.pg','116.8.100.215','British Virgin Islands','http://hitabu.pe/zecurtu','position20',4890,15555),
('Oscar','Henry','oscar.henry@set.at','29.104.189.140','Colombia','http://voj.gs/egi','pine89',4,9735),
('Marc','Hopkins','marc.hopkins@uziweki.kg','138.6.123.59','Guernsey','http://tav.ag/vuvze','fight61',964,7254),
('Jeremy','Norris','jeremy.norris@ah.aq','178.86.105.137','Ethiopia','http://agwe.lr/ugzib','top73',2173,15754),
('Alexander','Richardson','alexander.richardson@cer.sx','153.58.138.148','Austria','http://hupibwi.pt/safrok','grew45',3793,11078),
('Hilda','Neal','hilda.neal@weeho.td','6.68.91.232','Swaziland','http://tavojodud.ug/vipaut','try98',1701,15506),
('Olga','Gilbert','olga.gilbert@dowuar.cf','235.130.95.210','Cuba','http://cuh.gy/botu','cost80',3891,13744),
('Justin','Miles','justin.miles@iwigoj.mg','157.18.247.28','Montserrat','http://vesage.cr/da','rubber86',3005,4666),
('Rosalie','Lucas','rosalie.lucas@ov.fk','45.8.101.235','Christmas Island','http://hivjelra.tm/rawih','joined89',372,18651),
('Glen','Becker','glen.becker@dof.mk','6.147.122.199','Taiwan','http://fijodo.gov/enuveivo','account93',2253,2801),
('Minerva','Barton','minerva.barton@joib.ir','229.248.102.106','Bahrain','http://detabdir.de/wedbif','grandfather73',1168,17383),
('Betty','Neal','betty.neal@jasson.ae','166.98.0.19','Guinea','http://fukhih.su/ikjelagi','yard87',3345,18635),
('Susie','Fisher','susie.fisher@diw.in','74.49.220.113','Cape Verde','http://cudzahto.cz/gofcus','tomorrow69',289,18061),
('Fannie','Clayton','fannie.clayton@pubnid.bs','166.81.154.246','Japan','http://davoszoz.vc/ku','belong68',3701,4209),
('Antonio','Leonard','antonio.leonard@avubuztun.as','208.148.144.46','Slovenia','http://depa.sl/ezpom','frog1',4219,13520),
('Steve','Mack','steve.mack@ojo.er','172.168.47.53','Comoros','http://fepzakuw.ke/fubo','example76',1426,11355),
('Steve','Spencer','steve.spencer@do.de','56.100.204.168','Chad','http://novbo.is/ogugek','thought59',4789,7927),
('Georgie','Robbins','georgie.robbins@zeggevfo.gb','13.184.61.132','São Tomé and Príncipe','http://osanatog.pn/pe','experiment93',4633,5631),
('Eva','Collier','eva.collier@ifemem.gd','40.194.113.170','Brazil','http://bifzase.sj/re','friend4',4074,6889),
('Joshua','Rice','joshua.rice@na.pl','41.234.186.213','Micronesia','http://zira.dm/roduknil','five90',2124,9731),
('Marguerite','Willis','marguerite.willis@beef.vi','110.229.179.102','Ukraine','http://dakhejno.cl/mirernez','drove19',1390,13161),
('Harriett','Drake','harriett.drake@hec.bs','165.2.204.248','Fiji','http://bidorowen.ye/bad','bowl28',4786,7399),
('Leon','Davis','leon.davis@nohejji.ma','177.155.68.93','Belize','http://debiuk.co/wo','directly89',622,18872),
('Blake','Walters','blake.walters@wihuske.nc','105.184.194.65','Nicaragua','http://vican.tj/bupavad','well31',762,18494),
('Effie','Davidson','effie.davidson@eta.us','212.89.110.91','Libya','http://lu.mo/uhhokdem','eleven47',4625,15635),
('Mason','Thornton','mason.thornton@pabuhe.io','105.149.7.119','Antigua & Barbuda','http://tunkiev.be/jinij','hunt37',1744,12984),
('Rachel','Sullivan','rachel.sullivan@eve.bq','97.205.236.16','Ecuador','http://cezoru.qa/zidut','most9',2956,12975),
('Lloyd','Lucas','lloyd.lucas@cifigec.me','89.118.229.117','Tuvalu','http://orrili.ga/ni','baby21',3878,15480),
('Steven','Cole','steven.cole@vuphiuci.eg','147.210.114.218','Dominican Republic','http://gunamhi.eh/zepu','silence33',1281,5829),
('Erik','Gonzales','erik.gonzales@paciro.kh','25.60.84.91','Isle of Man','http://hej.ph/pez','stuck64',1118,2844),
('Carolyn','Miller','carolyn.miller@datzozgi.gov','242.18.115.180','Singapore','http://vemcu.ac/we','past77',311,10459),
('Hester','Barnes','hester.barnes@juku.mh','74.236.90.187','Syria','http://agvozuc.fk/liv','dug89',4340,9519),
('Marvin','Washington','marvin.washington@birate.bf','233.141.232.8','Angola','http://game.ug/dapovlum','chance13',4919,11329),
('Aiden','McLaughlin','aiden.mclaughlin@nucajvu.cu','194.181.1.64','Bhutan','http://toddemom.ml/sib','teacher64',2681,17734),
('Derrick','Newman','derrick.newman@liwbe.tw','246.61.56.72','China','http://demroupi.sn/vapikzo','simple91',208,17168),
('Gerald','Phelps','gerald.phelps@norsonok.so','54.53.86.178','Lesotho','http://da.ki/rud','slight82',425,10104),
('Johanna','Castro','johanna.castro@ticevzaj.mt','65.57.37.100','Curaçao','http://pomawe.er/lompu','flew96',4547,1287),
('Troy','Armstrong','troy.armstrong@muatuumu.mm','220.191.89.213','Kosovo','http://to.la/debbidwe','sitting25',2415,13206),
('Brent','Walker','brent.walker@wuhaggef.sm','212.96.193.161','Togo','http://wus.sx/dite','dull95',3109,14366),
('Edward','Patton','edward.patton@pammu.io','90.69.4.111','Czech Republic','http://talog.pg/adusihaf','stepped45',4436,1719),
('Keith','Baker','keith.baker@un.va','170.171.134.154','Zimbabwe','http://nusuwuos.uk/omir','actual32',4154,9959),
('Lillie','Martinez','lillie.martinez@daz.bf','166.97.217.149','Argentina','http://kuwovwoc.tt/vemto','smoke67',1747,8619),
('Sophia','Drake','sophia.drake@vep.iq','87.230.172.67','American Samoa','http://ahejoplez.gw/birfamel','house31',2568,2767),
('Francis','Williams','francis.williams@meele.hm','244.50.120.31','Bhutan','http://zo.so/guofru','silence77',4743,12028),
('Julian','Herrera','julian.herrera@lafokoz.gu','72.177.245.171','Costa Rica','http://huro.si/jodape','lonely30',47,3792),
('Jack','Mann','jack.mann@newnebep.kg','113.212.239.231','Eritrea','http://vosif.dm/sa','lower2',1589,17875),
('Gussie','Christensen','gussie.christensen@bo.ba','76.149.71.20','Malaysia','http://caakoes.hr/gi','birth42',1218,12404),
('Francis','Wilson','francis.wilson@guhollo.pg','91.15.222.152','Curaçao','http://ap.gq/rokta','rhyme26',3683,12706),
('Lee','Singleton','lee.singleton@ze.cf','91.101.154.112','Djibouti','http://ne.my/owtebloc','phrase71',3490,1055),
('Edna','Bailey','edna.bailey@tehguzi.yt','218.55.126.252','South Georgia & South Sandwich Islands','http://biimce.fm/tohu','speed45',2696,18392),
('Lina','Ferguson','lina.ferguson@fi.ki','196.68.190.25','French Guiana','http://rulrukoh.id/ew','want66',2237,17989),
('Katherine','Lambert','katherine.lambert@zob.tt','78.145.84.80','Hong Kong SAR China','http://bobsig.mu/hemus','anyway43',4474,15468),
('Cora','Barnett','cora.barnett@ijekanpa.eh','36.141.164.201','China','http://wo.tk/efa','five67',3908,8679),
('Mollie','Freeman','mollie.freeman@wa.bq','196.202.182.23','Macedonia','http://roj.tw/nijuggad','fill10',2439,41),
('Michael','Moss','michael.moss@fimesku.ni','234.231.201.225','Sri Lanka','http://tipce.uz/utasumubi','affect81',1768,19395),
('Rhoda','Lewis','rhoda.lewis@fub.ck','155.142.139.57','Finland','http://lijaw.ps/ci','put96',2396,2410),
('Myrtle','Martinez','myrtle.martinez@ukasow.mx','50.244.111.41','Brazil','http://kufubif.ky/jek','mysterious3',2398,17081),
('Polly','Hogan','polly.hogan@igubiin.pw','159.32.97.145','Nigeria','http://oza.bf/tuzaso','important44',1835,5679),
('Brandon','Palmer','brandon.palmer@ji.pw','21.107.215.214','Martinique','http://hunlezob.lr/nabe','dull93',4529,1996),
('Isabelle','Willis','isabelle.willis@jicap.io','190.34.42.241','France','http://kalhuboke.ca/igpamop','hunt61',1914,7111),
('Vincent','Franklin','vincent.franklin@haigu.me','182.64.215.123','Togo','http://adlutmo.md/dorotgi','parts96',4903,14408),
('Austin','Christensen','austin.christensen@vero.fj','186.252.85.222','Ukraine','http://de.com/wa','deal69',1398,16853),
('Fanny','Fleming','fanny.fleming@repmimib.kz','49.160.99.170','Papua New Guinea','http://gab.cl/gubjes','mission15',1190,11528),
('Frances','Olson','frances.olson@hol.sa','54.34.178.126','Portugal','http://luhfif.th/zebaco','copy2',2187,12364),
('John','Joseph','john.joseph@fivnijkir.jp','21.195.72.215','Namibia','http://ranwubco.nl/heejere','bark36',2026,8236),
('Hulda','Steele','hulda.steele@hegkoah.np','151.232.133.41','Malaysia','http://habidih.cg/gutop','citizen6',4999,19054),
('Callie','Strickland','callie.strickland@ka.pt','33.124.102.117','Swaziland','http://ej.bh/buge','headed40',1773,11027),
('Derrick','Wood','derrick.wood@ujbo.jp','118.102.159.190','Tanzania','http://poos.uk/arafeg','composed38',4216,18151),
('Derrick','Hill','derrick.hill@lagsuvim.lv','137.205.62.80','Montserrat','http://munuci.bo/me','master40',796,810),
('Brett','Berry','brett.berry@op.az','182.212.57.169','France','http://noho.ht/wosuzoro','memory66',2418,15806),
('Maria','Wheeler','maria.wheeler@pa.ao','96.103.91.101','American Samoa','http://opsol.cg/kacu','become74',320,16759),
('Alfred','Jordan','alfred.jordan@fed.gi','204.12.158.121','Greenland','http://daonu.il/ekwofgip','tell80',3010,11752),
('Lettie','Owens','lettie.owens@nibizak.lt','249.13.87.189','Jordan','http://zuktuz.id/mubpod','goose67',3763,13014),
('Bettie','Greene','bettie.greene@fed.aw','164.55.143.74','Venezuela','http://hejjes.tv/jijma','mountain51',3213,15932),
('Garrett','Olson','garrett.olson@jef.fm','195.229.194.35','Pakistan','http://liaf.gy/cemgewe','point47',1034,6397),
('Russell','Ramirez','russell.ramirez@tivcam.bn','180.187.101.156','Turks & Caicos Islands','http://awmor.bh/poc','did95',1010,10122),
('Roy','Young','roy.young@gib.mm','72.174.39.209','Haiti','http://ne.gd/fek','due11',926,2113),
('Warren','Griffith','warren.griffith@fefe.fo','218.153.33.11','Sudan','http://pi.cm/waf','exist51',4766,7250),
('Gilbert','Watts','gilbert.watts@sin.jp','115.64.61.17','Cyprus','http://pasocif.ax/cis','given20',3882,11007),
('Milton','Hanson','milton.hanson@biko.hn','218.214.162.69','Diego Garcia','http://kawku.rw/re','rocket72',4112,6377),
('Christina','Logan','christina.logan@futal.tc','195.227.248.161','Russia','http://ahubejek.ec/fuwrohwa','transportation46',4891,14945),
('Lou','Patton','lou.patton@sen.tr','165.121.110.137','Diego Garcia','http://netwos.cd/mirovur','sides11',3839,1807),
('Sallie','Rose','sallie.rose@hauvu.pw','91.162.11.225','Algeria','http://sopceiro.cw/jof','nails4',4464,12176),
('Ruby','Nichols','ruby.nichols@do.sn','17.239.39.101','Zambia','http://ma.hr/wiwon','drop14',271,17672),
('James','Bryan','james.bryan@goz.ng','212.237.223.156','Palau','http://ruliale.mw/ul','youth87',4823,7813),
('Amelia','Moss','amelia.moss@afobugu.vg','228.195.189.202','Montenegro','http://lidet.km/jepavla','national96',443,1522),
('Corey','Bowman','corey.bowman@uhafavris.sd','143.78.86.120','New Zealand','http://kif.sh/vi','fair6',3040,13745),
('Joe','Allen','joe.allen@iga.mc','224.139.195.188','Bulgaria','http://roukkoz.hm/zodecgoc','plane6',4213,16662),
('Amy','Sutton','amy.sutton@eduilfiw.bd','203.151.244.41','St. Vincent & Grenadines','http://posoz.uy/pazoboz','body26',4498,6575),
('Steven','Butler','steven.butler@lefo.ck','127.227.137.207','Solomon Islands','http://pucerpe.kp/lawoknud','military80',696,15551),
('Eunice','Anderson','eunice.anderson@jo.fo','42.91.5.123','Norway','http://ugediv.vn/za','job3',4030,18622),
('Phillip','Horton','phillip.horton@jasuh.ba','227.208.150.221','Gambia','http://zeguf.cg/ikfuv','parent43',4034,3702),
('Clayton','Vaughn','clayton.vaughn@emehtow.ma','143.32.72.50','Israel','http://hud.fk/raar','length17',4416,5546),
('Rena','Guzman','rena.guzman@giezi.mh','119.119.23.9','Saudi Arabia','http://borerba.la/bowtigce','tin4',2582,15665),
('Sean','Blair','sean.blair@noovnu.ss','122.0.238.98','Dominica','http://siheffeh.co.uk/wolel','greatest58',1519,999),
('Barbara','Stevens','barbara.stevens@uw.in','33.3.12.178','Afghanistan','http://ipo.ht/ituju','giving69',157,12562),
('Ernest','Bass','ernest.bass@edlinlu.aw','240.129.105.8','Ukraine','http://nil.uz/repu','test58',1506,11082),
('Eva','Hodges','eva.hodges@omitut.mt','145.206.70.27','Cape Verde','http://pif.tv/ugu','finger41',2292,13527),
('Ernest','Burton','ernest.burton@faszu.si','32.229.204.116','Iraq','http://girhe.mv/zu','income64',4378,13135),
('Rose','Thompson','rose.thompson@gaiji.in','49.138.111.197','Qatar','http://efje.ua/koevka','exact87',284,18116),
('Fred','Cannon','fred.cannon@zug.jp','55.145.205.187','Lesotho','http://udladsov.kg/dirin','bend32',2769,667),
('Susie','Gonzales','susie.gonzales@bu.ml','84.118.117.67','Vanuatu','http://deodtoc.vu/kir','month69',1431,19854),
('Katharine','Casey','katharine.casey@vavitjon.me','6.32.231.119','Haiti','http://ogoruac.to/cezvum','him35',450,15199),
('Garrett','Goodwin','garrett.goodwin@rudki.us','54.254.242.135','Brunei','http://kobfew.gt/ew','film49',133,3475),
('Harvey','Goodwin','harvey.goodwin@rabvu.la','121.112.188.78','Wallis & Futuna','http://edaulnu.ws/de','shelf71',1315,12553),
('Rosa','Pena','rosa.pena@ti.cx','254.247.185.61','Suriname','http://wihsewgo.kp/van','instant4',1244,9839),
('Lina','Matthews','lina.matthews@owvadipu.je','189.33.113.252','Bahrain','http://mitna.va/uhanug','orbit87',3598,2799),
('Arthur','Vega','arthur.vega@tepvifzow.lr','121.86.204.98','St. Pierre & Miquelon','http://va.my/toltadgan','leave71',3636,551),
('Elmer','King','elmer.king@bak.ps','111.19.197.194','Indonesia','http://geslo.tg/ne','mathematics18',1489,3866),
('Hunter','Stewart','hunter.stewart@av.ss','239.24.53.176','Macau SAR China','http://lov.jo/assuja','ruler44',4813,4457),
('Bernice','Bryant','bernice.bryant@ijiedo.sy','11.26.177.43','Chad','http://soldagku.as/gaf','breathing18',4662,14102),
('Steven','Flowers','steven.flowers@doba.cn','190.177.192.105','Bahrain','http://il.ne/votsud','history34',2902,12528),
('Ian','Sharp','ian.sharp@at.rw','220.32.72.135','Slovakia','http://reekpet.io/tepmu','dog46',728,1578),
('Marie','Torres','marie.torres@ujovan.ss','132.203.229.7','Oman','http://ke.ug/ci','she59',50,14628),
('Joel','Cain','joel.cain@oda.tt','66.14.240.222','Nigeria','http://dadgite.nu/iva','pull93',1789,1477),
('Jayden','Simpson','jayden.simpson@ji.bs','125.210.151.225','Micronesia','http://les.bt/cig','excitement75',2028,6627),
('Alvin','Flowers','alvin.flowers@liviwe.pw','119.46.168.127','Bahrain','http://ser.bf/wefig','require7',2051,971),
('Miguel','Hart','miguel.hart@teowosi.mk','41.126.176.43','Portugal','http://joniwifer.dk/min','course91',2002,4739),
('Jeffery','Morgan','jeffery.morgan@ijbezen.am','141.98.113.114','North Korea','http://wollimen.vu/beg','say76',998,3998),
('Connor','Hawkins','connor.hawkins@zus.ie','205.50.229.177','Guam','http://usifaud.bv/hunfunat','tell93',3212,14988),
('Ollie','Powers','ollie.powers@nuvwir.bs','136.97.124.138','Mongolia','http://darcit.pl/fiunjeh','house90',2403,6915),
('Corey','Lopez','corey.lopez@oco.eu','70.142.122.114','Greece','http://fo.sz/luzvese','twenty21',3455,19701),
('Addie','Murray','addie.murray@atu.kw','17.136.238.1','Mauritania','http://fi.al/towkuwa','present29',1601,12332),
('Nancy','Love','nancy.love@lomfogvu.cy','60.25.227.67','Moldova','http://tu.pf/liwa','river48',3968,2188),
('Lilly','Gill','lilly.gill@turno.bb','234.2.248.133','Costa Rica','http://cioduim.mu/copi','pond33',2384,18514),
('Josephine','Montgomery','josephine.montgomery@tor.bo','111.241.30.74','Bosnia & Herzegovina','http://ufe.us/emojewor','graph99',2140,377),
('Isabella','Rose','isabella.rose@zo.ch','170.38.229.100','Cambodia','http://mehziki.lc/sosoje','rhyme14',2248,13446),
('Jerome','Jordan','jerome.jordan@kulkeok.tc','144.5.215.231','Uganda','http://lif.sm/gupfi','baseball70',1251,8944),
('Ollie','Henry','ollie.henry@fakon.pg','170.34.101.194','Australia','http://je.eu/tevif','father94',3176,7676),
('Lottie','Cain','lottie.cain@pafap.hr','196.106.117.146','Brazil','http://weivo.bg/gobtap','control53',3999,8306),
('Benjamin','Price','benjamin.price@if.hm','46.105.106.208','China','http://fe.gq/ubneupu','value70',79,5031),
('Richard','Henderson','richard.henderson@pif.cl','165.35.169.93','Micronesia','http://ozoocunez.gr/uvibo','smile17',1967,7950),
('Alejandro','Mendoza','alejandro.mendoza@fa.ke','200.181.19.14','North Korea','http://tenzito.ao/defubanur','physical53',4952,18995),
('Joe','Riley','joe.riley@lu.tk','16.199.54.24','Cuba','http://ce.mk/rogpuape','pipe22',1231,5449),
('Josie','Parks','josie.parks@kacip.net','66.205.243.211','Belgium','http://pesge.pa/emci','mountain36',3091,18400),
('Hester','Neal','hester.neal@fazawes.uz','10.243.9.68','Serbia','http://noreru.az/gavzi','engine26',3068,13784),
('Georgia','Gardner','georgia.gardner@zi.bh','167.85.173.74','Denmark','http://icikauho.an/maridmen','dish61',2785,665),
('Louis','Allison','louis.allison@riumwe.yt','175.92.42.102','Oman','http://ratgot.com/tu','lead67',1828,5414),
('Maria','Lopez','maria.lopez@ci.org','205.83.239.116','Guinea-Bissau','http://juc.cr/si','piece62',2933,19097),
('Gregory','Flores','gregory.flores@pizta.gm','165.114.235.43','Senegal','http://toabfo.bv/ecakifcim','nervous65',2179,11221),
('Cordelia','Marsh','cordelia.marsh@wuccorgiv.mx','227.182.237.168','Guadeloupe','http://vohagec.pw/usaro','tall51',3424,3420),
('Jean','Stanley','jean.stanley@me.bf','120.215.218.99','Switzerland','http://sabheh.an/bihuor','over69',1637,4470),
('Wesley','Clayton','wesley.clayton@foboze.so','165.24.140.134','Uganda','http://so.sz/relhi','each15',2353,5602),
('Cole','Bush','cole.bush@ku.sk','47.201.24.59','Japan','http://va.sz/ne','ago36',662,19574),
('Jeremiah','Rose','jeremiah.rose@hoden.hm','214.127.224.26','Kiribati','http://onevi.gs/dijowob','split75',4569,9374),
('Millie','Becker','millie.becker@ohoge.jo','149.1.232.129','Ceuta & Melilla','http://ut.mo/pirbav','apartment94',2872,12135),
('Betty','Salazar','betty.salazar@nafi.re','10.212.225.208','Antigua & Barbuda','http://apohah.gov/izgafsu','branch96',2350,11105),
('Dylan','Cobb','dylan.cobb@faen.yt','49.246.110.22','United Arab Emirates','http://jewov.gg/ke','pleasant91',220,19481),
('Randall','Pearson','randall.pearson@kohartu.pt','204.84.200.197','Wallis & Futuna','http://og.ph/kizfo','taste10',577,15011),
('Rosie','Ramos','rosie.ramos@ki.cu','93.82.224.250','Brazil','http://awega.nr/nodwidop','fully39',4144,10534),
('Alfred','Lopez','alfred.lopez@likzis.ni','206.43.126.116','Guyana','http://sewavle.su/vilkitdiw','twelve55',1267,11337),
('Edna','Dennis','edna.dennis@cih.kr','147.119.252.211','Ireland','http://oruta.ro/me','minerals23',3084,3518),
('Gertrude','Campbell','gertrude.campbell@sacvewud.py','144.126.97.254','Zambia','http://pucenhad.ye/cecup','tank29',3545,4771),
('Mabelle','Yates','mabelle.yates@gas.mv','249.18.79.35','Papua New Guinea','http://ik.lc/zubjacgi','rough26',505,11246),
('Eula','Morton','eula.morton@cohe.edu','120.42.197.182','Réunion','http://re.nf/kaolu','native19',1249,16273),
('Alan','Moreno','alan.moreno@osup.lt','28.95.188.13','Iceland','http://kobtibfuw.pa/uj','darkness59',3520,7426),
('Norman','Miller','norman.miller@edra.pr','220.222.175.149','Sri Lanka','http://mu.aw/nok','mistake90',2529,3185),
('Mittie','Andrews','mittie.andrews@gofzamar.ua','92.83.149.107','Australia','http://zennut.nz/mes','refused94',375,15022),
('Catherine','Walsh','catherine.walsh@upezu.tc','226.176.245.233','Philippines','http://rul.ml/ipfagun','agree68',3602,13179),
('Lou','Munoz','lou.munoz@pemewwos.do','47.222.122.25','El Salvador','http://towag.to/jasri','yesterday16',4200,10354),
('Gilbert','Walsh','gilbert.walsh@mib.tv','129.150.244.165','Czech Republic','http://iwtag.ad/dukopaaja','lose73',4011,10527),
('Larry','Ruiz','larry.ruiz@megpidfu.eg','65.196.128.192','Dominica','http://aswar.sl/dizju','walk18',2839,15188),
('Susan','Steele','susan.steele@bafiz.sk','227.71.234.232','Antigua & Barbuda','http://gutnokew.bo/hatuse','metal57',2323,12492),
('Verna','Cross','verna.cross@mis.bm','103.185.131.120','Netherlands','http://do.tc/jon','middle90',2247,12728),
('Andre','Benson','andre.benson@fuzra.cv','94.199.30.53','Brazil','http://cazahab.ne/udmi','log60',4504,1455),
('Cecilia','Maxwell','cecilia.maxwell@ov.mm','190.242.1.135','Luxembourg','http://ob.kr/vuis','command91',2418,11378),
('Leo','Jacobs','leo.jacobs@tojaruc.cv','104.127.34.145','Ethiopia','http://kiluzo.lk/fafnebuw','root47',389,2579),
('Willie','Barrett','willie.barrett@tunavi.im','125.228.92.36','Cambodia','http://rugi.cx/niw','harbor97',2901,479),
('Verna','West','verna.west@mavkavu.sc','22.15.198.62','Cocos (Keeling) Islands','http://wiifu.hm/ewvihic','natural34',1834,15609),
('Mina','Hill','mina.hill@nakinuma.kw','131.231.113.193','Philippines','http://oc.az/esleg','morning8',1406,4667),
('Walter','Ramirez','walter.ramirez@mo.jo','179.24.185.31','Comoros','http://ruwmovgew.vn/lamvesgo','buried49',2891,9247),
('Mabelle','McDonald','mabelle.mcdonald@taw.lt','230.202.146.118','Micronesia','http://ra.su/nebohakul','which86',4278,9923),
('Jorge','Johnson','jorge.johnson@halugzuc.us','110.161.103.162','Ireland','http://soadileg.uy/bo','becoming65',313,1821),
('Ethan','Mathis','ethan.mathis@fop.sk','27.129.110.154','Suriname','http://pislemva.lt/bujboep','hurry46',1452,19810),
('Emma','Ross','emma.ross@fe.es','52.106.63.95','Slovenia','http://poic.tm/neri','announced42',104,11662),
('Sally','Wagner','sally.wagner@wiva.ar','12.253.246.6','Luxembourg','http://bew.mk/dabus','officer91',4043,65),
('Mittie','Thornton','mittie.thornton@raebco.nu','125.245.2.144','Cayman Islands','http://lu.aw/zohi','dust18',2151,13342),
('Beulah','Boyd','beulah.boyd@pa.kr','92.31.119.116','Samoa','http://wo.nr/nifnap','instrument100',219,10258),
('Bernice','Martinez','bernice.martinez@jineh.dz','22.57.112.13','Belgium','http://senveuge.mc/oradop','dish88',4710,13574),
('Sallie','Norton','sallie.norton@naf.cu','214.188.27.134','Azerbaijan','http://mut.uy/noh','image91',2331,13834),
('Seth','Nguyen','seth.nguyen@he.gl','194.121.0.210','Guinea-Bissau','http://juwkulpi.ms/tumsobruj','various46',2124,4180),
('Jordan','Barton','jordan.barton@em.eh','77.10.245.203','Venezuela','http://wocetuh.tm/siimufit','volume6',4330,5612),
('Rachel','McCoy','rachel.mccoy@welupner.cr','3.244.195.46','Zimbabwe','http://ed.na/ko','say15',55,17306),
('Don','Norman','don.norman@ve.ni','235.154.11.155','Wallis & Futuna','http://wow.om/weuwu','track79',4241,18231),
('Sophia','Hayes','sophia.hayes@ganpomri.pa','154.211.115.9','Sri Lanka','http://fuvtor.sd/moc','attempt68',1906,5965),
('Jeanette','Terry','jeanette.terry@dacuvi.za','146.192.53.236','Kenya','http://jebfo.ck/unhero','serious76',1440,16494),
('Bessie','Weaver','bessie.weaver@hibalbe.pa','112.116.173.15','Guyana','http://rivmek.pw/egruv','cotton100',4261,5691),
('Fannie','Martinez','fannie.martinez@rafu.bb','174.221.128.122','El Salvador','http://fa.cz/cestev','what10',3786,18777),
('Isaac','Wagner','isaac.wagner@kokosta.it','138.108.69.218','St. Barthélemy','http://amzi.ie/orico','island62',482,15826),
('Belle','Murphy','belle.murphy@kedeku.pf','96.125.251.136','Tunisia','http://fohen.kw/ovitum','satisfied9',4032,1724),
('Hilda','Campbell','hilda.campbell@pi.sj','49.220.82.214','Northern Mariana Islands','http://zihbapap.cl/zev','feel8',1067,19598),
('Nancy','Potter','nancy.potter@hi.gn','191.226.219.33','Anguilla','http://ru.org/zienomus','quarter63',2906,12853),
('Luella','Lloyd','luella.lloyd@nuzal.sd','91.15.251.173','Papua New Guinea','http://el.bg/ucbof','pony98',4312,6303),
('Seth','Holland','seth.holland@ruceta.tv','79.22.184.9','Bolivia','http://wu.my/ote','failed26',3794,7027),
('Myra','Vaughn','myra.vaughn@dubip.tl','122.211.88.147','Bosnia & Herzegovina','http://ji.pt/irahew','anyone71',2340,10816),
('Hallie','Santos','hallie.santos@onrifnir.lb','225.39.76.65','Marshall Islands','http://danu.jp/goslizdi','failed77',4687,191),
('Delia','Duncan','delia.duncan@pefros.ve','13.250.114.234','Denmark','http://ne.mq/meguhki','crack87',4820,2240),
('Marie','White','marie.white@odlug.ck','51.89.108.83','Pakistan','http://bo.io/ojufur','loud100',3776,19206),
('Jorge','Robertson','jorge.robertson@fu.de','130.217.33.228','Chad','http://fog.ca/wet','necessary70',4910,16506),
('Adelaide','Gilbert','adelaide.gilbert@ribbew.vi','219.47.244.52','Mexico','http://wuufi.ee/se','chart29',4049,13226),
('Don','Barnett','don.barnett@hifkev.py','218.180.103.120','Hong Kong SAR China','http://recer.az/pelfut','struggle100',2065,19274),
('Mable','Castro','mable.castro@pog.com','233.63.104.34','Åland Islands','http://kin.md/mo','last39',4353,15403),
('Phoebe','Rogers','phoebe.rogers@zerop.by','68.47.35.3','Estonia','http://jizdijis.mn/jon','build60',3821,16699),
('Bettie','Day','bettie.day@ertoduz.kh','62.49.194.121','Kenya','http://jeghussu.ss/fal','double50',2992,6032),
('Jack','Butler','jack.butler@nuw.mz','81.192.156.215','Christmas Island','http://viv.pr/gijda','master78',2347,10259),
('Hester','Colon','hester.colon@weofgut.np','179.42.118.242','Guinea','http://gu.ps/zeza','art55',2127,3894),
('Cora','Howard','cora.howard@ova.nr','4.99.181.225','United Kingdom','http://ecowawil.gs/fewomoz','sweet8',1395,17435),
('Lucile','Robbins','lucile.robbins@nedi.cd','89.125.57.75','Kosovo','http://zur.fm/mu','examine42',2347,19764),
('Harry','Byrd','harry.byrd@lul.pg','138.232.149.92','Nicaragua','http://durasi.pe/bairi','to70',3712,995),
('Ada','Harrison','ada.harrison@ile.ci','209.57.145.221','Burkina Faso','http://sumif.au/emica','sun61',238,7470),
('Douglas','Alexander','douglas.alexander@eweutu.mc','109.87.66.13','Trinidad & Tobago','http://pigi.us/tadkezo','conversation11',3822,8172),
('Kenneth','Graves','kenneth.graves@taot.io','249.145.22.219','Estonia','http://dicum.np/meag','cave72',1340,8317),
('Ida','Parker','ida.parker@ijlo.al','186.62.240.71','U.S. Outlying Islands','http://jenravco.gf/lu','tomorrow2',3582,17690),
('Gavin','Wade','gavin.wade@ci.bq','176.213.241.171','Cape Verde','http://tufalotom.tc/bubvi','burn37',947,1517),
('Elijah','Hammond','elijah.hammond@woc.sr','99.231.85.136','Canary Islands','http://lab.np/bojno','nobody65',1834,12119),
('Estelle','Foster','estelle.foster@mo.no','106.39.115.198','Kyrgyzstan','http://javibec.kz/cocu','parent63',3987,13383),
('Dora','Payne','dora.payne@miwasve.tt','215.17.244.26','Gibraltar','http://kutekfa.me/je','congress84',1666,9263),
('Nellie','Holland','nellie.holland@tu.vc','223.121.198.98','United Arab Emirates','http://gowog.nu/ji','say48',534,1331),
('Jack','Griffith','jack.griffith@guiv.cn','246.71.245.157','Bangladesh','http://merew.th/aj','progress37',2581,3845),
('Olive','Watkins','olive.watkins@erbu.mv','216.62.238.146','Kenya','http://vov.tf/ofovawu','needed71',2976,16155),
('Johanna','Ball','johanna.ball@ujeguz.cd','205.41.46.200','Ascension Island','http://wizduf.er/ta','string97',4315,13641),
('Carl','Parker','carl.parker@wolu.co.uk','240.249.1.157','Cocos (Keeling) Islands','http://ror.ni/wuoteici','aloud67',4328,9905),
('Patrick','Stanley','patrick.stanley@wog.lu','93.216.73.44','Afghanistan','http://oj.lr/jilipme','while96',3526,15727),
('Carolyn','McDaniel','carolyn.mcdaniel@acvudka.kz','203.5.50.199','Bahamas','http://peidesoz.co.uk/elonoj','room94',758,15127),
('Manuel','Black','manuel.black@ca.sl','95.122.24.118','Anguilla','http://jiwni.fr/bezozik','read74',2587,16725),
('John','Hampton','john.hampton@so.ph','75.167.38.2','Tanzania','http://ugogut.gy/ijiok','trip71',1802,6469),
('Scott','Hicks','scott.hicks@fe.to','28.196.23.105','Sri Lanka','http://cuwozuhu.sd/lufbijpi','question67',4438,7830),
('Cornelia','Riley','cornelia.riley@kuk.is','175.70.225.191','Tuvalu','http://ladgiziti.ve/ros','volume58',4957,18025),
('Ethan','Dunn','ethan.dunn@ede.lv','87.198.66.15','Lithuania','http://los.fi/athaog','tall70',2617,16487),
('Rhoda','Nash','rhoda.nash@oka.re','195.189.204.8','Armenia','http://likbabo.cx/ujej','fifty90',4773,18076),
('Susie','Ward','susie.ward@sapo.ss','162.50.123.192','Mauritius','http://lopad.iq/vunig','deeply79',2269,9107),
('Dustin','Holmes','dustin.holmes@ig.gw','50.74.252.243','Nicaragua','http://enweas.pm/wif','package52',2667,9599),
('Lee','Knight','lee.knight@kepbunep.cl','24.17.235.208','Saudi Arabia','http://zaruz.ar/pobloloj','broken13',1977,10500),
('Phoebe','Paul','phoebe.paul@nejedil.fi','174.96.240.101','Diego Garcia','http://unziil.sl/fal','tail94',2996,17823),
('Beatrice','Jordan','beatrice.jordan@jozmorlah.cc','218.234.45.242','Kosovo','http://su.et/em','flat4',445,4943),
('Willie','Santiago','willie.santiago@rokura.tm','84.178.34.47','Romania','http://zelikbe.ms/fic','shore67',2172,5819),
('Laura','Payne','laura.payne@secite.vu','92.214.141.207','Madagascar','http://liijuw.ug/ub','terrible22',4209,11380),
('Ralph','Carlson','ralph.carlson@kojli.nl','23.59.227.70','Cameroon','http://opisel.yt/kitim','secret67',3046,18191),
('Larry','Morales','larry.morales@dupiema.tk','174.142.230.103','Georgia','http://hem.py/enizab','apple7',242,15758),
('Randall','Curtis','randall.curtis@lin.sy','15.229.223.105','Tajikistan','http://lebsif.ck/wu','tiny71',4808,17069),
('Gabriel','Gomez','gabriel.gomez@ori.ba','139.13.151.229','Senegal','http://reomvo.cf/sokfe','word2',2511,12894),
('Marcus','Warner','marcus.warner@pupek.sh','101.34.125.193','Antarctica','http://ekwuece.gd/fuj','lonely78',4731,14532),
('Ollie','Chapman','ollie.chapman@huwleleh.bv','191.102.245.210','French Guiana','http://vud.mv/okzaci','bat76',2194,13109),
('Adele','Griffin','adele.griffin@fu.rs','68.149.168.48','Ethiopia','http://uta.is/vu','solar90',1248,9862),
('Bernard','Lowe','bernard.lowe@fez.ec','20.178.37.187','Chad','http://va.mh/jom','make70',4070,7691),
('Lola','Chapman','lola.chapman@gu.bs','73.203.32.118','Panama','http://rebmad.om/wonogihi','today63',3498,12585),
('Florence','Beck','florence.beck@ema.na','175.126.224.100','Zimbabwe','http://wekun.pn/ekacagdot','next86',1501,18673),
('Josephine','Bridges','josephine.bridges@soidlut.nf','209.233.176.231','Bahrain','http://kuawuto.mq/icuidialu','weather22',4208,4556),
('Terry','Richards','terry.richards@bepe.gw','182.82.146.60','Gibraltar','http://asolar.ru/jib','lead80',1375,3158),
('Jose','Osborne','jose.osborne@tuv.it','108.150.12.159','French Southern Territories','http://cewubib.so/metfij','package39',108,3068),
('Abbie','Norman','abbie.norman@tebla.bs','253.90.77.114','Mexico','http://mak.li/capiwave','cheese4',4464,5042),
('Sophia','Andrews','sophia.andrews@bubius.kw','173.244.75.155','Equatorial Guinea','http://nauro.sc/jekaes','bound82',4998,10948),
('Ophelia','Zimmerman','ophelia.zimmerman@hota.hu','247.167.89.208','Jamaica','http://ehece.zm/takara','owner63',4999,4502),
('Keith','Carpenter','keith.carpenter@ahwizler.lv','170.139.236.13','Mayotte','http://sokzewpe.gov/oj','unusual58',3446,7965),
('Jeremy','Moran','jeremy.moran@cev.pl','214.192.137.130','Peru','http://gamza.jm/fivpor','within7',2623,13953),
('Ida','Waters','ida.waters@lisugo.dk','218.196.3.179','Eritrea','http://nivodrus.cd/uw','usually80',3052,1996),
('Iva','Davis','iva.davis@sig.vu','65.154.18.96','St. Pierre & Miquelon','http://ze.sy/kucoha','card19',4999,1529),
('Scott','Price','scott.price@diheb.sy','247.133.165.129','Central African Republic','http://imkop.zw/ipiubumi','yes50',297,246),
('Arthur','Cole','arthur.cole@ze.gt','1.112.85.2','South Africa','http://oh.bq/nez','bell99',3936,464),
('Max','McKinney','max.mckinney@zokduce.td','169.118.251.47','Kosovo','http://jubuzo.iq/fos','barn21',2396,3314),
('Michael','Simmons','michael.simmons@caeg.an','50.123.121.54','Marshall Islands','http://pewfewej.sn/maj','send14',3644,6148),
('Max','Collins','max.collins@pi.bq','68.125.147.167','South Sudan','http://atead.sx/avlituma','common51',3343,14138),
('Verna','Bowman','verna.bowman@evosin.bm','166.44.83.185','Mayotte','http://efotozuz.do/wor','peace31',4683,12238),
('Marvin','Simmons','marvin.simmons@udizibpe.ss','164.99.72.11','Papua New Guinea','http://osidi.zm/naso','garden45',1322,4759),
('Hannah','Jacobs','hannah.jacobs@oro.sx','73.167.79.151','Equatorial Guinea','http://asakos.ru/mofpihi','pain87',3597,18934),
('Floyd','Richardson','floyd.richardson@gug.jo','65.230.238.112','Iraq','http://vaj.ki/ziklibha','goose6',3068,3378),
('Helena','Gross','helena.gross@ridzeg.gf','73.80.82.6','Puerto Rico','http://wefci.sa/gehhowsam','alone7',1571,7491),
('Elizabeth','Norris','elizabeth.norris@eha.lk','200.41.88.52','Georgia','http://momalo.mq/gewum','inside72',4212,15006),
('Bradley','Bradley','bradley.bradley@orvatgew.md','135.245.142.219','Uruguay','http://suijven.dj/ab','acres47',1386,16248),
('Stanley','Powell','stanley.powell@togefi.mz','14.20.114.80','Taiwan','http://ne.gl/relo','turn30',2578,9369),
('Ricky','Austin','ricky.austin@ce.bz','109.5.44.113','Poland','http://fovali.kr/ikje','previous94',4520,461),
('Alexander','Baker','alexander.baker@dodeca.va','194.31.15.173','Palestinian Territories','http://enjaj.ee/kip','seed34',392,18664),
('Marvin','Mitchell','marvin.mitchell@atunutaju.vg','145.120.153.23','Zambia','http://ikama.gh/ni','fast52',1144,17398),
('Nellie','Harrington','nellie.harrington@jo.pg','191.74.230.203','Guadeloupe','http://ta.mr/gan','reader57',4255,4886),
('Winifred','Cummings','winifred.cummings@di.lc','74.82.147.206','Comoros','http://junvidpij.je/jez','only86',2095,11504),
('Jackson','Frank','jackson.frank@rovhuhig.kw','49.243.193.137','Anguilla','http://vo.al/racuce','brain69',1399,18041),
('Sally','Boone','sally.boone@nikfod.ky','129.236.246.30','Vanuatu','http://ved.pk/ir','bat74',4972,7709),
('Erik','Robertson','erik.robertson@ruzag.bs','202.108.27.200','Chad','http://nuk.ax/rol','orbit83',712,8718),
('Leila','Shaw','leila.shaw@ahrer.iq','246.75.13.225','Liberia','http://rocos.it/nowuhit','strip94',3033,10631),
('Patrick','Carter','patrick.carter@orokeg.fi','62.234.173.164','Falkland Islands','http://ibocuvel.cc/jose','gentle24',1372,17516),
('Kevin','Byrd','kevin.byrd@tiwilaes.th','207.87.235.87','Gibraltar','http://tat.sv/mup','skin16',2474,19040),
('Troy','Ross','troy.ross@gog.am','165.233.187.24','Tonga','http://zu.cu/ad','edge85',30,16279);

-- 1. Listar los id de los usuarios que tengan la letra s
select id from usuarios where id ilike '%s%';

-- 2. listar los nombre de los usuarios
select nombre from usuarios;

-- 3. Listar el usuario de los usuarios
select usuario from usuarios;

-- 4. Mostrar usuarios
select * from usuarios;

-- 5. Ingresar datos a otra tabla
insert into credenciales(UserName, contrasena, user_rol)
select usuario, 'password' as contraseña, 'Usuario' as usuario from usuarios; 

-- 6. Mostrar los datos que se agregaron anteriormente de una tabla a otra
select * from credenciales;

-- 7. Mostrar los integrantes, que tienen una restricción de edad
select * from integrante;

-- 8. saber la cantidad de caracteres
select length('0123456789abcdefghijklmnopqrstuvwxyz.!');

-- 9. crear un numero aleatorio pero entero con el rango de los caracteres
select round(random()* 40);

-- 10. Crear un texto de manera aleatoria pero siguiendo los caracteres que estan dentro del substring.
select string_agg(substring('0123456789abcdefghijklmnopqrstuvwxyz.!', round(random()* 40)::integer, 1), '')from generate_series(1,5);
-- en esta parte usamos el generate_series como un delimitador de carcateres. pero tambien se podria usar desp del integer, en vez de  1 la cantidad q uno quiere

-- 11. Crear un texto de 5 caracteres sin el generate_series
select string_agg(substring('0123456789abcdefghijklmnopqrstuvwxyz.!', round(random()* 40)::integer, 5),'');

-- 12. genera 10 filas en donde el dato empieza desde 20 y disminue 1
select generate_series(20,10,-1);

-- 13. generar 10 filas con datos de 1 a 20 con salto de 3
select generate_series(1,10,3);

-- 14. Mostrar las contraseñas que se crearon conl afunción
select * from credenciales;

-- 15. no mostrar las contraseñas, ocultarlas porq no todos los usuarios no deberian ver las contraseñas de los demás
select sha512(contrasena::bytea), UserName from credenciales;

-- 16. Mostrar al usuario con la contraseña qkzxh7 tipo bytea y que tenga el nombre de dear46
select * from credenciales where sha512('qkzxh7'::bytea) =contrasena_sha  and UserName='dear46';

create function generate_ramdon_password(long INTEGER)
returns text as $$ 
declare password text;
BEGIN
	password = (SELECT string_agg(SUBSTRING('0123456789abcdefghijklmnñopqrstuvwxyz$.!', round(random() * length('0123456789abcdefghijklmnñopqrstuvwxyz$.!'))::integer, 1), '') as NewPassword 
	FROM generate_series(0, long));
	return password;
END;
$$ LANGUAGE plpgsql;

-- prueba
select generate_ramdon_password(1);
-------------

-------------
-- 2. Función de suma con parametros
create function sumar(n1 integer, n2 integer)
returns integer as $$
begin
	return n1 + n2;
end;
$$ language plpgsql;

-- Probar la función
select sumar(10,5);
---------------