package com.proyecto.rentwheels.vehiculo.repository;

import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface VehiculoRepository extends JpaRepository<Vehiculo, UUID> {

}
