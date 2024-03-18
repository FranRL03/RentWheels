package com.proyecto.rentwheels.alquiler.service;

import com.proyecto.rentwheels.alquiler.dto.CreateAlquilerDto;
import com.proyecto.rentwheels.alquiler.dto.GetAlquileresCliente;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.alquiler.repository.AlquilerRepository;
import com.proyecto.rentwheels.usuario.model.Cliente;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNoDisponibleException;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNotFoundException;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.repository.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AlquilerServicio {

    private final AlquilerRepository alquilerRepository;
    private final VehiculoRepository vehiculoRepository;

    public Page<GetAlquileresCliente> getAlquileresCliente (Pageable pageable, UUID id){
        return alquilerRepository.getAllAlquileresCliente(pageable, id);
    }

    public Page<GetAlquileresCliente> getAlquileresRentCliente (Pageable pageable, UUID id, boolean statusRent){
        return alquilerRepository.getAlquileresActivosCliente(pageable, id, statusRent);
    }

    public Alquiler createAlquiler (String idVehiculo, Cliente c, CreateAlquilerDto create) {

        Optional<Vehiculo> disponible = vehiculoRepository.findById(UUID.fromString(idVehiculo));

        if (disponible.isPresent()) {
             Vehiculo v = disponible.get();

             if (v.isDisponible()) {
                 if (create.fechaInicio().isAfter(create.fechaFin())) {
                     throw new IllegalArgumentException("La fecha de inicio no puede ser posterior a la fecha fin");
                 }

                 v.setDisponible(false);
                 vehiculoRepository.save(v);

                 Alquiler a = Alquiler.builder()
                         .precio(precioPorKilometro(v, create))
                         .kilometrosAnos(create.kilometrosAnos())
                         .fechaInicio(create.fechaInicio())
                         .fechaFin(create.fechaFin())
                         .enAlquiler(true)
                         .vehiculo(v)
                         .cliente(c)
                         .build();

                 alquilerRepository.save(a);

                 return a;
             }

        } else {
            throw new VehiculoNotFoundException(idVehiculo);
        }

        throw new VehiculoNoDisponibleException();
    }

    private double precioPorKilometro (Vehiculo v, CreateAlquilerDto create) {
        if (create.kilometrosAnos() <= 20000)
            return v.getPrecioBase();
        else if (create.kilometrosAnos() > 20000 && create.kilometrosAnos() <=30000)
            return v.getPrecioBase() + 100;

        return v.getPrecioBase() + 150;
    }

}
