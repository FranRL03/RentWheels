package com.proyecto.rentwheels.usuario.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
    private final ObjectMapper mapper;

    public List<Cliente> getAll () {

        return clienteRepository.findAll();
    }

    public Cliente editCliente (EditClientDto edit, Cliente c, MultipartFile file){
//        Cliente editado = Cliente.builder()
//                .id(c.getId())
//                .username(c.getUsername())
//                .password(c.getPassword())
//                .avatar(edit.avatar())
//                .email(edit.email())
//                .telefono(edit.telefono())
//                .pin(edit.pin())
//                .build();
//        return clienteRepository.save(editado);
        // Actualiza los campos del cliente con los datos del DTO
        c.setEmail(edit.email());
        c.setTelefono(edit.telefono());
        c.setPin(edit.pin());

        // Actualiza el avatar solo si se proporciona un nuevo archivo
            String avatarUrl = storageService.store(file);
            c.setAvatar(avatarUrl);

        return clienteRepository.save(c);
    }

    public Cliente editClient(String cliente,Cliente c,MultipartFile file){
        EditClientDto editClientDto = null;
        try {
            editClientDto = mapper.readValue(cliente,EditClientDto.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return editCliente(editClientDto,c,file);
    }

}
