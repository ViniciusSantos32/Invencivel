import 'package:flutter/material.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Trem.dart';
import 'package:invencivelemtfodasimfdsovinicius/models/Trem.dart';

class Desempenho extends StatefulWidget {
  @override
  State<Desempenho> createState() => _DesempenhoState();
}

class _DesempenhoState extends State<Desempenho> {
  late Future<List<String>> futureTrens;
  String? tremSelecionado;

  Trem? dadosTrem; 
  bool carregandoDados = false;

  @override
  void initState() {
    super.initState();
    futureTrens = buscarTrens(); // carrega só os nomes
  }

  Future<void> carregarDados(String nome) async {
    setState(() {
      carregandoDados = true;
    });

    try {
      dadosTrem = await ObterDadosTremPorNome(nome);
    } catch (e) {
      print("Erro ao buscar dados do trem: $e");
    }

    setState(() {
      carregandoDados = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desempenho dos Trens"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --------------------------
            //  DROPDOWN — BUSCA NOMES
            // --------------------------
            FutureBuilder<List<String>>(
              future: futureTrens,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                final nomes = snapshot.data!;

                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Selecione um Trem",
                    border: OutlineInputBorder(),
                  ),
                  value: tremSelecionado,
                  items: nomes.map((nome) {
                    return DropdownMenuItem(
                      value: nome,
                      child: Text(nome),
                    );
                  }).toList(),
                  onChanged: (valor) {
                    setState(() {
                      tremSelecionado = valor;
                    });
                    carregarDados(valor!);
                  },
                );
              },
            ),

            SizedBox(height: 20),

            // --------------------------
            //  STATUS DE CARREGAMENTO
            // --------------------------
            if (carregandoDados)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 10),
                  Text("Carregando dados...")
                ],
              ),

            // --------------------------
            //  EXIBIR TREM SELECIONADO
            // --------------------------
            if (dadosTrem != null && !carregandoDados)
              Expanded(
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.only(top: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        Text(
                          dadosTrem!.nome_trem,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text("Cor: ${dadosTrem!.cor_trem}"),
                        Text("Vagão: ${dadosTrem!.vagao_trem}"),
                        Text("Velocidade: ${dadosTrem!.velocidade_trem} km/h"),
                        Text("KM Rodado: ${dadosTrem!.kmRodado_trem} km"),
                        Text("Lugar Visitado: ${dadosTrem!.lugarVisitado_trem}"),
                        Text("Valor Passagem: R\$ ${dadosTrem!.valorPassagem_trem}"),
                        Text("Atraso: ${dadosTrem!.atraso_trem}"),
                        Text("Onde: ${dadosTrem!.onde_trem}"),
                        Text("Próxima parada: ${dadosTrem!.proxParada_trem}"),
                        Text("Demora estimada: ${dadosTrem!.demora_trem}"),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
