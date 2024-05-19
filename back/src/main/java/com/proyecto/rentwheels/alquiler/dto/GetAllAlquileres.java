package com.proyecto.rentwheels.alquiler.dto;

import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.usuario.dto.GetClienteDetailsDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;

import java.time.format.DateTimeFormatter;

public record GetAllAlquileres(
        String id,
        String fechaInicio,
        String fechaFin,
        String origen,
        String destino,
        boolean enAlquiler,
        GetClienteDetailsDto cliente
) {

    public static GetAllAlquileres of (Alquiler a){
        return new GetAllAlquileres(
                a.getId().toString(),
                a.getFechaInicio().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getFechaFin().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")),
                a.getOrigen(),
                a.getDestino(),
                a.isEnAlquiler(),
                GetClienteDetailsDto.of(a.getCliente())

        );
    }
}
