package com.proyecto.rentwheels.modelo.repositorio;

import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ModeloRepository extends JpaRepository<Modelo, UUID> {

    @Query("""
            select v
            from Vehiculo v
            where lower(v.modelo.modelo) = lower(?1)
            """)
    List<Vehiculo> getVehiculoModelo (String nombreModelo);

    Modelo findByModeloIgnoreCase(String nombreModelo);
}
