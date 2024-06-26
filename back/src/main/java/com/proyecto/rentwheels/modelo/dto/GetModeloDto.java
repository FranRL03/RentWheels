package com.proyecto.rentwheels.modelo.dto;

import com.fasterxml.jackson.annotation.JsonView;
import com.proyecto.rentwheels.modelo.jsonview.ModeloView;
import com.proyecto.rentwheels.modelo.model.Modelo;

public record GetModeloDto(
        String id,
        String modelo,
        String logo
) {

    public static GetModeloDto of (Modelo m){
        return new GetModeloDto(
                m.getId().toString(),
                m.getModelo(),
                m.getLogo()
        );
    }
}
