package com.proyecto.rentwheels.usuario.service;

import com.proyecto.rentwheels.files.service.StorageService;
import com.proyecto.rentwheels.usuario.dto.EditClientDto;
import com.proyecto.rentwheels.usuario.model.Cliente;
import com.proyecto.rentwheels.usuario.repository.ClienteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Service
@RequiredArgsConstructor
public class ClienteService {

    private final ClienteRepository clienteRepository;
    private final StorageService storageService;

    public List<Cliente> getAll () {

        return clienteRepository.findAll();
    }

    public Cliente editCliente (EditClientDto edit, Cliente c){

        c.setAvatar(edit.avatar());
        c.setEmail(edit.email());
        c.setTelefono(edit.telefono());
        c.setPin(edit.pin());

        return clienteRepository.save(c);
    }

}
