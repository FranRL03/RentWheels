package com.proyecto.rentwheels.usuario.service;

import com.proyecto.rentwheels.modelo.exception.NotFoundModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import com.proyecto.rentwheels.vehiculo.dto.EditVehiculoDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.repository.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AdminService {

    private final VehiculoRepository vehiculoRepository;
    private final ModeloRepository modeloRepository;

    public Vehiculo createVehiculo (EditVehiculoDto nuevoVehiculo) {

        Vehiculo v = new Vehiculo();

                v.setImagen(nuevoVehiculo.imagen());
                v.setCombustible(nuevoVehiculo.combustion());
                v.setTransmision(nuevoVehiculo.transmision());
                v.setCapacidadPasajeros(nuevoVehiculo.capacidadPasajeros());
                v.setAutonomia(nuevoVehiculo.autonomia());
                v.setPotencia(nuevoVehiculo.potencia());
                v.setEstado(nuevoVehiculo.estado());
                v.setNumPuertas(nuevoVehiculo.numPuertas());
                v.setDisponible(true);
                v.setPrecioBase(nuevoVehiculo.precioBase());

      Modelo modelo = modeloRepository.findByModeloIgnoreCase(nuevoVehiculo.modelo());

        if (modelo == null)
            throw new NotFoundModeloException();
        else
            v.setModelo(modelo);

        return vehiculoRepository.save(v);
    }

}
