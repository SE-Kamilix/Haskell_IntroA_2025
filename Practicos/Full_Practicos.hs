
-- Resolución de las Guías 1 y 2 - Intro a Algoritmos



-- Guía 1: Expresiones, funciones, tipado y evaluación

-- Ejemplos de expresiones bien formadas:
-- 1 + 2
-- "Hola" ++ " Mundo"
-- [1,2,3] ++ [4,5]

-- Ejemplos de expresiones mal formadas:
-- 1 + "dos" -- Error: no se pueden sumar un número y una cadena
-- [1,2] ++ 3 -- Error: no se puede concatenar una lista y un número

{-
En la terminal Usamos ghci para entrar al interprete de Haskell; asegurense de estar en el directorio correcto, este es:
/Users/kamilosantellan/Desktop/Haskell_Kami/Practicos/practico_01.hs

Comandos de ghci: se usan con (:)

Usando `:t (operador aritmetico)` podemos obtener la definición de tipo de dicho operador aritmetico.

Por Ejemplo:

*) `:t (+)` nos devuelve: (+) :: Num a => a -> a -> a
*) `:t (-)` nos devuelve: (-) :: Num a => a -> a -> a
*) `:t (*)` nos devuelve: (*) :: Num a => a -> a -> a
*) `:t (/)` nos devuelve: (/) :: Fractional a => a -> a -> a
*) `:t (<)` nos devuelve: (<) :: Ord a => a -> a -> Bool
*) `:t (>)` nos devuelve: (>) :: Ord a => a -> a -> Bool
*) `:t (>=)` nos devuelve: (>=) :: Ord a => a -> a -> Bool
*) `:t (<=)` nos devuelve: (<) :: Ord a => a -> a -> Bool
*) `:t (==)` nos devuelve: (==) :: Eq a => a -> a -> Bool
*) `:t (/=)` nos devuelve: (/=) :: Eq a => a -> a -> Bool

`:l <nombre_de_archivo>` para cargar un modulo con funciones (revissar que el archivo tenga `.hs`) 
Esto hacerlo en el directorio correcto, luego de usar `cd` para moverte a la carpeta en donde está tu archivo

-}

--Ejemplo de Funcion de Suma
suma3 :: Int -> Int -> Int -> Int
suma3 x y z = x + y + z

{-
En el Ejemplo anterior, se ve una función de Haskell.

La Función en cuestion es una suma:


.                                                                  
*) Se definen el nombre y los tipos de valores que tomará la Funcion: <nombre> :: <tipos_de_valores>
.                                                                        
*) Se pasa el nombre, los parametros y luego las operaciones que se llevaran a cabo al ejecutar la función: <nombre> <parametros> = <operaciones>

suma3 :: Int -> Int -> Int -> Int   | La función toma 3 elementos Int y devuelve un elemento Int
suma3 x y z = x + y + z             | La Funcion tiene 3 parametros: x y z una vez introducidos se suman como x + y + z



-}

-- Función que calcula el promedio de dos números
promedio :: Float -> Float -> Float
promedio x y = (x + y) / 2
-- Ejemplo de uso: promedio 4.0 6.0 = 5.0

-- Funciones
f :: Int -> Int
f x = x + 1
-- Ejemplo: f 3 = 4

duplicar :: Int -> Int
duplicar x = x * 2
-- Ejemplo: duplicar 4 = 8

por2 :: Int -> Int
por2 = (*2)
-- Ejemplo: por2 5 = 10

multiplicar :: Int -> Int -> Int
multiplicar x y = x * y
-- Ejemplo: multiplicar 3 4 = 12

-- Definiciones de funciones
signo :: Int -> Int
signo x | x > 0     = 1
        | x < 0     = -1
        | otherwise = 0
-- Ejemplo: signo (-5) = -1

entre0y9 :: Int -> Bool
entre0y9 x = x >= 0 && x <= 9
-- Ejemplo: entre0y9 5 = True

rangoPrecio :: Float -> String
rangoPrecio p   | p < 10 = "Barato"
                | p < 50 = "Moderado"
                | otherwise = "Caro"
-- Ejemplo: rangoPrecio 30 = "Moderado"

