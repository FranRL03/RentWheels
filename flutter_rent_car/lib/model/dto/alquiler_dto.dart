class AlquilerDto {
  String? kilometrosPorAno;
  String? fechaInicio;
  String? fechaFin;
  String? precio;


  AlquilerDto(
      {this.kilometrosPorAno,
      this.fechaInicio,
      this.fechaFin,
      this.precio
});

  AlquilerDto.fromJson(Map<String, dynamic> json) {
    kilometrosPorAno = json['kilometrosPorAno'];
    fechaInicio = json['fechaInicio'];
    fechaFin = json['fechaFin'];
    precio = json['precio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usernkilometrosPorAnoame'] = this.kilometrosPorAno;
    data['fechaInicio'] = this.fechaInicio;
    data['fechaFin'] = this.fechaFin;
    data['precio'] = this.precio;
    return data;
  }
}
