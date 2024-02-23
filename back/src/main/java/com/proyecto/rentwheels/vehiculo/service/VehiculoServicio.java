package com.proyecto.rentwheels.vehiculo.service;

import com.proyecto.rentwheels.vehiculo.dto.GetFindAllDto;
import com.proyecto.rentwheels.vehiculo.exception.EmptyVehiculosListException;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.repository.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class VehiculoServicio {

    private VehiculoRepository vehiculoRepository;

    public Page<Vehiculo> findAll (Pageable pageable){

        Page<Vehiculo> vehiculos = vehiculoRepository.findAll(pageable);

        if (vehiculos.isEmpty())
            throw new EmptyVehiculosListException();

        return vehiculos;
    }


}