absoluto :: Int -> Int
absoluto x  | x < 0 = -x
            | otherwise = x
-- Ejemplo: absoluto (-10) = 10

esMultiplo2 :: Int -> Bool
esMultiplo2 x = x `mod` 2 == 0
-- Ejemplo: esMultiplo2 4 = True

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = y `mod` x == 0
-- Ejemplo: esMultiploDe 3 9 = True

esBisiesto :: Int -> Bool
esBisiesto año = (año `mod` 4 == 0 && año `mod` 100 /= 0) || (año `mod` 400 == 0)
-- Ejemplo: esBisiesto 2020 = True

dispersion :: [Int] -> Int
dispersion xs = maximum xs - minimum xs
-- Ejemplo: dispersion [1, 5, 3] = 4

celsiusToFahr :: Float -> Float
celsiusToFahr c = (c * 9/5) + 32
-- Ejemplo: celsiusToFahr 0 = 32

fahrToCelsius :: Float -> Float
fahrToCelsius f = (f - 32) * 5/9
-- Ejemplo: fahrToCelsius 32 = 0

haceFrioF :: Float -> Bool
haceFrioF c = c < 10
-- Ejemplo: haceFrioF 5 = True

-- Tuplas
segundo3 :: (Int, Int, Int) -> Int
segundo3 (_, y, _) = y
-- Ejemplo: segundo3 (1, 2, 3) = 2

rangoPrecioParametrizado :: (Float, Float) -> String
rangoPrecioParametrizado (min, max) | min < 10 = "Barato"
                                    | max < 50 = "Moderado"
                                    | otherwise = "Caro"
-- Ejemplo: rangoPrecioParametrizado (5, 20) = "Barato"

mayor3 :: (Int, Int, Int) -> Int
mayor3 (x, y, z) = max x (max y z)
-- Ejemplo: mayor3 (1, 5, 3) = 5

todosIguales :: (Eq a) => (a, a, a) -> Bool
todosIguales (x, y, z) = x == y && y == z
-- Ejemplo: todosIguales (1, 1, 1) = True


-- Guía 2: Funciones, listas, recursión e inducción

{-
Nuevos tipos de datos:

* Tuplas: son una colección de elementos, de tamaño fija, posiblemente con elementos de diferente tipo.

-(int, Bool, Float) --> (2, True, -4.7)

* Listas:
Una lista (o secuencia) es una colección ordenada de valores,
que deben ser todos del mismo tipo; por ejemplo, [1,2,5].

Representaciones:
* [] -> lista vacía.

* : -> Constructor de listas: que toma un elemento de tipo [a] y una lista de tipo [a] y devuelve una lista de tipo [a]

2:[3, 4] = [2, 3, 4]

!! -> Índice de lista: toma un número y devuelve el elemento de la lista en dicha posición (empieza en 0)

head -> devuelve el primer elemento de una lista. Por ejemplo, head [3,5,7] = 3

length -> longitud de cantidad de elementos que hay en una lista: [] = 0, [x] = 1, [x, y] = 2, etc.

take -> toma un número(n) y una lista y devuelve los primeros (n) números de la lista, como una sublista.

take 2 [7,4,8,9,1] -> [7,4]

drop -> tira los primeros números.

drop 2 [7,4,8,9,1] -> [8,9,1]

++ -> Concatena 2 listas

[7,4,8,9,1] ++ [6,3,2] -> [7,4,8,9,1,6,3,2]

head -> devuelve el primer elemento de una lista. Por ejemplo, head [3,5,7] = 3

Toda lista o es: 
- La lista []
- Una lista que se puede escribir como x:xs, donde x es un elemento y xs el resto de la lista.


-}

-- Evaluaciones paso a paso
-- head [1, 2, 3]
-- { def. de head }
-- = 1

-- tail [1, 2, 3]
-- { def. de tail }
-- = [2, 3]

-- [1, 2, 3] !! 1
-- { def. de !! }
-- = 2

-- take 2 [1, 2, 3, 4]
-- { def. de take }
-- = [1, 2]

-- drop 2 [1, 2, 3, 4]
-- { def. de drop }
-- = [3, 4]

-- [1, 2] ++ [3, 4]
-- { def. de ++ }
-- = [1, 2, 3, 4]

