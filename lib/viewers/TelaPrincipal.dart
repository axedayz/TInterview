import 'package:app_tinterview/database/db_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/controllers/CustomDrawer.dart';
import 'filtros/Filtro_FrontEnd.dart';
import 'filtros/Filtro_BackEnd.dart';
import 'filtros/Filtro_Mobile.dart';
import 'filtros/Filtro_Banco.dart';

import 'ScrollCircle.dart';
import 'Square.dart';

class TelaPrincipal extends StatefulWidget {
// * FUNÇÃO AppBAR
  return_AppBar() {
    return AppBar(
      backgroundColor: Color(0xFF222222),
      centerTitle: true,
      title: Image.asset(
        "images/logo.png",
        width: 48,
        height: 48,
      ),
    );
  }

// * FUNÇÃO ANÚNCIO
  return_Anuncio() {
    return InkWell(
      onTap: () {
        print('Anúncio clicado!'); // Ação do anúncio quando for clicado
      },
      child: Container(
        width: 385,
        height: 100,
        color: Colors.grey,
        child: const Center(
          child: Text(
            'Anúncio', // Conteúdo da caixa de anúncio
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  String _pesquisa = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 90,
        ),
      ),

      endDrawer: const CustomDrawer(), //MENU

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // * CAIXA DE PESQUISA
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (valor) {
                  _pesquisa = valor.toUpperCase();
                },
                decoration: InputDecoration(
                  hintText: 'Digite uma tecnologia',
                  hintStyle: TextStyle(color: Colors.grey[700], fontSize: 19),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.all(4.0),
                    icon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 51, 49, 49),
                      size: 45,
                    ),
                    onPressed: () async {
                      var dados = await DBFirestore().queryTech(_pesquisa);
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Square(dados_bd: dados)));
                    },
                  ),
                  labelStyle: const TextStyle(color: Color(0xFF222222)),
                  suffixStyle: const TextStyle(color: Color(0xFF222222)),
                  filled: true,
                  fillColor: const Color(0xFFE5E5E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            // * LISTA HORIZONATAL DE TECNOLOGIAS OU 'STORIES'KKK
            SizedBox(
              height: 80,
              child: ListView.builder(
                  itemCount: DBFirestore().lista_techs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, Index) {
                    return ScrollCircle(
                      linguagem: DBFirestore().lista_techs[Index],
                    );
                  }),
            ),

            const SizedBox(height: 18),
            InkWell(
              onTap: () {
                // Ação do anúncio quando for clicado
                print('Anúncio clicado!');
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 16), // Adicione a margem lateral desejada
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(
                        10), // Define a borda arredondada com um raio de 10
                  ),
                  child: const Center(
                    child: Text(
                      'Anúncio', // Conteúdo da caixa de anúncio
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // * BOTÃO FRONTEND

                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Filtro_FrontEnd()));
                  },
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(2, 2))
                      ],
                      color: const Color(0xFF363533),
                    ),
                    child: const Center(
                      child: Text(
                        'Frontend',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFeeeeee),
                        ),
                      ),
                    ),
                  ),
                ),

                // * BOTÃO BACKEND

                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Filtro_BackEnd()));
                  },
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(-2, 2))
                      ],
                      color: const Color(0xFF363533),
                    ),
                    child: const Center(
                      child: Text(
                        'Backend',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFeeeeee),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Column(children: <Widget>[
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Filtro_Mobile()));
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: const Color(0xFF363533),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: const Offset(2, -2))
                          ]),
                      child: const Center(
                        child: Text(
                          'Mobile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFFeeeeee),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Filtro_Banco()));
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 1,
                              offset: const Offset(-2, -2))
                        ],
                        color: const Color(0xFF363533),
                      ),
                      child: const Center(
                        child: Text(
                          'Banco de dados',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFFeeeeee),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),

            const SizedBox(height: 22)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(TelaPrincipal());
}
