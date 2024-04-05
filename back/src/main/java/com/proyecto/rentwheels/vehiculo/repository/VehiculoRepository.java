package com.proyecto.rentwheels.vehiculo.repository;

import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface VehiculoRepository extends JpaRepository<Vehiculo, UUID> {

    @Query("""
            select v from Vehiculo v
            """)
    Page<Vehiculo> findAll(Pageable pageable);

    @Query("""
            select count(v)
            from Vehiculo v
            where v.id = ?1
            and v.disponible = true
            """)
    int comprobarDisponibilidad(UUID id);
}
