package com.proyecto.rentwheels.modelo.dto;

import com.proyecto.rentwheels.modelo.model.Modelo;

public record GetModeloDto(
        String modelo
) {

    public static GetModeloDto of (Modelo m){
        return new GetModeloDto(
                m.getModelo()
        );
    }
}
