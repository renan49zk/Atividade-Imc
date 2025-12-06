import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int contador = 0;

  void decremento() {
    setState(() {
      contador--;
    });
    
    print(contador);
  }

  void incremento() {
    setState(() {
      contador++;
    });
    print(contador);
  }
    bool get isEmpty => contador == 0;
    bool get isFull => contador == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pessoasandando.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(

              isFull? "Lotado" : "Pode entrar!",
              style: TextStyle(
                fontSize: 26,
                color: isFull ? Colors.red : const Color.fromARGB(255, 4, 87, 154),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              contador.toString(),
              style: TextStyle(
                fontSize: 80,
                color: isFull? Colors.red : const Color.fromARGB(255, 4, 87, 154),
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty? null: decremento,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty? Colors.blue.withOpacity(0.2): Colors.blue,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Sair',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull? null : incremento,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull?  Colors.red.withOpacity(0.2) : Colors.blue,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}