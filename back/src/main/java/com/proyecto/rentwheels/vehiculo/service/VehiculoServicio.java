package com.proyecto.rentwheels.vehiculo.service;

import com.proyecto.rentwheels.vehiculo.exception.EmptyVehiculosListException;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNotFoundException;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.repository.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class VehiculoServicio {

    private final VehiculoRepository vehiculoRepository;

    public List<Vehiculo> findAllList (){

        List<Vehiculo> vehiculos = vehiculoRepository.findAll();

        if (vehiculos.isEmpty())
            throw new EmptyVehiculosListException();

        return vehiculos;
    }

    public Vehiculo details (String id) {

        Optional<Vehiculo> v = vehiculoRepository.findById(UUID.fromString(id));

        if (v.isPresent())
            return v.get();

        throw new VehiculoNotFoundException(id);
    }

}
