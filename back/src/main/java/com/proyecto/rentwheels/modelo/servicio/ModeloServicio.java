package com.proyecto.rentwheels.modelo.servicio;

import com.proyecto.rentwheels.modelo.exception.EmptyModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ModeloServicio {

    private final ModeloRepository modeloRepository;

    public Page<Modelo> getAll (Pageable pageable){

        return modeloRepository.findAll(pageable);
    }

    public Page<Vehiculo> getVehiculoModelo(String nombreModelo, Pageable pageable) {
        Page<Vehiculo> vehiculos = modeloRepository.getVehiculoModelo(nombreModelo.toLowerCase(), pageable);

        if (vehiculos.isEmpty())
            throw  new EmptyModeloException();

        return vehiculos;
    }

    public int vehiculosDeUnModelo(UUID idModelo) {

        return modeloRepository.cantidadVehiculosDeUnModelo(idModelo);
    }




}
