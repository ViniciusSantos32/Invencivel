class Trem {
  final int id_trem;
  final String nome_trem;
  final String cor_trem;
  final String vagao_trem;
  final double velocidade_trem;
  final double kmRodado_trem;
  final String lugarVisitado_trem;
  final double valorPassagem_trem;
  final String atraso_trem;
  final String onde_trem;
  final String proxParada_trem;
  final String demora_trem;

  Trem({
    required this.id_trem,
    required this.nome_trem,
    required this.cor_trem,
    required this.vagao_trem,
    required this.velocidade_trem,
    required this.kmRodado_trem,
    required this.lugarVisitado_trem,
    required this.valorPassagem_trem,
    required this.atraso_trem,
    required this.onde_trem,
    required this.proxParada_trem,
    required this.demora_trem,
  });

  factory Trem.fromJson(Map<String, dynamic> json) {
    return Trem(
      id_trem: json["id_trem"] ?? 0,
      nome_trem: json["nome_trem"] ?? "",
      cor_trem: json["cor_trem"] ?? "",
      vagao_trem: json["vagao_trem"] ?? "",
      velocidade_trem: (json["velocidade_trem"] ?? 0).toDouble(),
      kmRodado_trem: (json["kmRodado_trem"] ?? 0).toDouble(),
      lugarVisitado_trem: json["lugarVisitado_trem"] ?? "",
      valorPassagem_trem: (json["valorPassagem_trem"] ?? 0).toDouble(),
      atraso_trem: json["atraso_trem"] ?? "",
      onde_trem: json["onde_trem"] ?? "",
      proxParada_trem: json["proxParada_trem"] ?? "",
      demora_trem: json["demora_trem"] ?? "",
    );
  }
}
