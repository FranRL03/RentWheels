package com.proyecto.rentwheels.usuario.service;

import com.proyecto.rentwheels.usuario.dto.EditClientDto;
import com.proyecto.rentwheels.usuario.model.Cliente;
import com.proyecto.rentwheels.usuario.repository.ClienteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class ClienteService {

    private final ClienteRepository clienteRepository;

    public List<Cliente> getAll () {

        return clienteRepository.findAll();
    }

    public Cliente editCliente (EditClientDto edit, Cliente c){
        Cliente editado = Cliente.builder()
                .id(c.getId())
                .username(c.getUsername())
                .password(c.getPassword())
                .avatar(edit.avatar())
                .email(edit.email())
                .telefono(edit.telefono())
                .pin(edit.pin())
                .build();
        return clienteRepository.save(editado);
    }

}
