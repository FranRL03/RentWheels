package com.proyecto.rentwheels.alquiler.dto;

import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.usuario.dto.GetClienteDetailsDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;

import java.time.format.DateTimeFormatter;

public record AlquilerDetailsDto(

        String id,
        double precio,
        int kilometrosAnos,
        String fechaCreacion,
        String fechaInicio,
        String fechaFin,
        String origen,
        String destino,
        boolean enAlquiler,
        GetAllDetailsDto vehiculo,
        GetClienteDetailsDto cliente
) {

    public static AlquilerDetailsDto of (Alquiler a){
        return new AlquilerDetailsDto(
                a.getId().toString(),
                a.getPrecio(),
                a.getKilometrosAnos(),
                a.getFechaCreacion().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getFechaInicio().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getFechaFin().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getOrigen(),
                a.getDestino(),
                a.isEnAlquiler(),
                GetAllDetailsDto.of(a.getVehiculo()),
                GetClienteDetailsDto.of(a.getCliente())
        );
    }
}
