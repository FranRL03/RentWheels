class AlquilerDto {
  int? kilometrosAnos;
  String? fechaInicio;
  String? fechaFin;
  // double? precio;

  AlquilerDto(
      {this.kilometrosAnos, this.fechaInicio, this.fechaFin
      // , this.precio
      });

  AlquilerDto.fromJson(Map<String, dynamic> json) {
    kilometrosAnos = json['kilometrosAnos'];
    fechaInicio = json['fechaInicio'];
    fechaFin = json['fechaFin'];
    // precio = json['precio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kilometrosAnos'] = this.kilometrosAnos;
    data['fechaInicio'] = this.fechaInicio;
    data['fechaFin'] = this.fechaFin;
    // data['precio'] = this.precio;
    return data;
  }
}
