package com.proyecto.rentwheels.usuario.service;

import com.proyecto.rentwheels.modelo.exception.NotFoundModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import com.proyecto.rentwheels.vehiculo.dto.EditVehiculoDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNoDisponibleException;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNotFoundException;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.repository.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

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

    public Vehiculo editVehiculo (EditVehiculoDto edit, UUID idVehiculo){

        Vehiculo v = vehiculoRepository.findById(idVehiculo)
                .orElseThrow(() -> new VehiculoNotFoundException(idVehiculo.toString()));

        if (!v.isDisponible()) {
            throw new VehiculoNoDisponibleException();
        } else {
            v.setImagen(edit.imagen());
            v.setCombustible(edit.combustion());
            v.setTransmision(edit.transmision());
            v.setCapacidadPasajeros(edit.capacidadPasajeros());
            v.setAutonomia(edit.autonomia());
            v.setPotencia(edit.potencia());
            v.setEstado(edit.estado());
            v.setNumPuertas(edit.numPuertas());
            v.setPrecioBase(edit.precioBase());
        }

        return vehiculoRepository.save(v);

    }

    public void deleteVehiculo(UUID idVehiculo) {

    int num = vehiculoRepository.comprobarDisponibilidad(idVehiculo);

    if(num == 0)
        throw new VehiculoNoDisponibleException();
    else
        vehiculoRepository.deleteById(idVehiculo);

    }

}