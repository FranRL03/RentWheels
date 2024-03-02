package com.proyecto.rentwheels.modelo.servicio;

import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ModeloServicio {

    private final ModeloRepository modeloRepository;

    public Page<Modelo> getAll (Pageable pageable){

        return modeloRepository.findAll(pageable);
    }
}
