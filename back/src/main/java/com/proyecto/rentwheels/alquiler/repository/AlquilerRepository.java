package com.proyecto.rentwheels.alquiler.repository;

import com.proyecto.rentwheels.alquiler.dto.GetAlquileresCliente;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface AlquilerRepository extends JpaRepository<Alquiler, UUID> {

    @Query("""
            select a
            from Alquiler a
            where a.cliente.id = :id
            """)
    Page<GetAlquileresCliente> getAllAlquileresCliente(Pageable pageable, UUID id);
}
