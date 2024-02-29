package com.proyecto.rentwheels.modelo.servicio;

import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ModeloServicio {

    private final ModeloRepository modeloRepository;

    public List<Modelo> getAll (){

        return modeloRepository.findAll();
    }
}
