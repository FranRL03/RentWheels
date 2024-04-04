package com.proyecto.rentwheels.usuario.service.AdminService;

import com.proyecto.rentwheels.modelo.exception.EmptyModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminModeloService {

    private final ModeloRepository modeloRepository;

    public Page<Modelo> getAll (Pageable pageable){

        return modeloRepository.findAll(pageable);
    }

    public List<Modelo> getAllWithoutPage(){

        List<Modelo> modelos = modeloRepository.findAll();

        if (modelos.isEmpty())
            throw  new EmptyModeloException();

        return modelos;
    }

}
