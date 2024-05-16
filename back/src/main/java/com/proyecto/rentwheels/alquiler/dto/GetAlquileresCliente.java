package com.proyecto.rentwheels.alquiler.dto;

import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;

import java.time.format.DateTimeFormatter;

public record GetAlquileresCliente(
      String id,
      double precio,
      int kilometrosAnos,
      String fechaCreacion,
      String fechaInicio,
      String fechaFin,
      String origen,
      String destino,
      boolean enAlquiler,
      GetAllDetailsDto vehiculo

) {

    public static GetAlquileresCliente of (Alquiler a){
        return new GetAlquileresCliente(
                a.getId().toString(),
                a.getPrecio(),
                a.getKilometrosAnos(),
                a.getFechaCreacion().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getFechaInicio().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getFechaFin().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getOrigen(),
                a.getDestino(),
                a.isEnAlquiler(),
                GetAllDetailsDto.of(a.getVehiculo())

        );
    }
}
