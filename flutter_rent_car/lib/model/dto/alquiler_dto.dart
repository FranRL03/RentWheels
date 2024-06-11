class AlquilerDto {
  String? fechaInicio;
  String? fechaFin;
  String? origen;
  String? destino;

  AlquilerDto({this.fechaInicio, this.fechaFin, this.origen, this.destino});

  AlquilerDto.fromJson(Map<String, dynamic> json) {
    fechaInicio = json['fechaInicio'];
    fechaFin = json['fechaFin'];
    origen = json['origen'];
    destino = json['destino'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fechaInicio'] = this.fechaInicio;
    data['fechaFin'] = this.fechaFin;
    data['origen'] = this.origen;
    data['destino'] = this.destino;
    return data;
  }
}
