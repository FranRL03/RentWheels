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
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AlquilerServicio {

    private final AlquilerRepository alquilerRepository;
    private final VehiculoRepository vehiculoRepository;

//    public Page<GetAlquileresCliente> getAlquileresCliente (Pageable pageable, UUID id){
//        return alquilerRepository.getAllAlquileresCliente(pageable, id);
//    }

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
                         .precio(precioPorSemana(v, create))
                         .kilometrosAnos(create.kilometrosAnos())
                         .fechaCreacion(LocalDate.now())
                         .fechaInicio(create.fechaInicio())
                         .fechaFin(create.fechaFin())
                         .origen(create.origen())
                         .destino(create.destino())
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

    private double precioPorSemana(Vehiculo v, CreateAlquilerDto create) {
        long totalDias = ChronoUnit.DAYS.between(create.fechaInicio(), create.fechaFin());

        if (totalDias >= 7 && totalDias <= 30) {

            int semanas = (int) totalDias / 7;
            double descuentoPorSemanas = semanas * (v.getPrecioBase() * 0.05);

            return v.getPrecioBase() - descuentoPorSemanas;
        } else if (totalDias > 30) {

            int meses = (int) totalDias / 30;
            double descuentoPorMes = meses * (v.getPrecioBase() * 0.15);

            int diasRestantes = (int) totalDias % 30;
            int semanasRestantes = diasRestantes / 7;
            double descuentoPorSemanas = semanasRestantes * (v.getPrecioBase() * 0.05);

            return v.getPrecioBase() - descuentoPorMes - descuentoPorSemanas;
        } else {

            return v.getPrecioBase();
        }
    }

}
