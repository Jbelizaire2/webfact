/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 101002
 Source Host           : 192.168.10.10:3306
 Source Schema         : web_factura

 Target Server Type    : MySQL
 Target Server Version : 101002
 File Encoding         : 65001

 Date: 10/02/2023 20:59:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for commune
-- ----------------------------
DROP TABLE IF EXISTS `commune`;
CREATE TABLE `commune`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `region_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `code` int NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  `province_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_E2E2D1EE98260155`(`region_id`) USING BTREE,
  INDEX `IDX_E2E2D1EEE946114A`(`province_id`) USING BTREE,
  CONSTRAINT `FK_E2E2D1EE98260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_E2E2D1EEE946114A` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16306 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commune
-- ----------------------------
INSERT INTO `commune` VALUES (1101, 1, 'Iquique', -20.2355, -70.13947, 1201, NULL, 11);
INSERT INTO `commune` VALUES (1107, 1, 'Alto Hospicio', -20.27121, -70.10123, 1211, NULL, 11);
INSERT INTO `commune` VALUES (1401, 1, 'Pozo Almonte', -20.25153, -69.78227, 1204, NULL, 14);
INSERT INTO `commune` VALUES (1402, 1, 'Camina', -19.27694, -69.38691, 1208, NULL, 14);
INSERT INTO `commune` VALUES (1403, 1, 'Colchane', -19.49698, -68.50828, 1210, NULL, 14);
INSERT INTO `commune` VALUES (1404, 1, 'Huara', -19.98934, -69.77089, 1206, NULL, 14);
INSERT INTO `commune` VALUES (1405, 1, 'Pica', -20.4863, -69.32109, 1203, NULL, 14);
INSERT INTO `commune` VALUES (2101, 2, 'Antofagasta', -23.64639, -70.39796, 2201, NULL, 21);
INSERT INTO `commune` VALUES (2102, 2, 'Mejillones', -23.10145, -70.4544, 2203, NULL, 21);
INSERT INTO `commune` VALUES (2103, 2, 'Sierra Gorda', -23.32142, -69.80398, 2206, NULL, 21);
INSERT INTO `commune` VALUES (2104, 2, 'Taltal', -25.40293, -70.47889, 2202, NULL, 21);
INSERT INTO `commune` VALUES (2201, 2, 'Calama', -22.45359, -68.92944, 2301, NULL, 22);
INSERT INTO `commune` VALUES (2202, 2, 'Ollague', -21.22062, -68.2519, 2302, NULL, 22);
INSERT INTO `commune` VALUES (2203, 2, 'San Pedro de Atacama', -22.90713, -68.19864, 2303, NULL, 22);
INSERT INTO `commune` VALUES (2301, 2, 'Tocopilla', -22.08587, -70.18901, 2101, NULL, 23);
INSERT INTO `commune` VALUES (2302, 2, 'Maria Elena', -22.33816, -69.66166, 2103, NULL, 23);
INSERT INTO `commune` VALUES (3101, 3, 'Copiapo', -27.36648, -70.33227, 3201, NULL, 31);
INSERT INTO `commune` VALUES (3102, 3, 'Caldera', -27.06309, -70.82576, 3202, NULL, 31);
INSERT INTO `commune` VALUES (3103, 3, 'Tierra Amarilla', -27.46263, -70.26132, 3203, NULL, 31);
INSERT INTO `commune` VALUES (3201, 3, 'Chanaral', -26.34349, -70.6117, 3101, NULL, 32);
INSERT INTO `commune` VALUES (3202, 3, 'Diego de Almagro', -26.3942, -70.03202, 3102, NULL, 32);
INSERT INTO `commune` VALUES (3301, 3, 'Vallenar', -28.57928, -70.74533, 3301, NULL, 33);
INSERT INTO `commune` VALUES (3302, 3, 'Alto del Carmen', -28.75611, -70.48677, 3304, NULL, 33);
INSERT INTO `commune` VALUES (3303, 3, 'Freirina', -28.50502, -71.07496, 3302, NULL, 33);
INSERT INTO `commune` VALUES (3304, 3, 'Huasco', -28.46134, -71.21431, 3303, NULL, 33);
INSERT INTO `commune` VALUES (4101, 4, 'La Serena', -29.90269, -71.25198, 4101, NULL, 41);
INSERT INTO `commune` VALUES (4102, 4, 'Coquimbo', -29.95324, -71.3378, 4103, NULL, 41);
INSERT INTO `commune` VALUES (4103, 4, 'Andacollo', -30.23138, -71.08072, 4104, NULL, 41);
INSERT INTO `commune` VALUES (4104, 4, 'La Higuera', -29.50777, -71.20988, 4102, NULL, 41);
INSERT INTO `commune` VALUES (4105, 4, 'Paiguano', -30.02748, -70.51279, 4106, NULL, 41);
INSERT INTO `commune` VALUES (4106, 4, 'Vicuña', -30.03341, -70.71114, 4105, NULL, 41);
INSERT INTO `commune` VALUES (4201, 4, 'Illapel', -31.62393, -71.16162, 4301, NULL, 42);
INSERT INTO `commune` VALUES (4202, 4, 'Canela', -31.39914, -71.45997, 4304, NULL, 42);
INSERT INTO `commune` VALUES (4203, 4, 'Los Vilos', -31.91238, -71.50576, 4303, NULL, 42);
INSERT INTO `commune` VALUES (4204, 4, 'Salamanca', -31.77039, -70.96561, 4302, NULL, 42);
INSERT INTO `commune` VALUES (4301, 4, 'Ovalle', -30.60317, -71.20295, 4201, NULL, 43);
INSERT INTO `commune` VALUES (4302, 4, 'Combarbala', -31.17801, -70.99979, 4205, NULL, 43);
INSERT INTO `commune` VALUES (4303, 4, 'Monte Patria', -30.68821, -70.95382, 4203, NULL, 43);
INSERT INTO `commune` VALUES (4304, 4, 'Punitaqui', -30.82666, -71.25998, 4204, NULL, 43);
INSERT INTO `commune` VALUES (4305, 4, 'Rio Hurtado', -30.41578, -70.92425, 4206, NULL, 43);
INSERT INTO `commune` VALUES (5101, 5, 'Valparaiso', -33.04554, -71.61949, 5301, NULL, 51);
INSERT INTO `commune` VALUES (5102, 5, 'Casablanca', -33.31362, -71.40723, 5305, NULL, 51);
INSERT INTO `commune` VALUES (5103, 5, 'Concon', -32.93066, -71.53448, 5309, NULL, 51);
INSERT INTO `commune` VALUES (5104, 5, 'Juan Fernandez', -26.3214, -79.9722, 5308, NULL, 51);
INSERT INTO `commune` VALUES (5105, 5, 'Puchuncavi', -32.7233, -71.41626, 5307, NULL, 51);
INSERT INTO `commune` VALUES (5107, 5, 'Quintero', -32.7842, -71.53027, 5306, NULL, 51);
INSERT INTO `commune` VALUES (5109, 5, 'Viña del Mar', -33.00978, -71.54811, 5302, NULL, 51);
INSERT INTO `commune` VALUES (5201, 5, 'Isla de Pascua', -27.0954, -109.572, 5101, NULL, 52);
INSERT INTO `commune` VALUES (5301, 5, 'Los Andes', -32.83372, -70.59817, 5701, NULL, 53);
INSERT INTO `commune` VALUES (5302, 5, 'Calle Larga', -32.9463, -70.54194, 5702, NULL, 53);
INSERT INTO `commune` VALUES (5303, 5, 'Rinconada', -32.84268, -70.6842, 5704, NULL, 53);
INSERT INTO `commune` VALUES (5304, 5, 'San Esteban', -32.80344, -70.58617, 5703, NULL, 53);
INSERT INTO `commune` VALUES (5401, 5, 'La Ligua', -32.44606, -71.22761, 5201, NULL, 54);
INSERT INTO `commune` VALUES (5402, 5, 'Cabildo', -32.42586, -71.06789, 5203, NULL, 54);
INSERT INTO `commune` VALUES (5403, 5, 'Papudo', -32.50385, -71.44223, 5205, NULL, 54);
INSERT INTO `commune` VALUES (5404, 5, 'Petorca', -32.24821, -70.93661, 5202, NULL, 54);
INSERT INTO `commune` VALUES (5405, 5, 'Zapallar', -32.54938, -71.45437, 5204, NULL, 54);
INSERT INTO `commune` VALUES (5501, 5, 'Quillota', -32.88555, -71.24919, 5501, NULL, 55);
INSERT INTO `commune` VALUES (5502, 5, 'Calera', -32.78638, -71.20301, 5504, NULL, 55);
INSERT INTO `commune` VALUES (5503, 5, 'Hijuelas', -32.85448, -71.08609, 5503, NULL, 55);
INSERT INTO `commune` VALUES (5504, 5, 'La Cruz', -32.81961, -71.23831, 5505, NULL, 55);
INSERT INTO `commune` VALUES (5506, 5, 'Nogales', -32.73489, -71.20374, 5502, NULL, 55);
INSERT INTO `commune` VALUES (5601, 5, 'San Antonio', -33.5904, -71.60409, 5401, NULL, 56);
INSERT INTO `commune` VALUES (5602, 5, 'Algarrobo', -33.36241, -71.66857, 5406, NULL, 56);
INSERT INTO `commune` VALUES (5603, 5, 'Cartagena', -33.54575, -71.59641, 5403, NULL, 56);
INSERT INTO `commune` VALUES (5604, 5, 'El Quisco', -33.39634, -71.68864, 5405, NULL, 56);
INSERT INTO `commune` VALUES (5605, 5, 'El Tabo', -33.45065, -71.66598, 5404, NULL, 56);
INSERT INTO `commune` VALUES (5606, 5, 'Santo Domingo', -33.63704, -71.62531, 5402, NULL, 56);
INSERT INTO `commune` VALUES (5701, 5, 'San Felipe', -32.7507, -70.72505, 5601, NULL, 57);
INSERT INTO `commune` VALUES (5702, 5, 'Catemu', -32.77348, -70.96559, 5603, NULL, 57);
INSERT INTO `commune` VALUES (5703, 5, 'Llaillay', -32.83349, -70.95859, 5606, NULL, 57);
INSERT INTO `commune` VALUES (5704, 5, 'Panquehue', -32.81306, -70.92, 5602, NULL, 57);
INSERT INTO `commune` VALUES (5705, 5, 'Putaendo', -32.62183, -70.71504, 5604, NULL, 57);
INSERT INTO `commune` VALUES (5706, 5, 'Santa Maria', -32.75652, -70.65819, 5605, NULL, 57);
INSERT INTO `commune` VALUES (5801, 5, 'Quilpue', -33.04982, -71.44154, 5304, NULL, 58);
INSERT INTO `commune` VALUES (5802, 5, 'Limache', -32.99515, -71.26752, 5506, NULL, 58);
INSERT INTO `commune` VALUES (5803, 5, 'Olmue', -32.99202, -71.17638, 5507, NULL, 58);
INSERT INTO `commune` VALUES (5804, 5, 'Villa Alemana', -33.04276, -71.37583, 5303, NULL, 58);
INSERT INTO `commune` VALUES (6101, 6, 'Rancagua', -34.17026, -70.74071, 6101, NULL, 61);
INSERT INTO `commune` VALUES (6102, 6, 'Codegua', -34.03342, -70.66768, 6107, NULL, 61);
INSERT INTO `commune` VALUES (6103, 6, 'Coinco', -34.26597, -70.9548, 6116, NULL, 61);
INSERT INTO `commune` VALUES (6104, 6, 'Coltauco', -34.28995, -71.07781, 6106, NULL, 61);
INSERT INTO `commune` VALUES (6105, 6, 'Donihue', -34.2202, -70.95991, 6105, NULL, 61);
INSERT INTO `commune` VALUES (6106, 6, 'Graneros', -34.0595, -70.72671, 6103, NULL, 61);
INSERT INTO `commune` VALUES (6107, 6, 'Las Cabras', -34.29025, -71.30948, 6109, NULL, 61);
INSERT INTO `commune` VALUES (6108, 6, 'Machali', -34.17967, -70.64894, 6102, NULL, 61);
INSERT INTO `commune` VALUES (6109, 6, 'Malloa', -34.43961, -70.94499, 6115, NULL, 61);
INSERT INTO `commune` VALUES (6110, 6, 'San Francisco de Mostazal', -33.95164, -70.56753, 6104, NULL, 61);
INSERT INTO `commune` VALUES (6111, 6, 'Olivar', -34.20327, -70.75564, 6114, NULL, 61);
INSERT INTO `commune` VALUES (6112, 6, 'Peumo', -34.3944, -71.16373, 6108, NULL, 61);
INSERT INTO `commune` VALUES (6113, 6, 'Pichidegua', -34.35206, -71.28272, 6111, NULL, 61);
INSERT INTO `commune` VALUES (6114, 6, 'Quinta de Tilcoco', -34.35202, -70.9657, 6117, NULL, 61);
INSERT INTO `commune` VALUES (6115, 6, 'Rengo', -34.39939, -70.85894, 6112, NULL, 61);
INSERT INTO `commune` VALUES (6116, 6, 'Requinoa', -34.27984, -70.81328, 6113, NULL, 61);
INSERT INTO `commune` VALUES (6117, 6, 'San Vicente', -34.47384, -71.12222, 6110, NULL, 61);
INSERT INTO `commune` VALUES (6201, 6, 'Pichilemu', -34.38437, -72.01279, 6301, NULL, 62);
INSERT INTO `commune` VALUES (6202, 6, 'La Estrella', -34.20185, -71.65138, 6304, NULL, 62);
INSERT INTO `commune` VALUES (6203, 6, 'Litueche', -34.11805, -71.72424, 6303, NULL, 62);
INSERT INTO `commune` VALUES (6204, 6, 'Marchihue', -34.39277, -71.61622, 6305, NULL, 62);
INSERT INTO `commune` VALUES (6205, 6, 'Navidad', -33.89221, -71.79245, 6302, NULL, 62);
INSERT INTO `commune` VALUES (6206, 6, 'Paredones', -34.64502, -71.89887, 6306, NULL, 62);
INSERT INTO `commune` VALUES (6301, 6, 'San Fernando', -34.58386, -70.98905, 6201, NULL, 63);
INSERT INTO `commune` VALUES (6302, 6, 'Chepica', -34.72517, -71.2733, 6209, NULL, 63);
INSERT INTO `commune` VALUES (6303, 6, 'Chimbarongo', -34.70131, -71.03751, 6202, NULL, 63);
INSERT INTO `commune` VALUES (6304, 6, 'Lolol', -34.72296, -71.64395, 6206, NULL, 63);
INSERT INTO `commune` VALUES (6305, 6, 'Nancagua', -34.64549, -71.19968, 6203, NULL, 63);
INSERT INTO `commune` VALUES (6306, 6, 'Palmilla', -34.52944, -71.3902, 6207, NULL, 63);
INSERT INTO `commune` VALUES (6307, 6, 'Peralillo', -34.47296, -71.47758, 6208, NULL, 63);
INSERT INTO `commune` VALUES (6308, 6, 'Placilla', -34.61447, -71.08541, 6204, NULL, 63);
INSERT INTO `commune` VALUES (6309, 6, 'Pumanque', -34.59056, -71.6906, 6214, NULL, 63);
INSERT INTO `commune` VALUES (6310, 6, 'Santa Cruz', -34.63374, -71.36418, 6205, NULL, 63);
INSERT INTO `commune` VALUES (7101, 7, 'Talca', -35.41772, -71.65834, 7201, NULL, 71);
INSERT INTO `commune` VALUES (7102, 7, 'Constitucion', -35.32618, -72.41761, 7208, NULL, 71);
INSERT INTO `commune` VALUES (7103, 7, 'Curepto', -35.09107, -72.01712, 7207, NULL, 71);
INSERT INTO `commune` VALUES (7104, 7, 'Empedrado', -35.55937, -72.29536, 7209, NULL, 71);
INSERT INTO `commune` VALUES (7105, 7, 'Maule', -35.4673, -71.7343, 7206, NULL, 71);
INSERT INTO `commune` VALUES (7106, 7, 'Pelarco', -35.38026, -71.44145, 7203, NULL, 71);
INSERT INTO `commune` VALUES (7107, 7, 'Pencahue', -35.39653, -71.79459, 7205, NULL, 71);
INSERT INTO `commune` VALUES (7108, 7, 'Rio Claro', -35.21623, -71.24688, 7204, NULL, 71);
INSERT INTO `commune` VALUES (7109, 7, 'San Clemente', -35.53636, -71.48029, 7202, NULL, 71);
INSERT INTO `commune` VALUES (7110, 7, 'San Rafael', -35.30404, -71.50603, 7210, NULL, 71);
INSERT INTO `commune` VALUES (7201, 7, 'Cauquenes', -35.96105, -72.31934, 7401, NULL, 72);
INSERT INTO `commune` VALUES (7202, 7, 'Chanco', -35.7897, -72.544, 7403, NULL, 72);
INSERT INTO `commune` VALUES (7203, 7, 'Pelluhue', -35.63581, -72.52818, 7402, NULL, 72);
INSERT INTO `commune` VALUES (7301, 7, 'Curico', -34.98534, -71.23933, 7101, NULL, 73);
INSERT INTO `commune` VALUES (7302, 7, 'Hualane', -34.974, -71.79858, 7107, NULL, 73);
INSERT INTO `commune` VALUES (7303, 7, 'Licanten', -34.98569, -71.98142, 7105, NULL, 73);
INSERT INTO `commune` VALUES (7304, 7, 'Molina', -35.1132, -71.27852, 7108, NULL, 73);
INSERT INTO `commune` VALUES (7305, 7, 'Rauco', -34.93549, -71.42417, 7104, NULL, 73);
INSERT INTO `commune` VALUES (7306, 7, 'Romeral', -34.95325, -71.1255, 7103, NULL, 73);
INSERT INTO `commune` VALUES (7307, 7, 'Sagrada Familia', -35.03254, -71.44776, 7109, NULL, 73);
INSERT INTO `commune` VALUES (7308, 7, 'Teno', -34.86518, -71.1633, 7102, NULL, 73);
INSERT INTO `commune` VALUES (7309, 7, 'Vichuquen', -34.88323, -71.99094, 7106, NULL, 73);
INSERT INTO `commune` VALUES (7401, 7, 'Linares', -35.84544, -71.59788, 7301, NULL, 74);
INSERT INTO `commune` VALUES (7402, 7, 'Colbun', -36.07169, -70.97959, 7303, NULL, 74);
INSERT INTO `commune` VALUES (7403, 7, 'Longavi', -35.96149, -71.68126, 7304, NULL, 74);
INSERT INTO `commune` VALUES (7404, 7, 'Parral', -36.13649, -71.82479, 7305, NULL, 74);
INSERT INTO `commune` VALUES (7405, 7, 'Retiro', -36.03217, -71.74769, 7306, NULL, 74);
INSERT INTO `commune` VALUES (7406, 7, 'San Javier', -35.59832, -71.73013, 7310, NULL, 74);
INSERT INTO `commune` VALUES (7407, 7, 'Villa Alegre', -35.67149, -71.73895, 7309, NULL, 74);
INSERT INTO `commune` VALUES (7408, 7, 'Yerbas Buenas', -35.68667, -71.57077, 7302, NULL, 74);
INSERT INTO `commune` VALUES (8101, 8, 'Concepcion', -36.82706, -73.05014, 8201, NULL, 81);
INSERT INTO `commune` VALUES (8102, 8, 'Coronel', -36.99956, -73.16807, 8207, NULL, 81);
INSERT INTO `commune` VALUES (8103, 8, 'Chiguayante', -36.917, -73.02877, 8211, NULL, 81);
INSERT INTO `commune` VALUES (8104, 8, 'Florida', -36.81737, -72.66429, 8204, NULL, 81);
INSERT INTO `commune` VALUES (8105, 8, 'Hualqui', -36.97044, -72.93418, 8203, NULL, 81);
INSERT INTO `commune` VALUES (8106, 8, 'Lota', -37.08938, -73.15351, 8208, NULL, 81);
INSERT INTO `commune` VALUES (8107, 8, 'Penco', -36.72726, -72.98393, 8202, NULL, 81);
INSERT INTO `commune` VALUES (8108, 8, 'San Pedro de la Paz', -36.83867, -73.11048, 8210, NULL, 81);
INSERT INTO `commune` VALUES (8109, 8, 'Santa Juana', -37.17141, -72.93975, 8209, NULL, 81);
INSERT INTO `commune` VALUES (8110, 8, 'Talcahuano', -36.71447, -73.11411, 8206, NULL, 81);
INSERT INTO `commune` VALUES (8111, 8, 'Tome', -36.61067, -72.958, 8205, NULL, 81);
INSERT INTO `commune` VALUES (8112, 8, 'Hualpen', -36.78536, -73.11054, 8212, NULL, 81);
INSERT INTO `commune` VALUES (8201, 8, 'Lebu', -37.61083, -73.64817, 8303, NULL, 82);
INSERT INTO `commune` VALUES (8202, 8, 'Arauco', -37.24048, -73.31409, 8301, NULL, 82);
INSERT INTO `commune` VALUES (8203, 8, 'Canete', -37.79777, -73.39371, 8305, NULL, 82);
INSERT INTO `commune` VALUES (8204, 8, 'Contulmo', -38.00567, -73.22983, 8306, NULL, 82);
INSERT INTO `commune` VALUES (8205, 8, 'Curanilahue', -37.47871, -73.33896, 8302, NULL, 82);
INSERT INTO `commune` VALUES (8206, 8, 'Los Alamos', -37.62209, -73.45914, 8304, NULL, 82);
INSERT INTO `commune` VALUES (8207, 8, 'Tirua', -38.24619, -73.47808, 8307, NULL, 82);
INSERT INTO `commune` VALUES (8301, 8, 'Los Angeles', -37.47076, -72.35166, 8401, NULL, 83);
INSERT INTO `commune` VALUES (8302, 8, 'Antuco', -37.35238, -71.54468, 8413, NULL, 83);
INSERT INTO `commune` VALUES (8303, 8, 'Cabrero', -37.02804, -72.40119, 8410, NULL, 83);
INSERT INTO `commune` VALUES (8304, 8, 'Laja', -37.27936, -72.70492, 8403, NULL, 83);
INSERT INTO `commune` VALUES (8305, 8, 'Mulchen', -37.71775, -72.23961, 8407, NULL, 83);
INSERT INTO `commune` VALUES (8306, 8, 'Nacimiento', -37.49844, -72.66878, 8405, NULL, 83);
INSERT INTO `commune` VALUES (8307, 8, 'Negrete', -37.58449, -72.53604, 8406, NULL, 83);
INSERT INTO `commune` VALUES (8308, 8, 'Quilaco', -37.67949, -71.99956, 8408, NULL, 83);
INSERT INTO `commune` VALUES (8309, 8, 'Quilleco', -37.46801, -71.98108, 8404, NULL, 83);
INSERT INTO `commune` VALUES (8310, 8, 'San Rosendo', -37.25745, -72.71944, 8411, NULL, 83);
INSERT INTO `commune` VALUES (8311, 8, 'Santa Barbara', -37.66315, -72.01885, 8402, NULL, 83);
INSERT INTO `commune` VALUES (8312, 8, 'Tucapel', -37.28649, -71.94275, 8412, NULL, 83);
INSERT INTO `commune` VALUES (8313, 8, 'Yumbel', -37.09197, -72.55926, 8409, NULL, 83);
INSERT INTO `commune` VALUES (8314, 8, 'Alto Biobio', -37.895, -71.60626, 8414, NULL, 83);
INSERT INTO `commune` VALUES (9101, 9, 'Temuco', -38.73681, -72.5975, 9201, NULL, 91);
INSERT INTO `commune` VALUES (9102, 9, 'Carahue', -38.71439, -73.16262, 9209, NULL, 91);
INSERT INTO `commune` VALUES (9103, 9, 'Cunco', -38.9281, -72.02704, 9204, NULL, 91);
INSERT INTO `commune` VALUES (9104, 9, 'Curarrehue', -39.34483, -71.53936, 9218, NULL, 91);
INSERT INTO `commune` VALUES (9105, 9, 'Freire', -38.95202, -72.62771, 9203, NULL, 91);
INSERT INTO `commune` VALUES (9106, 9, 'Galvarino', -38.40785, -72.78139, 9207, NULL, 91);
INSERT INTO `commune` VALUES (9107, 9, 'Gorbea', -39.09276, -72.67724, 9212, NULL, 91);
INSERT INTO `commune` VALUES (9108, 9, 'Lautaro', -38.53013, -72.43815, 9205, NULL, 91);
INSERT INTO `commune` VALUES (9109, 9, 'Loncoche', -39.35621, -72.6295, 9214, NULL, 91);
INSERT INTO `commune` VALUES (9110, 9, 'Melipeuco', -38.84783, -71.68964, 9217, NULL, 91);
INSERT INTO `commune` VALUES (9111, 9, 'Nueva Imperial', -38.73883, -72.95132, 9208, NULL, 91);
INSERT INTO `commune` VALUES (9112, 9, 'Padre las Casas', -38.75736, -72.59152, 9220, NULL, 91);
INSERT INTO `commune` VALUES (9113, 9, 'Perquenco', -38.41629, -72.37402, 9206, NULL, 91);
INSERT INTO `commune` VALUES (9114, 9, 'Pitrufquen', -38.98573, -72.63916, 9211, NULL, 91);
INSERT INTO `commune` VALUES (9115, 9, 'Pucon', -39.28163, -71.9604, 9216, NULL, 91);
INSERT INTO `commune` VALUES (9116, 9, 'Puerto Saavedra', -38.77176, -73.4016, 9210, NULL, 91);
INSERT INTO `commune` VALUES (9117, 9, 'Teodoro Schmidt', -38.98968, -73.09095, 9219, NULL, 91);
INSERT INTO `commune` VALUES (9118, 9, 'Tolten', -39.24825, -73.21316, 9213, NULL, 91);
INSERT INTO `commune` VALUES (9119, 9, 'Vilcun', -38.66528, -72.22244, 9202, NULL, 91);
INSERT INTO `commune` VALUES (9120, 9, 'Villarrica', -39.28924, -72.22711, 9215, NULL, 91);
INSERT INTO `commune` VALUES (9121, 9, 'Cholchol', -38.59515, -72.84315, 9221, NULL, 91);
INSERT INTO `commune` VALUES (9201, 9, 'Angol', -37.79782, -72.70869, 9101, NULL, 92);
INSERT INTO `commune` VALUES (9202, 9, 'Collipulli', -37.95152, -72.43342, 9105, NULL, 92);
INSERT INTO `commune` VALUES (9203, 9, 'Curacautin', -38.43718, -71.88799, 9110, NULL, 92);
INSERT INTO `commune` VALUES (9204, 9, 'Ercilla', -38.06022, -72.37208, 9106, NULL, 92);
INSERT INTO `commune` VALUES (9205, 9, 'Lonquimay', -38.47884, -71.23602, 9111, NULL, 92);
INSERT INTO `commune` VALUES (9206, 9, 'Los Sauces', -37.97764, -72.82945, 9103, NULL, 92);
INSERT INTO `commune` VALUES (9207, 9, 'Lumaco', -38.16213, -72.90202, 9108, NULL, 92);
INSERT INTO `commune` VALUES (9208, 9, 'Puren', -38.02986, -73.07082, 9102, NULL, 92);
INSERT INTO `commune` VALUES (9209, 9, 'Renaico', -37.66522, -72.58617, 9104, NULL, 92);
INSERT INTO `commune` VALUES (9210, 9, 'Traiguen', -38.24512, -72.66063, 9107, NULL, 92);
INSERT INTO `commune` VALUES (9211, 9, 'Victoria', -38.22792, -72.33194, 9109, NULL, 92);
INSERT INTO `commune` VALUES (10101, 10, 'Puerto Montt', -41.47184, -72.9396, 10301, NULL, 101);
INSERT INTO `commune` VALUES (10102, 10, 'Calbuco', -41.7621, -73.13114, 10309, NULL, 101);
INSERT INTO `commune` VALUES (10103, 10, 'Cochamo', -41.48599, -72.30383, 10302, NULL, 101);
INSERT INTO `commune` VALUES (10104, 10, 'Fresia', -41.14881, -73.42002, 10304, NULL, 101);
INSERT INTO `commune` VALUES (10105, 10, 'Frutillar', -41.12683, -73.02767, 10305, NULL, 101);
INSERT INTO `commune` VALUES (10106, 10, 'Los Muermos', -41.38837, -73.45962, 10308, NULL, 101);
INSERT INTO `commune` VALUES (10107, 10, 'Llanquihue', -41.25254, -73.00388, 10306, NULL, 101);
INSERT INTO `commune` VALUES (10108, 10, 'Maullin', -41.61527, -73.59328, 10307, NULL, 101);
INSERT INTO `commune` VALUES (10109, 10, 'Puerto Varas', -41.31783, -72.98271, 10303, NULL, 101);
INSERT INTO `commune` VALUES (10201, 10, 'Castro', -42.48242, -73.76427, 10401, NULL, 102);
INSERT INTO `commune` VALUES (10202, 10, 'Ancud', -41.86275, -73.82412, 10406, NULL, 102);
INSERT INTO `commune` VALUES (10203, 10, 'Chonchi', -42.61784, -73.76438, 10402, NULL, 102);
INSERT INTO `commune` VALUES (10204, 10, 'Curaco de Velez', -42.43792, -73.59573, 10410, NULL, 102);
INSERT INTO `commune` VALUES (10205, 10, 'Dalcahue', -42.37371, -73.65251, 10408, NULL, 102);
INSERT INTO `commune` VALUES (10206, 10, 'Puqueldon', -42.64054, -73.61116, 10405, NULL, 102);
INSERT INTO `commune` VALUES (10207, 10, 'Queilen', -42.94216, -73.4615, 10403, NULL, 102);
INSERT INTO `commune` VALUES (10208, 10, 'Quellon', -43.11317, -73.6142, 10404, NULL, 102);
INSERT INTO `commune` VALUES (10209, 10, 'Quemchi', -42.13624, -73.47556, 10407, NULL, 102);
INSERT INTO `commune` VALUES (10210, 10, 'Quinchao', -42.5099, -73.4337, 10415, NULL, 102);
INSERT INTO `commune` VALUES (10301, 10, 'Osorno', -40.57382, -73.13587, 10201, NULL, 103);
INSERT INTO `commune` VALUES (10302, 10, 'Puerto Octay', -40.97015, -72.88605, 10203, NULL, 103);
INSERT INTO `commune` VALUES (10303, 10, 'Purranque', -40.90742, -73.15758, 10206, NULL, 103);
INSERT INTO `commune` VALUES (10304, 10, 'Puyehue', -40.66731, -72.62975, 10204, NULL, 103);
INSERT INTO `commune` VALUES (10305, 10, 'Rio Negro', -40.79481, -73.21384, 10205, NULL, 103);
INSERT INTO `commune` VALUES (10306, 10, 'San Juan de la Costa', -40.5868, -73.5108, 10207, NULL, 103);
INSERT INTO `commune` VALUES (10307, 10, 'San Pablo', -40.40882, -73.01018, 10202, NULL, 103);
INSERT INTO `commune` VALUES (10401, 10, 'Chaiten', -42.9353, -72.6595, 10501, NULL, 104);
INSERT INTO `commune` VALUES (10402, 10, 'Futaleufu', -43.18953, -71.85879, 10503, NULL, 104);
INSERT INTO `commune` VALUES (10403, 10, 'Hualaihue', -41.95511, -72.44816, 10502, NULL, 104);
INSERT INTO `commune` VALUES (10404, 10, 'Palena', -43.61423, -71.86866, 10504, NULL, 104);
INSERT INTO `commune` VALUES (11101, 11, 'Coyhaique', -45.57021, -72.06755, 11401, NULL, 111);
INSERT INTO `commune` VALUES (11102, 11, 'Lago Verde', -44.64037, -71.71536, 11402, NULL, 111);
INSERT INTO `commune` VALUES (11201, 11, 'Aysen', -45.39414, -72.6919, 11101, NULL, 112);
INSERT INTO `commune` VALUES (11202, 11, 'Cisnes', -44.76314, -72.6615, 11102, NULL, 112);
INSERT INTO `commune` VALUES (11203, 11, 'Guaitecas', -43.88517, -73.76587, 11104, NULL, 112);
INSERT INTO `commune` VALUES (11301, 11, 'Cochrane', -47.26574, -72.54608, 11301, NULL, 113);
INSERT INTO `commune` VALUES (11302, 11, 'O?Higgins', -48.44729, -72.6084, 11302, NULL, 113);
INSERT INTO `commune` VALUES (11303, 11, 'Tortel', -48.03616, -74.14659, 11303, NULL, 113);
INSERT INTO `commune` VALUES (11401, 11, 'Chile Chico', -46.5443, -71.76697, 11201, NULL, 114);
INSERT INTO `commune` VALUES (11402, 11, 'Rio Ibanez', -46.2826, -71.92529, 11203, NULL, 114);
INSERT INTO `commune` VALUES (12101, 12, 'Punta Arenas', -53.16258, -70.9081, 12205, NULL, 121);
INSERT INTO `commune` VALUES (12102, 12, 'Laguna Blanca', -52.33617, -71.23744, 12206, NULL, 121);
INSERT INTO `commune` VALUES (12103, 12, 'Rio Verde', -52.62507, -71.45861, 12202, NULL, 121);
INSERT INTO `commune` VALUES (12104, 12, 'San Gregorio', -52.46547, -69.91806, 12204, NULL, 121);
INSERT INTO `commune` VALUES (12201, 12, 'Cabo de Hornos', -54.8934, -67.59211, 12401, NULL, 122);
INSERT INTO `commune` VALUES (12202, 12, 'Antartica', -53.26763, -70.35163, 0, NULL, 122);
INSERT INTO `commune` VALUES (12301, 12, 'Porvenir', -53.26763, -70.35163, 12301, NULL, 123);
INSERT INTO `commune` VALUES (12302, 12, 'Primavera', -52.80058, -69.42884, 12302, NULL, 123);
INSERT INTO `commune` VALUES (12303, 12, 'Timaukel', -54.16, -69.52991, 12304, NULL, 123);
INSERT INTO `commune` VALUES (12401, 12, 'Natales', -51.7307, -72.4936, 12101, NULL, 124);
INSERT INTO `commune` VALUES (12402, 12, 'Torres del Paine', -51.07465, -72.98753, 12103, NULL, 124);
INSERT INTO `commune` VALUES (13101, 13, 'Santiago Centro', -33.43788, -70.65053, 13101, NULL, 131);
INSERT INTO `commune` VALUES (13102, 13, 'Cerrillos', -33.50547, -70.72942, 14166, NULL, 131);
INSERT INTO `commune` VALUES (13103, 13, 'Cerro Navia', -33.43168, -70.73047, 14156, NULL, 131);
INSERT INTO `commune` VALUES (13104, 13, 'Conchali', -33.3936, -70.67289, 14127, NULL, 131);
INSERT INTO `commune` VALUES (13105, 13, 'El Bosque', -33.55521, -70.66869, 16165, NULL, 131);
INSERT INTO `commune` VALUES (13106, 13, 'Estacion Central', -33.45659, -70.70096, 14157, NULL, 131);
INSERT INTO `commune` VALUES (13107, 13, 'Huechuraba', -33.3915, -70.61891, 14158, NULL, 131);
INSERT INTO `commune` VALUES (13108, 13, 'Independencia', -33.40691, -70.66084, 13167, NULL, 131);
INSERT INTO `commune` VALUES (13109, 13, 'La Cisterna', -33.52625, -70.66146, 16110, NULL, 131);
INSERT INTO `commune` VALUES (13110, 13, 'La Florida', -33.52272, -70.59844, 15128, NULL, 131);
INSERT INTO `commune` VALUES (13111, 13, 'La Granja', -33.54589, -70.63045, 16131, NULL, 131);
INSERT INTO `commune` VALUES (13112, 13, 'La Pintana', -33.58132, -70.62915, 16154, NULL, 131);
INSERT INTO `commune` VALUES (13113, 13, 'La Reina', -33.44667, -70.5461, 15132, NULL, 131);
INSERT INTO `commune` VALUES (13114, 13, 'Las Condes', -33.41566, -70.59359, 15108, NULL, 131);
INSERT INTO `commune` VALUES (13115, 13, 'Lo Barnechea', -33.3609, -70.50941, 15161, NULL, 131);
INSERT INTO `commune` VALUES (13116, 13, 'Lo Espejo', -33.52046, -70.68967, 16164, NULL, 131);
INSERT INTO `commune` VALUES (13117, 13, 'Lo Prado', -33.44448, -70.72033, 14155, NULL, 131);
INSERT INTO `commune` VALUES (13118, 13, 'Macul', -33.48533, -70.5993, 15151, NULL, 131);
INSERT INTO `commune` VALUES (13119, 13, 'Maipu', -33.50979, -70.75642, 14109, NULL, 131);
INSERT INTO `commune` VALUES (13120, 13, 'Ñuñoa', -33.4552, -70.59374, 15105, NULL, 131);
INSERT INTO `commune` VALUES (13121, 13, 'Pedro Aguirre Cerda', -33.4913, -70.67539, 16162, NULL, 131);
INSERT INTO `commune` VALUES (13122, 13, 'Peñalolen', -33.47938, -70.5449, 15152, NULL, 131);
INSERT INTO `commune` VALUES (13123, 13, 'Providencia', -33.42778, -70.61723, 15103, NULL, 131);
INSERT INTO `commune` VALUES (13124, 13, 'Pudahuel', -33.44561, -70.75293, 14111, NULL, 131);
INSERT INTO `commune` VALUES (13125, 13, 'Quilicura', -33.36711, -70.74246, 14114, NULL, 131);
INSERT INTO `commune` VALUES (13126, 13, 'Quinta Normal', -33.42189, -70.69447, 14107, NULL, 131);
INSERT INTO `commune` VALUES (13127, 13, 'Recoleta', -33.42511, -70.64532, 13159, NULL, 131);
INSERT INTO `commune` VALUES (13128, 13, 'Renca', -33.40474, -70.70462, 14113, NULL, 131);
INSERT INTO `commune` VALUES (13129, 13, 'San Joaquin', -33.49603, -70.6284, 16163, NULL, 131);
INSERT INTO `commune` VALUES (13130, 13, 'San Miguel', -33.48611, -70.65026, 16106, NULL, 131);
INSERT INTO `commune` VALUES (13131, 13, 'San Ramon', -33.54148, -70.6424, 16153, NULL, 131);
INSERT INTO `commune` VALUES (13132, 13, 'Vitacura', -33.40187, -70.5962, 15160, NULL, 131);
INSERT INTO `commune` VALUES (13201, 13, 'Puente Alto', -33.60947, -70.57537, 16301, NULL, 132);
INSERT INTO `commune` VALUES (13202, 13, 'Pirque', -33.63546, -70.5727, 16302, NULL, 132);
INSERT INTO `commune` VALUES (13203, 13, 'San Jose de Maipo', -33.63503, -70.35049, 16303, NULL, 132);
INSERT INTO `commune` VALUES (13301, 13, 'Colina', -33.19317, -70.67089, 14201, NULL, 133);
INSERT INTO `commune` VALUES (13302, 13, 'Lampa', -33.23138, -70.80988, 14202, NULL, 133);
INSERT INTO `commune` VALUES (13303, 13, 'Tiltil', -33.13606, -70.80177, 14203, NULL, 133);
INSERT INTO `commune` VALUES (13401, 13, 'San Bernardo', -33.59234, -70.70449, 16401, NULL, 134);
INSERT INTO `commune` VALUES (13402, 13, 'Buin', -33.72827, -70.7405, 16403, NULL, 134);
INSERT INTO `commune` VALUES (13403, 13, 'Calera de Tango', -33.63318, -70.76005, 16402, NULL, 134);
INSERT INTO `commune` VALUES (13404, 13, 'Paine', -33.80128, -70.73753, 16404, NULL, 134);
INSERT INTO `commune` VALUES (13501, 13, 'Melipilla', -33.68631, -71.21716, 14601, NULL, 135);
INSERT INTO `commune` VALUES (13502, 13, 'Alhue', -34.02797, -71.09962, 14605, NULL, 135);
INSERT INTO `commune` VALUES (13503, 13, 'Curacavi', -33.40582, -71.13014, 14603, NULL, 135);
INSERT INTO `commune` VALUES (13504, 13, 'Maria Pinto', -33.49371, -71.2081, 14602, NULL, 135);
INSERT INTO `commune` VALUES (13505, 13, 'San Pedro', -33.8844, -71.46319, 14604, NULL, 135);
INSERT INTO `commune` VALUES (13601, 13, 'Talagante', -33.66453, -70.93028, 14501, NULL, 136);
INSERT INTO `commune` VALUES (13602, 13, 'El Monte', -33.67877, -70.98703, 14503, NULL, 136);
INSERT INTO `commune` VALUES (13603, 13, 'Isla de Maipo', -33.74612, -70.89955, 14502, NULL, 136);
INSERT INTO `commune` VALUES (13604, 13, 'Padre Hurtado', -33.56879, -70.80618, 14505, NULL, 136);
INSERT INTO `commune` VALUES (13605, 13, 'Penaflor', -33.60376, -70.87528, 14504, NULL, 136);
INSERT INTO `commune` VALUES (14101, 14, 'Valdivia', -39.81416, -73.24589, 10101, NULL, 141);
INSERT INTO `commune` VALUES (14102, 14, 'Corral', -39.89298, -73.41877, 10106, NULL, 141);
INSERT INTO `commune` VALUES (14103, 14, 'Lanco', -39.4501, -72.77711, 10103, NULL, 141);
INSERT INTO `commune` VALUES (14104, 14, 'Los Lagos', -39.85891, -72.81545, 10104, NULL, 141);
INSERT INTO `commune` VALUES (14105, 14, 'Mafil', -39.65993, -72.94305, 10107, NULL, 141);
INSERT INTO `commune` VALUES (14106, 14, 'Mariquina', -39.53575, -72.96317, 10102, NULL, 141);
INSERT INTO `commune` VALUES (14107, 14, 'Paillaco', -40.05969, -72.86628, 10110, NULL, 141);
INSERT INTO `commune` VALUES (14108, 14, 'Panguipulli', -39.64111, -72.33483, 10108, NULL, 141);
INSERT INTO `commune` VALUES (14201, 14, 'La Union', -40.28799, -73.07964, 10109, NULL, 142);
INSERT INTO `commune` VALUES (14202, 14, 'Futrono', -40.13173, -72.38135, 10105, NULL, 142);
INSERT INTO `commune` VALUES (14203, 14, 'Lago Ranco', -40.32095, -72.48251, 10112, NULL, 142);
INSERT INTO `commune` VALUES (14204, 14, 'Rio Bueno', -40.33047, -72.95565, 10111, NULL, 142);
INSERT INTO `commune` VALUES (15101, 15, 'Arica', -18.47512, -70.31598, 1101, NULL, 151);
INSERT INTO `commune` VALUES (15102, 15, 'Camarones', -19.1973, -70.26046, 1106, NULL, 151);
INSERT INTO `commune` VALUES (15201, 15, 'Putre', -18.19394, -69.55622, 1301, NULL, 152);
INSERT INTO `commune` VALUES (15202, 15, 'General Lagos', -17.76843, -69.71191, 1302, NULL, 152);
INSERT INTO `commune` VALUES (16101, 16, 'Chillan', -36.60666, -72.10326, 8101, NULL, 161);
INSERT INTO `commune` VALUES (16102, 16, 'Bulnes', -36.7388, -72.29721, 8113, NULL, 161);
INSERT INTO `commune` VALUES (16103, 16, 'Chillan Viejo', -36.62297, -72.13174, 8121, NULL, 161);
INSERT INTO `commune` VALUES (16104, 16, 'El Carmen', -36.89493, -72.02417, 8118, NULL, 161);
INSERT INTO `commune` VALUES (16105, 16, 'Pemuco', -36.97349, -72.09197, 8117, NULL, 161);
INSERT INTO `commune` VALUES (16106, 16, 'Pinto', -36.70184, -71.88839, 8102, NULL, 161);
INSERT INTO `commune` VALUES (16107, 16, 'Quillon', -36.73637, -72.46089, 8115, NULL, 161);
INSERT INTO `commune` VALUES (16108, 16, 'San Ignacio', -36.79721, -72.03297, 8114, NULL, 161);
INSERT INTO `commune` VALUES (16109, 16, 'Yungay', -37.1153, -72.01595, 8116, NULL, 161);
INSERT INTO `commune` VALUES (16201, 16, 'Quirihue', -36.27555, -72.53927, 8104, NULL, 162);
INSERT INTO `commune` VALUES (16202, 16, 'Cobquecura', -36.12684, -72.79354, 8107, NULL, 162);
INSERT INTO `commune` VALUES (16203, 16, 'Coelemu', -36.48122, -72.70259, 8120, NULL, 162);
INSERT INTO `commune` VALUES (16204, 16, 'Ninhue', -36.39151, -72.39575, 8105, NULL, 162);
INSERT INTO `commune` VALUES (16205, 16, 'Portezuelo', -36.52553, -72.42894, 8106, NULL, 162);
INSERT INTO `commune` VALUES (16206, 16, 'Ranquil', -36.62122, -72.60264, 8119, NULL, 162);
INSERT INTO `commune` VALUES (16207, 16, 'Treguaco', -36.4232, -72.66508, 8108, NULL, 162);
INSERT INTO `commune` VALUES (16301, 16, 'San Carlos', -36.42496, -71.95689, 8109, NULL, 163);
INSERT INTO `commune` VALUES (16302, 16, 'Coihueco', -36.62259, -71.83136, 8103, NULL, 163);
INSERT INTO `commune` VALUES (16303, 16, 'Niquen', -36.29757, -71.89534, 8110, NULL, 163);
INSERT INTO `commune` VALUES (16304, 16, 'San Fabian de Alico', -36.57066, -71.29414, 8111, NULL, 163);
INSERT INTO `commune` VALUES (16305, 16, 'San Nicolas', -36.50029, -72.20242, 8112, NULL, 163);

-- ----------------------------
-- Table structure for imagen
-- ----------------------------
DROP TABLE IF EXISTS `imagen`;
CREATE TABLE `imagen`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `archivo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL,
  `id_status` int NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `id_status`(`id_status`) USING BTREE,
  CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imagen
