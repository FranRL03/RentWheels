package com.proyecto.rentwheels.usuario.dto;

import com.proyecto.rentwheels.usuario.model.Cliente;

public record GetClienteDetailsDto(

        String id,
        String username,
        String avatar,
        String email,
        String telefono,
        String pin
) {

    public static GetClienteDetailsDto of(Cliente c){
        return new GetClienteDetailsDto(
                c.getId().toString(),
                c.getUsername(),
                c.getAvatar(),
                c.getEmail(),
                c.getTelefono(),
                c.getPin()
        );
    }
}
