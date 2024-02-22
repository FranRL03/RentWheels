package com.proyecto.rentwheels.usuario.service;

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

}