-- ----------------------------
INSERT INTO `imagen` VALUES (1, 'C Item 1', 'Descripción 2', 'Imagen_Item 1.jpg', NULL, NULL, 3, '2023-02-10 23:22:13', NULL);
INSERT INTO `imagen` VALUES (2, 'C Item 1', 'Descripción 2', 'Imagen_Item 1.jpg', 1, NULL, 2, '2023-02-09 19:43:34', NULL);
INSERT INTO `imagen` VALUES (3, 'C Item 1', 'Descripción 2', 'Imagen_Item 1.jpg', 1, NULL, 1, '2023-02-09 19:43:29', NULL);
INSERT INTO `imagen` VALUES (4, 'Item 2C', 'Descripción 2', 'Imagen_Item 2C.jpg', 1, NULL, 1, '2023-02-09 19:42:40', NULL);
INSERT INTO `imagen` VALUES (5, 'A Item 3', 'Descripción 3', 'Imagen_Item 3.png', 1, NULL, 3, '2023-02-10 23:21:51', NULL);
INSERT INTO `imagen` VALUES (78, 'Item 1', 'Description 1', NULL, 1, 'http://farm4.staticflickr.com/3764/10438039923_2ef6f68348_c.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (79, 'Item 2', 'Description 2', NULL, 1, 'http://www.officialpsds.com/images/stocks/ALLEY-stock1502.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (80, 'Item 3', 'Description 3', NULL, 1, 'https://www.google.com', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (81, 'Item 4', 'Description 4, <i>extra info</i>', NULL, 1, '', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (82, 'Item 5', 'Description 5', NULL, 1, 'http://ladymanson.com/Goodies/PS%20Tutorials/stock2.jpg', 3, '2023-02-10 23:26:41', NULL);
INSERT INTO `imagen` VALUES (83, 'Item 6, extra info', '<b>Description 6</b>', NULL, 1, 'http://fc01.deviantart.net/fs17/f/2007/129/7/4/Stock_032__by_enchanted_stock.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (84, 'Item 7', 'Description 7', NULL, 1, 'http://www.rubberdragon.com/website-design/44/content/just-in-time-stock.png?1290605562', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (85, 'This is a longer description that should wrap arround or broken of with ellipsis', 'Description 8', NULL, 1, 'http://www.gwp.co.uk/wp-content/uploads/2012/10/jit-case-delivery1.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (86, 'Item 9', 'Description 9', NULL, 1, 'http://fc00.deviantart.net/fs70/i/2011/217/a/0/field_panorama_stock_5_by_f3rd4-d45kgfp.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (87, 'Item 10\nExtra line 1\nExtra line 2\nExtra line 3', 'Description 10', NULL, 1, 'https://www.google.nl', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (88, 'Item 11', 'Description 11', NULL, 1, 'https://iopa.cl/paginaweb/public/uploads/images/1584360626.png', 3, '2023-02-10 23:24:35', NULL);
INSERT INTO `imagen` VALUES (89, 'Item 12', 'Description 12', NULL, 1, 'http://comps.canstockphoto.com/can-stock-photo_csp9177473.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (90, 'Item 13', 'Description 13', NULL, 1, 'http://farm4.staticflickr.com/3770/10379608353_cb362676b_b.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (91, 'Item 14, \"extra data\"', 'Description 14', NULL, 1, 'http://www.rubberdragon.com/website-design/44/content/just-in-time-stock.png?1290605562', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (92, 'Item 15', 'Description 15', NULL, 1, '', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (93, 'Item 16', 'Description 16', NULL, 1, 'http://farm4.staticflickr.com/3789/10437199943_8f6476cef1.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (94, 'Item 17', 'Description 17', NULL, 1, '', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (95, 'Item 18', 'Description 18', NULL, 1, 'http://comps.canstockphoto.com/can-stock-photo_csp9177473.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (96, 'Item 19', 'Description 19', NULL, 1, 'https://www.google.nl/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&docid=vp47OjPgb8jYjM&tbnid=mB4KC2XedUiDgM:&ved=0CAUQjRw&url=http%3A%2F%2Fwww.naturestocklibrary.com%2F&ei=O8pjUs3_MIbI0QXUnIDIAw&bvm=bv.54934254,d.d2k&psig=AFQjCNHp_WiQTk5MfZ8JliMxj6JYTc206w&ust=1382357938513870', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (97, 'Item 20', 'Description 20', NULL, 1, 'http://www.officialpsds.com/images/stocks/ALLEY-stock1502.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (98, 'Item 21', 'Description 21', NULL, 1, 'https://www.google.com', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (99, 'Item 22', 'Description 22', NULL, 1, '', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (100, 'Item 23', 'Description 23', NULL, 1, 'http://comps.canstockphoto.com/can-stock-photo_csp3928973.jpg', 1, '2023-02-09 22:06:49', NULL);
INSERT INTO `imagen` VALUES (101, 'Item 24', 'Description 24', NULL, 1, '', 2, '2023-02-09 22:08:05', NULL);

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `rut` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `id_status` int NULL DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` int NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city_cod` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `date_of_birth` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_51E5B69BAD145DBA`(`rut`) USING BTREE,
  INDEX `persona_id_status`(`id_status`) USING BTREE,
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18110 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES (1, 'Juslain', 'Belizaire', '260920006', 'Femenino', 1, 'hlain2000@gmail.com', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `persona` VALUES (18109, 'Woosedade', 'Exavier', '262006026', 'Femenino', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `region_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_4ADAD40B98260155`(`region_id`) USING BTREE,
  CONSTRAINT `FK_4ADAD40B98260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (11, 1, 'Iquique', NULL);
INSERT INTO `province` VALUES (14, 1, 'Tamarugal', NULL);
INSERT INTO `province` VALUES (21, 2, 'Antofagasta', NULL);
INSERT INTO `province` VALUES (22, 2, 'El Loa', NULL);
INSERT INTO `province` VALUES (23, 2, 'Tocopilla', NULL);
INSERT INTO `province` VALUES (31, 3, 'Copiapó', NULL);
INSERT INTO `province` VALUES (32, 3, 'Chañaral', NULL);
INSERT INTO `province` VALUES (33, 3, 'Huasco', NULL);
INSERT INTO `province` VALUES (41, 4, 'Elqui', NULL);
INSERT INTO `province` VALUES (42, 4, 'Choapa', NULL);
INSERT INTO `province` VALUES (43, 4, 'Limarí', NULL);
INSERT INTO `province` VALUES (51, 5, 'Valparaíso', NULL);
INSERT INTO `province` VALUES (52, 5, 'Isla de Pascua', NULL);
INSERT INTO `province` VALUES (53, 5, 'Los Andes', NULL);
INSERT INTO `province` VALUES (54, 5, 'Petorca', NULL);
INSERT INTO `province` VALUES (55, 5, 'Quillota', NULL);
INSERT INTO `province` VALUES (56, 5, 'San Antonio', NULL);
INSERT INTO `province` VALUES (57, 5, 'San Felipe de Aconcagua', NULL);
INSERT INTO `province` VALUES (58, 5, 'Marga Marga', NULL);
INSERT INTO `province` VALUES (61, 6, 'Cachapoal', NULL);
INSERT INTO `province` VALUES (62, 6, 'Cardenal Caro', NULL);
INSERT INTO `province` VALUES (63, 6, 'Colchagua', NULL);
INSERT INTO `province` VALUES (71, 7, 'Talca', NULL);
INSERT INTO `province` VALUES (72, 7, 'Cauquenes', NULL);
INSERT INTO `province` VALUES (73, 7, 'Curicó', NULL);
INSERT INTO `province` VALUES (74, 7, 'Linares', NULL);
INSERT INTO `province` VALUES (81, 8, 'Concepción', NULL);
INSERT INTO `province` VALUES (82, 8, 'Arauco', NULL);
INSERT INTO `province` VALUES (83, 8, 'Biobío', NULL);
INSERT INTO `province` VALUES (84, 8, 'Ñuble', NULL);
INSERT INTO `province` VALUES (91, 9, 'Cautín', NULL);
INSERT INTO `province` VALUES (92, 9, 'Malleco', NULL);
INSERT INTO `province` VALUES (101, 10, 'Llanquihue', NULL);
INSERT INTO `province` VALUES (102, 10, 'Chiloé', NULL);
INSERT INTO `province` VALUES (103, 10, 'Osorno', NULL);
INSERT INTO `province` VALUES (104, 10, 'Palena', NULL);
INSERT INTO `province` VALUES (111, 11, 'Coyhaique', NULL);
INSERT INTO `province` VALUES (112, 11, 'Aysén', NULL);
INSERT INTO `province` VALUES (113, 11, 'Capitán Prat', NULL);
INSERT INTO `province` VALUES (114, 11, 'General Carrera', NULL);
INSERT INTO `province` VALUES (121, 12, 'Magallanes', NULL);
INSERT INTO `province` VALUES (122, 12, 'Antártica Chilena', NULL);
INSERT INTO `province` VALUES (123, 12, 'Tierra del Fuego', NULL);
INSERT INTO `province` VALUES (124, 12, 'Última Esperanza', NULL);
INSERT INTO `province` VALUES (131, 13, 'Santiago de Chile', NULL);
INSERT INTO `province` VALUES (132, 13, 'Cordillera', NULL);
INSERT INTO `province` VALUES (133, 13, 'Chacabuco', NULL);
INSERT INTO `province` VALUES (134, 13, 'Maipo', NULL);
INSERT INTO `province` VALUES (135, 13, 'Melipilla', NULL);
INSERT INTO `province` VALUES (136, 13, 'Talagante', NULL);
INSERT INTO `province` VALUES (141, 14, 'Valdivia', NULL);
INSERT INTO `province` VALUES (142, 14, 'Ranco', NULL);
INSERT INTO `province` VALUES (151, 15, 'Arica', NULL);
INSERT INTO `province` VALUES (152, 15, 'Parinacota', NULL);
INSERT INTO `province` VALUES (161, 16, 'Diguillín', NULL);
INSERT INTO `province` VALUES (162, 16, 'Itata', NULL);
INSERT INTO `province` VALUES (163, 16, 'Punilla', NULL);

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deletedAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, 'Tarapacá', NULL);
INSERT INTO `region` VALUES (2, 'Antofagasta', NULL);
INSERT INTO `region` VALUES (3, 'Atacama', NULL);
INSERT INTO `region` VALUES (4, 'Coquimbo', NULL);
INSERT INTO `region` VALUES (5, 'Valparaíso', NULL);
INSERT INTO `region` VALUES (6, 'Libertador Gral. Bernardo O’Higgins', NULL);
INSERT INTO `region` VALUES (7, 'Maule', NULL);
INSERT INTO `region` VALUES (8, 'Bío-Bío', NULL);
INSERT INTO `region` VALUES (9, 'La Araucanía', NULL);
INSERT INTO `region` VALUES (10, 'Los Lagos', NULL);
INSERT INTO `region` VALUES (11, 'Aysén del Gral. Carlos Ibáñez del Campo', NULL);
INSERT INTO `region` VALUES (12, 'Magallanes y La Antártica Chilena', NULL);
INSERT INTO `region` VALUES (13, 'Metropolitana de Santiago', NULL);
INSERT INTO `region` VALUES (14, 'Los Ríos', NULL);
INSERT INTO `region` VALUES (15, 'Arica y Parinacota', NULL);
INSERT INTO `region` VALUES (16, 'Ñuble', NULL);

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `id_status` int NULL DEFAULT NULL,
  `name_public` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rol_id_status`(`id_status`) USING BTREE,
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'ROLE_ADMIN', 1, 'Administrador');
INSERT INTO `rol` VALUES (2, 'ROLE_USER', 1, 'Usuario');
INSERT INTO `rol` VALUES (3, 'ROLE_SUPER_ADMIN', 1, 'Super Administrador');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'vigente');
INSERT INTO `status` VALUES (2, 'eliminado');
INSERT INTO `status` VALUES (3, 'Aprobado');
INSERT INTO `status` VALUES (4, 'cerrada');
INSERT INTO `status` VALUES (5, 'revisado');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `date_created` datetime(0) NULL DEFAULT NULL,
  `date_deleted` datetime(0) NULL DEFAULT NULL,
  `id_status` int NULL DEFAULT NULL,
  `id_persona` int NULL DEFAULT NULL,
  `id_rol` int NULL DEFAULT NULL,
  `date_last_login` datetime(0) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `api_token` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_status`(`id_status`) USING BTREE,
  INDEX `user_id_rol`(`id_rol`) USING BTREE,
  INDEX `user_persona`(`id_persona`) USING BTREE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'jbelizaire', '$2y$13$by.flKay1rnWpfFDYdIKGePFrZkdhDHr0cv9ZBQ5dlMs4HNdpddoO', '2021-07-07 13:48:02', NULL, 1, 1, 1, NULL, NULL, 'PX7mMMwoqPFs8Qf0rCt0P4xyYAxSMvwZ6cbyzFlgGi9Z8Zf3K0bt36rt0mta');
INSERT INTO `user` VALUES (2, 'wexavier', '$2y$13$iOylnR6/7Q1OikcLKMIz6.LJQDUmiZRefi2CYcA/nuEuNjqqftngK', '2023-02-08 17:55:08', NULL, 1, 18109, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id_user` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_user`, `id_rol`) USING BTREE,
  INDEX `IDX_54FCD59F6B3CA4B`(`id_user`) USING BTREE,
  INDEX `IDX_54FCD59F90F1D76D`(`id_rol`) USING BTREE,
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1);
INSERT INTO `user_roles` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