-- Nuevas funciones recursivas
mayoresQue :: Int -> [Int] -> [Int]
mayoresQue n [] = []
mayoresQue n (x:xs) | x > n = x : mayoresQue n xs
                    | otherwise = mayoresQue n xs
-- Ejemplo: mayoresQue 5 [3, 6, 2, 8] = [6, 8]

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (2 * x) : duplica xs
-- Ejemplo: duplica [1, 2, 3] = [2, 4, 6]

multiplica :: [Int] -> Int -> [Int]
multiplica [] _ = []
multiplica (x:xs) n = (x * n) : multiplica xs n
-- Ejemplo: multiplica [1, 2, 3] 2 = [2, 4, 6]

todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True
todosMenores10 (x:xs)   | x < 10 = todosMenores10 xs
                        | otherwise = False
-- Ejemplo: todosMenores10 [1, 2, 3] = True

hay0 :: [Int] -> Bool
hay0 [] = False
hay0 (x:xs) | x == 0 = True
            | otherwise = hay0 xs
-- Ejemplo: hay0 [1, 2, 0] = True

apellidos :: [String] -> String
apellidos [] = ""
apellidos [x] = x
apellidos (x:xs) = x ++ ", " ++ apellidos xs
-- Ejemplo: apellidos ["Juan", "Maria"] = "Juan, Maria"

quitar0s :: [Int] -> [Int]
quitar0s [] = []
quitar0s (0:xs) = quitar0s xs
quitar0s (x:xs) = x : quitar0s xs
-- Ejemplo: quitar0s [0, 1, 0, 2] = [1, 2]

ultimo :: [a] -> a
ultimo [] = error "La lista está vacía"
ultimo [x] = x
ultimo (_:xs) = ultimo xs
-- Ejemplo: ultimo [1, 2, 3] = 3

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]
-- Ejemplo: rev [1, 2, 3] = [3, 2, 1]

listasIguales :: Eq a => [a] -> [a] -> Bool
listasIguales [] [] = True
listasIguales (x:xs) (y:ys) = x == y && listasIguales xs ys
listasIguales _ _ = False
-- Ejemplo: listasIguales [1, 2] [1, 2] = True

mejorNota :: [(String, Int, Int, Int)] -> [(String, Int)]
mejorNota [] = []
mejorNota ((nombre, n1, n2, n3):xs) = (nombre, maximum [n1, n2, n3]) : mejorNota xs
-- Ejemplo: mejorNota [("Juan", 7.0), ("Maria", 9.0), ("Pedro", 8.0)] = "Maria"

incPrim :: [Int] -> [Int]
incPrim [] = []
incPrim (x:xs) = (x + 1) : xs
-- Ejemplo: incPrim [1, 2, 3] = [2, 2, 3]

expandir :: [Int] -> [Int]
expandir [] = []
expandir (x:xs) = replicate x x ++ expandir xs
-- Ejemplo: expandir [2, 3] = [2, 2, 3, 3, 3]

-- Ejercicios de películas
verTodas :: [(String, Int)] -> [String]
verTodas [] = []
verTodas ((nombre, _):xs) = nombre : verTodas xs
-- Ejemplo: verTodas [("Pelicula1", 120), ("Pelicula2", 90)] = ["Pelicula1", "Pelicula2"]

estrenos :: [(String, Int)] -> [String]
estrenos [] = []
estrenos ((nombre, anio):xs)    | anio == 2023 = nombre : estrenos xs
                                | otherwise = estrenos xs
-- Ejemplo: estrenos [("Pelicula1", 2023), ("Pelicula2", 2022)] = ["Pelicula1"]

filmografia :: String -> [(String, Int)] -> [String]
filmografia _ [] = []
filmografia actor ((nombre, anio):xs) = if actorEnPelicula actor nombre then nombre : filmografia actor xs else filmografia actor xs
    where actorEnPelicula actor nombre = True -- Simulación
-- Ejemplo: filmografia "Actor1" [("Pelicula1", 2020), ("Pelicula2", 2021)] = ["Pelicula1", "Pelicula2"]

duracion :: [(String, Int)] -> Int
duracion [] = 0
duracion ((_, dur):xs) = dur + duracion xs
-- Ejemplo: duracion [("Pelicula1", 120), ("Pelicula2", 90)] = 210

