import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoApp());
}

class Vehiculo {
  final String nombre;
  final String marca;
  final String motor;
  final String potencia;
  final String velocidad;
  final String pintura;
  final String colores;
  final Color color;
  final bool esMoto;

  const Vehiculo({
    required this.nombre,
    required this.marca,
    required this.motor,
    required this.potencia,
    required this.velocidad,
    required this.pintura,
    required this.colores,
    required this.color,
    required this.esMoto,
  });
}

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Vehículos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Vehiculo> vehiculos = const [

    Vehiculo(
      nombre: "Yamaha MT-09",
      marca: "Yamaha",
      motor: "889 cc",
      potencia: "119 HP",
      velocidad: "240 km/h",
      pintura: "DPBMC",
      colores: "Azul, Negro, Blanco",
      color: Colors.blue,
      esMoto: true,
    ),

    Vehiculo(
      nombre: "Honda Hornet 600",
      marca: "Honda",
      motor: "599 cc",
      potencia: "102 HP",
      velocidad: "225 km/h",
      pintura: "R-157",
      colores: "Rojo, Negro, Gris",
      color: Colors.red,
      esMoto: true,
    ),

    Vehiculo(
      nombre: "Yamaha XJ6",
      marca: "Yamaha",
      motor: "600 cc",
      potencia: "77 HP",
      velocidad: "210 km/h",
      pintura: "SMX",
      colores: "Azul, Negro",
      color: Colors.indigo,
      esMoto: true,
    ),

    Vehiculo(
      nombre: "BMW S1000RR",
      marca: "BMW",
      motor: "999 cc",
      potencia: "210 HP",
      velocidad: "299 km/h",
      pintura: "Light White",
      colores: "Rojo, Azul, Blanco",
      color: Colors.black,
      esMoto: true,
    ),

    Vehiculo(
      nombre: "Yamaha RX115",
      marca: "Yamaha",
      motor: "115 cc",
      potencia: "16 HP",
      velocidad: "140 km/h",
      pintura: "Vivid Red",
      colores: "Negro, Plata",
      color: Colors.orange,
      esMoto: true,
    ),

    Vehiculo(
      nombre: "Suzuki AX115",
      marca: "Suzuki",
      motor: "113 cc",
      potencia: "13 HP",
      velocidad: "120 km/h",
      pintura: "Suzuki Blue",
      colores: "Blanco, Negro",
      color: Colors.green,
      esMoto: true,
    ),

    Vehiculo(
      nombre: "Mazda CX-50",
      marca: "Mazda",
      motor: "2500 cc",
      potencia: "187 HP",
      velocidad: "210 km/h",
      pintura: "Soul Red Crystal",
      colores: "Rojo, Negro, Gris",
      color: Colors.deepOrange,
      esMoto: false,
    ),

    Vehiculo(
      nombre: "Mazda CX-30",
      marca: "Mazda",
      motor: "2000 cc",
      potencia: "153 HP",
      velocidad: "195 km/h",
      pintura: "Machine Gray",
      colores: "Gris, Negro",
      color: Colors.purple,
      esMoto: false,
    ),

    Vehiculo(
      nombre: "Mercedes Benz Cabrio",
      marca: "Mercedes",
      motor: "3000 cc",
      potencia: "362 HP",
      velocidad: "250 km/h",
      pintura: "Polar White",
      colores: "Blanco, Rojo, Negro",
      color: Colors.grey,
      esMoto: false,
    ),
  ];

  void abrir(BuildContext context, Vehiculo vehiculo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetallePage(
          vehiculo: vehiculo,
        ),
      ),
    );
  }

  Widget item(BuildContext context, Vehiculo v) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      color: v.color,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,

          child: Icon(
            v.esMoto
                ? Icons.two_wheeler
                : Icons.directions_car,
            color: Colors.black,
          ),
        ),

        title: Text(
          v.nombre,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        subtitle: Text(
          "Motor: ${v.motor}",
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),

        onTap: () => abrir(context, v),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Vehículos"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: vehiculos.length,
        itemBuilder: (context, index) {
          return item(context, vehiculos[index]);
        },
      ),
    );
  }
}

class DetallePage extends StatelessWidget {
  final Vehiculo vehiculo;

  const DetallePage({
    super.key,
    required this.vehiculo,
  });

  Widget dato(IconData icono, String texto) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6),

      child: ListTile(
        leading: Icon(
          icono,
          color: Colors.blue,
        ),

        title: Text(
          texto,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehiculo.nombre),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: vehiculo.color,

              child: Icon(
                vehiculo.esMoto
                    ? Icons.two_wheeler
                    : Icons.directions_car,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              vehiculo.nombre,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            dato(Icons.business,
                "Marca: ${vehiculo.marca}"),

            dato(Icons.settings,
                "Motor: ${vehiculo.motor}"),

            dato(Icons.speed,
                "Potencia: ${vehiculo.potencia}"),

            dato(Icons.flash_on,
                "Velocidad Máxima: ${vehiculo.velocidad}"),

            dato(Icons.color_lens,
                "Código pintura: ${vehiculo.pintura}"),

            dato(Icons.palette,
                "Colores disponibles: ${vehiculo.colores}"),
          ],
        ),
      ),
    );
  }
}