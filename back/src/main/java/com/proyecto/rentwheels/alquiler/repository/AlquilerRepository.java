package com.proyecto.rentwheels.alquiler.repository;

import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.modelo.model.Modelo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AlquilerRepository extends JpaRepository<Alquiler, UUID> {
}