-- Ejercicios de ventas
precioMaquina :: [(String, Int)] -> String -> Int
precioMaquina [] _ = error "Máquina no encontrada"
precioMaquina ((nombre, precio):xs) buscado | nombre == buscado = precio
                                            | otherwise = precioMaquina xs buscado
-- Ejemplo: precioMaquina [("Maquina1", 1000), ("Maquina2", 2000)] "Maquina1" = 1000

cantVentasComponente :: [(String, Int)] -> String -> Int
cantVentasComponente [] _ = 0
cantVentasComponente ((nombre, cantidad):xs) buscado    | nombre == buscado = cantidad + cantVentasComponente xs buscado
                                                        | otherwise = cantVentasComponente xs buscado
-- Ejemplo: cantVentasComponente [("Componente1", 5), ("Componente2", 3), ("Componente1", 2)] "Componente1" = 7

vendedorDelMes :: [(String, Int)] -> String
vendedorDelMes ((nombre, ventas):xs) = mejorVendedor nombre ventas xs
    where                                       -- Lo explico más abajo
    mejorVendedor actual mejorVentas [] = actual
    mejorVendedor actual mejorVentas ((n, v):xs)
        | v > mejorVentas = mejorVendedor n v xs
        | otherwise       = mejorVendedor actual mejorVentas xs
-- Ejemplo: vendedorDelMes [("Juan", 10), ("Maria", 15), ("Pedro", 12)] = "Maria"

ventasMes :: [(String, Int)] -> String -> Int
ventasMes [] _ = 0
ventasMes ((nombre, cantidad):xs) mes   | nombre == mes = cantidad + ventasMes xs mes
                                        | otherwise = ventasMes xs mes
-- Ejemplo: ventasMes [("Mes1", 5), ("Mes2", 3), ("Mes1", 2)] "Mes1" = 7

ventasVendedor :: [(String, Int)] -> String -> Int
ventasVendedor [] _ = 0
ventasVendedor ((nombre, cantidad):xs) buscado | nombre == buscado = cantidad + ventasVendedor xs buscado
                                                | otherwise = ventasVendedor xs buscado
-- Ejemplo: ventasVendedor [("Vendedor1", 5), ("Vendedor2", 3), ("Vendedor1", 2)] "Vendedor1" = 7

huboVentas :: [(String, Int)] -> Bool
huboVentas [] = False
huboVentas ((_, cantidad):xs)   | cantidad > 0 = True
                                | otherwise = huboVentas xs
-- Ejemplo: huboVentas [("Vendedor1", 0), ("Vendedor2", 3)] = True

--Pequeño Extra:

{- Explicación de `where` en Haskell:

    El bloque `where` se usa para definir variables o funciones auxiliares dentro del contexto
    de una función principal. Todo lo que se define en un `where` sólo se puede usar dentro de esa función.
    Es útil para organizar mejor el código, evitar repeticiones y aumentar la claridad.

    Ejemplo 1: uso simple de `where`
    areaCirculo :: Float -> Float
    areaCirculo r = pi * cuadrado r
        where
            cuadrado x = x * x

    En este caso, `cuadrado` es una función auxiliar que sólo se usa dentro de `areaCirculo`.

    Ejemplo 2: uso de `where` con recursión auxiliar
    vendedorDelMes :: [(String, Int)] -> String
    vendedorDelMes ((nombre, ventas):xs) = mejorVendedor nombre ventas xs
        where
            mejorVendedor actual maxVentas [] = actual
            mejorVendedor actual maxVentas ((n, v):resto)   | v > maxVentas = mejorVendedor n v resto
                                                            | otherwise     = mejorVendedor actual maxVentas resto

    Acá `mejorVendedor` es una función auxiliar recursiva que compara ventas y va quedándose
    con el nombre del mejor vendedor. Está contenida dentro de `vendedorDelMes`.

    Ventajas:
    - Evita contaminar el espacio global con funciones que sólo se usan localmente.
    - Organiza el código de forma más clara.
    - Permite definir múltiples ayudas locales (variables o funciones) con acceso a los argumentos de la función principal.
-}