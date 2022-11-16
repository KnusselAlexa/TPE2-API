-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2022 a las 20:41:26
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_herramientasferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `email`, `password`) VALUES
(1, 'alexaknussel@gmail.com', '$2a$12$9AQ4EFalylgzeTQN.EIbQeRHK8CqC1OLgYnkBqRWAnFrvwoThnrP6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `precio` double NOT NULL,
  `descripcion` text NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `precio`, `descripcion`, `stock`, `id_categoria_fk`) VALUES
(4, 'Tenaza forjada armador', 4290, 'Forjada en acero Cr-Mo. El temple por inducción en los filos, les brinda un alto grado de dureza y durabilidad, mientras que en el cuerpo la dureza disminuye para darle flexibilidad al uso. Ideal para: cortar y atar. Recomendadas para armar encofrados.', 24, 2),
(5, 'Tenaza forjada carpintero', 3870, 'Forjada en acero Cr-Mo. El temple por inducción en los filos, les brinda un alto grado de dureza y durabilidad, mientras que en el cuerpo la dureza disminuye para darle flexibilidad al uso. Ideal para: cortar y atar. ', 18, 2),
(6, 'Set de 6 mechas tres puntas', 3480, 'Con filos de corte lateral. Contiene 6 mechas: 5x85mm - 6x90mm - 8x110mm - 10x120mm - 12x140mm - 14x160mm. Ideal para: maderas fibrosas, laminadas, blandas y semiduras', 19, 3),
(7, 'Set de 6 mechas planas', 4182, 'Fabricadas en acero de alto carbono, templadas y revenidas. Contenido 6 Mechas: 1/4” - 5/16” - 3/8” - 1/2” - 3/4” - 1”. Ideales para: maderas blandas y semiduras.', 7, 3),
(9, 'Set de 6 mechas helicoidales rapidas', 9230, 'Con aleta de fresado y calibración de agujero. Especiales para taladro eléctrico. Contiene 6 mechas: 3/8” Corta - 1/4” Larga - 5/16” Larga - 3/8” Larga - 7/16” Larga - 1/2” Larga. Ideal para: maderas blandas y semiduras.', 8, 3),
(10, 'Tijera de poda forjada', 4062, 'Forjada en aceros especiales, con terminación en esmalte negro y mangos recubiertos en PVC. La precisión de su fabricación ofrece filos durables con cortes precisos y limpios.', 29, 4),
(11, 'Tijera de poda estampada con yuque', 3605, 'Estampada en aceros especiales. Mangos de polipropileno cómodos y seguros. Filos duraderos. Liviana y eficiente', 21, 4),
(12, 'Tijera de poda con mangos de chapa', 3874, 'Fabricadas en acero de alta calidad, con cuchillas de acero aleado y templado. Mangos con revestimiento de pintura en polvo. Corte bypass con muelle de apertura.', 13, 4),
(13, 'Set de 18 llaves hexagonales (Allen) ext', 5380, 'Fabricadas en acero al Cr-V, templadas y fosfatada.', 22, 5),
(14, 'Llave combinada con crique milimétrico', 2934, 'Llaves fabricadas en acero especial al Cr-V, con protección a través de un proceso de Ni-Cr, que las hace resistentes a cualquier medio corrosivo en el que se trabaje. Anillo con crique de 72 dientes y 5° de ángulo de acción.', 32, 5),
(15, 'Lave combinada acodada milimétrica', 1345, 'Llaves fabricadas en acero especial al Cr-V, con protección a través de un proceso de Ni-Cr, que las hace resistentes a cualquier medio corrosivo en el que se trabaje. Cabeza acodada para esquivar elementos aledaños a la tuerca a ajustar, y en casos donde el tornillo se encuentra en alojamientos fresados. El anillo estriado y la boca U de paredes estrechas permiten operar perfectamente en áreas reducidas. Todas nuestras llaves combinadas cuentan con el perfil POWERDRIVE, el cual a través de un contacto redondeado permite una excelente transmisión de torsión y máxima distribución de carga, protegiendo tanto las tuercas como a la herramienta.', 15, 5),
(16, 'Caja plástica reforzada', 8100, 'Fabricada con materiales vírgenes. Con manija de aluminio de diseño robusto y bisagras metálicas. Cierres de acero de alta resistencia y agujero pasador para colocar candado. Incluye bandeja removible con 2 organizadores integrados. No incluye herramientas.', 6, 6),
(17, 'Caja plástica premium', 9500, 'Fabricada con materiales vírgenes. Con manija de aluminio de diseño ergonómico y bisagras metálicas. Cierres de acero de alta resistencia y agujero pasador para colocar candado. Incluye bandeja removible con 2 organizadores integrados. No incluye herramientas.', 12, 6),
(18, 'Caja profesional', 6800, 'Fabricada con materiales vírgenes. Cuerpo de plástico transparente con manija y cierre de polipropileno. No icluye herramientas', 4, 6),
(20, 'Pala punta jardinera modificada', 200, 'Ideal para: trabajos hogareños, de jardinería y colocación de plantines, especialmente en suelos duros y pedregosos.', 1, 3),
(21, 'Pala punta corazon', 8500, 'Ideal para: cargar escombros, piedras y arena, limpieza de acequias en suelos arenosos y pedregosos.', 19, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre_c` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `responsable` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre_c`, `tipo`, `responsable`) VALUES
(1, 'Palas', 'Forjadas', 'Juan'),
(2, 'Construccion', 'Tenazas', 'Veronica'),
(3, 'Agro', 'Mechas', 'Alexa'),
(4, 'Frutihortícola', 'Tijeras de poda', 'Ariel'),
(5, 'Mecánica', 'Llaves combinadas', 'Emanuel'),
(6, 'Almacenamiento', 'Cajas', 'Agustin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
